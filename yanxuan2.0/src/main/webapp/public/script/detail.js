/**
 * @author: llk
 * @date: 2018/7/30
 * @function: 商品详情页相关功能
 */

/*$(function() {
	loadDetailTabContent();
	detailViewTab($('.detail-hd-slide'));
	addToCart($('.btn-addcart'));
});*/

let tag='全部', page=1, orderBy=0;
let scrollTop = 1200;

const observer = lozad();

function loadDetailTabContent(opt={}) {
    let tabItems = $('.detail-navbar .item');
    let detailWrap = $('.detail-wrap');
    let curIndex = 0;
    let defaultOpt = {
        loadUrl: [
            '/pages/components/detail/detail.html .detail-html',
            '/pages/components/detail/comment.html .detail-comment',
            '/pages/components/detail/issue.html .comment-issue'
        ],
        commentDataApi: '',
        goodDetailApi: ''
    };
    let {loadUrl,commentDataApi, goodDetailApi} = Object.assign({}, defaultOpt, opt);

    loadDetail();

    tabItems.on('click', function() {
        let index = $(this).index();
        if(index === curIndex) {
            return;
        }
        curIndex = index;
        tabItems.removeClass('active').eq(index).addClass('active');

        switch (index) {
            case 0:
                loadDetail()
                break;
            case 1:
                loadDetailComment();
                break;
            case 2:
                loadDetailIssue()
                break;
            default: break;
        }
    });

    function loadDetail() {
        detailWrap.load(loadUrl[0], function() {
            let attrList = $('.attr-list');
            let listImgDesc= $('.list-img-des');
            $.getJSON(goodDetailApi, function(data) {
                //data = JSON.parse(data);
                //////console.log(data)
                //////console.log(data.goodDetail.goodImgUrls);
                attrList.append(createAttrList(data.goodDetail.goodAttrs));
                listImgDesc.append(creatDetailImgDesc(data.goodDetail.goodImgUrls[0].goodDetailPics));
                observer.observe();
            });
        });
    }

    function loadDetailComment() {
        detailWrap.load(loadUrl[1], function() {
            //////console.log('success');
            $.getJSON(commentDataApi+'&tag='+tag+'&page='+page+'&orderBy='+orderBy, function(data) {
                //////console.log(data);
                commentHdHtml(data, commentDataApi);
                commentListHtml(data.commentInfos);
                pageNavHtml(data.pagaInfo, commentDataApi);
                observer.observe();
            });
        });
    }

    function loadDetailIssue() {
        detailWrap.load(loadUrl[2], function() {
            // ////console.log('success');
        });
    }
}

//初始化详情页加载后就需调用的函数
function initDetail(opt={}) {
    loadModal();
    detailViewTab($('.detail-hd-slide'));
    addToCart($('.btn-addcart'), opt);
    changeGoodNumber();
    setDetailNavbarFixed();
}

/*
以下四个函数为商品详情页详情块相关函数
*/
// 创建商品属性列表，返回一个HTML字符串
function createAttrList(goodAttrs) {
    let attrListHtml = ""
    if(goodAttrs.length <= 0) {
        return attrListHtml;
    } else {
        goodAttrs.forEach(attr => {
            attrListHtml += attrItemHtml(attr.name, attr.value);
    });
    }
    return attrListHtml;
}

//商品属性html字符串模板
function attrItemHtml(name, value) {
    let attrItem = `
		<li class="item">
			<span class="name">${name}</span>
			<span class="value">${value}</span>
		</li>
	`
    return attrItem;
}

//创建详情图片描述，返回一个HTML字符串
function creatDetailImgDesc(goodImgUrls) {
    let imgDescHtml = "";
    if(!goodImgUrls) {
        return imgDescHtml;
    } else {
        goodImgUrls.forEach(url => {
            imgDescHtml += detailImgDescHtml(url);
    });
    }
    return imgDescHtml
}
//详情图片HTML字符串模板
function detailImgDescHtml(url) {
    let html = `<p><img data-src="${url}" class="lozad"/></p>`
    return html;
}

/**
 * 详情页视图切换
 * 详情页头部小图片列表onmouseover事件
 * @param  {[type]} detail [description]
 * @return {[type]}        [description]
 */
function detailViewTab(detail) {
    let largeImg = detail.find('.img-large');
    let viewList = detail.find('.view-list li');

    viewList.on('mouseover', function() {
        let index = $(this).index();
        viewList.removeClass('active').eq(index).addClass('active');
        let imgSrc =viewList.eq(index).find('.img-small').attr('src');
        largeImg.attr('src', imgSrc);
    });
}

/**
 * 添加到购物车
 */
function addToCart(startObj, opt={}) {
	let {baseUrl, goodId} = opt
    let btnCart = startObj;
	let fixedModal = $('.fixed-modal');
    let isFly = false;
	//let timer = null;

    /*点击加入购物车时，生成一架小飞机飞行购物车*/
    btnCart.on('click', function(event) {
        var count = $(".sel-num > input:eq(0)").val();
        var goodSpec = $(".active > .tab-txt").text();
       
        if(!isFly) {
            isFly = true;
            
            $.post(baseUrl+"shopcart",
                //参数，
                {
                    method: "addAndSub",
                    goodId: goodId,
                    count: count,
                    goodSpec: goodSpec

                },
                function (data) {
                    var dataObj = JSON.parse(data);
                    var code = dataObj.code;

                    if (code === 200) {
                    	let cart = $('.yx-top-cart');
                        let cartNum = cart.find('.cart-num');

                        let start = {//计算起始点，即鼠标点击点
                            x: event.pageX,
                            y: event.pageY - $(document).scrollTop()
                        }

                        let end = {//计算结束点，即购物车的位置
                            x: Math.floor(cart.offset().left + cart.width()/2),
                            y: Math.floor(cart.offset().top + cart.height()/2 - $(document).scrollTop())
                        }

                        let fly = createFly();
                        $('body').append(fly);

                        $('.fly').css({
                            top: start.y + 'px',
                            left: start.x + 'px'
                        }).velocity({
                            left: end.x,
                            top: end.y,
                            opacity: 0.3,
                            scale: 0.3
                        }, {
                            duration: 1700,
                            complete: function(elem) {
                                //动画完成，移除小飞机，购物车数量加1
                                $(elem).remove();
                                let num = Number.parseInt(cartNum.text());
                                cartNum.velocity({
                                    scale: 0.1,
                                    opacity: 0
                                }).text(num+1).velocity({
                                    scale: 1,
                                    opacity: 1
                                });
                                isFly = false;
                            }
                        });
                    }
                    if (code === 404) {
                    	fixedModal.velocity('fadeIn', 400);
                        isFly = false;
                    }
                }
            );
            
        }
    });

    function createFly() { //小飞机的HTML代码
        return `<div class="fly"><i class="iconfont icon-fly"></i></div>`;
    }
    
    closeFixedModal(fixedModal);
    function closeFixedModal(modal) {
    	let close = modal.find('.close');
    	close.off('click').on('click', function() {
    		modal.velocity('fadeOut', 400);
    	});
    }
};


function showCart(timer) {
	let cartPanel = $('.cart-show-panel');
	let cartBlock = $('.yx-top-cart');

	cartPanel.fadeIn(100);
	hide();

	/*cartBlock.off('mouseover').on('mouseover', function() {
		cartPanel.fadeIn(100);
		clearTimeout(timer);
	});*/

	cartBlock.off('mouseout').on('mouseout', function() {
		hide();
	});

	function hide() {
		timer = setTimeout(function(){
			cartPanel.fadeOut(100);
		}, 2000);
	}
}

//详情页改变数量
function changeGoodNumber() {
    let subBtn = $('.choice-option .sub');
    let addBtn = $('.choice-option .add');
    let input = $('.choice-option  input');

    //输入框onchange事件
    input.on('change', function(e) {
        let val = parseInt($(this).val());
        let maxVal = parseInt(input.attr('max'));

        if(val !== val || val <= 1) {
            //检查输入，如果输入值不能转为数字或值不大于1，则值仍为1
            val = 1;
            $(this).val(val);
            subBtn.addClass('disabled');
        } else if(!!maxVal && val >= maxVal) {
            //检查输入，如果输入框有限定最大值，且输入的值大于等于最大值
            val = maxVal;
            $(this).val(val);

            //改变按钮状态
            addBtn.addClass('disabled');
            subBtn.removeClass('disabled');
        } else {
            $(this).val(val);
            subBtn.removeClass('disabled');
        }
    });

    //减少数量
    subBtn.on('click', function(e) {
        e.preventDefault();

        //如果按钮为禁止状态，退出
        if($(this).hasClass('disabled'))
            return;

        let val = parseInt(input.val());

        input.val(--val);
        if(addBtn.hasClass('disabled'))
            addBtn.removeClass('disabled');

        //如果输入框值减1后值等于1，则禁用按钮
        if(val === 1) {
            $(this).addClass('disabled');
        }
    });

    //增加数量
    addBtn.on('click', function(e) {
        e.preventDefault();

        //如果按钮为禁止状态，退出
        if($(this).hasClass('disabled'))
            return;

        let val = parseInt(input.val());
        let maxVal = parseInt(input.attr('max'));;

        input.val(++val);
        if(subBtn.hasClass('disabled'))
            subBtn.removeClass('disabled');

        //如果输入框有最大值，且输入框值加1后大于等于最大值，则禁用按钮
        if(!!maxVal && val >= maxVal) {
            $(this).addClass('disabled');
        }
    });
}

/**
 * 详情页相关模板函数
 */
//评论导航
function commentTypeHtml(tagInfos) {
    let tags = '';
    tagInfos.map((item, index) => {
        tags += commentTypeTagLabelHtml(item, index);
});
    return `<div class="title">大家都在说：</div>
			<div class="label-list">`
        + tags +
        `</div>`
}

//评论类型
function commentTypeTagLabelHtml(item, index) {
    let isActive = index == 0 ? 'active' : '';
    return `<span class="label ${isActive}" data-name="${item.name}">${item.name}(${item.count})</span>`
}

//评论星级
function commentStarHtml(num) {
    let star = '';
    for(let i=0; i<num; i++) {
        star += `<span class="iconfont icon-collected star"></span> `;
    }
    return star;
}

//好评率
function goodRateHtml(goodInfos) {
    if(!goodInfos)
        return;

    return `<div class="label">好评率</div>
	<div class="good-rate">${goodInfos.goodRate}</div>
	<div class="star-wrap">`
        + commentStarHtml(goodInfos.star) +
        `</div>`
}

//评论区头
function commentHdHtml(data, api) {
    if(!data)
        return '';

    let goodRates = $('.good-rates');
    let commnetNav = $('.commnet-nav');

    let goodRateStr = goodRateHtml(data.goodInfos);
    let commentTypeStr = commentTypeHtml(data.tagInfos);

    goodRates.empty().append(goodRateStr);
    commnetNav.empty().append(commentTypeStr);

    commentNavTabClickHandler(api);
    commentSortClickHandler(api);
}

//评论列表
function commentListHtml(data) {
    let commentList = $('.comment-list');
    let html = '';
    data.forEach(item => {
        html += commentItemHtml(item);
});
    commentList.empty().append(html);
}

//评论项
function commentItemHtml(commentInfo) {
    if(!commentInfo) {
        return '';
    }

    let stars = commentStarHtml(commentInfo.comStar);
    let comPic = commentItemPic(commentInfo.comPic);
    let replay = '';
    if(commentInfo.comReply) {
        replay = `<div class="reply">
					<div class="service-name yx-ibt">小选回复:</div>
					<div class="content yx-ibt">${commentInfo.comReply}</div>
				</div>`;
    }

    let html =
        `<li class="com-item">
		<div class="com-user yx-ibt">
			<div class="avator-wrap">
				<img data-src="${commentInfo.userAvatar}" class="avator-img lozad">
				<div class="mask"></div>
			</div>
			<div class="username">${commentInfo.userName}</div>
		</div>
		<div class="com-content yx-ibt">
			<div class="star-wrap">` + stars + `</div>
			<div class="content">${commentInfo.content}</div>
			<ul class="pic-list">`
        + comPic +
        `</ul><div class="pulish-time">${commentInfo.comDate}</div>`
        + replay +
        `</div></li>`;
    return html;
}

//评论图片
function commentItemPic(comPic) {
    let html = '';

    if(!comPic || comPic.length <= 0) {
        return html;
    }

    comPic.forEach(src => {
        html += `<li class="pic-item">
					<div class="before"></div>
					<img data-src="${src}" class="img lozad">
				</li>`;
});

    return html;
}

//评论类型点击事件
function commentNavTabClickHandler(api) {
    let tabBtns = $('.commnet-nav .label');

    tabBtns.off('click').on('click', function() {
        if($(this).hasClass('active')) {
            return;
        }

        let index = $(this).index();
        tabBtns.removeClass('active').eq(index).addClass('active');
        tag = $(this).attr('data-name');
        page = 1;

        return $.getJSON(api+'&tag='+tag+'&page='+page+'&orderBy='+orderBy, function(data) {
            commentListHtml(data.commentInfos);
            observer.observe();
            return pageNavHtml(data.pagaInfo, api);
        });
    });
}

//评论排序按钮点击事件
function commentSortClickHandler(api) {
    let sortBtns = $('.comment-sortbar .sort');

    sortBtns.off('click').on('click', function() {
        if($(this).hasClass('active')) {
            return;
        }

        let index = $(this).index()-1;
        sortBtns.removeClass('active').eq(index).addClass('active');
        orderBy = index;
        page = 1;

        return $.getJSON(api+'&tag='+tag+'&page='+page+'&orderBy='+orderBy, function(data) {
            //////console.log(data);
            commentListHtml(data.commentInfos);
            observer.observe();
            return pageNavHtml(data.pagaInfo, api);
        });
    });
}


function pageNavHtml(data, api) {
    let pageWrap =  $('.comment-pager .pager-inner');
    pageWrap.empty().append(pageBtnHtml(data));

    pageBtnClickHandler(api);
}

//分页
function pageBtnHtml(pageInfo) {
    let {curpage, size, totalPage, total} = pageInfo;

    let prev =
        `<a href="javascript:;" data-page="${curpage - 1}" class="page ${curpage-1<=0 ? 'disabled':''}">
			<i class="iconfont icon-prev"></i>上一页
		</a>`;
    let page = '';
    let maxnum = Math.min(5, totalPage);
    for(let i=1; i<=maxnum; i++) {
        page += `<a href="javascript:;" data-page="${i}" class="page ${i==curpage ? 'selected':''}">${i}</a>`
    }
    let next =
        `<a href="javascript:;" data-page="${curpage+1}" class="page ${curpage+1 > totalPage ? 'disabled':''}">
			下一页<i class="iconfont icon-next"></i>
		</a>`;
    return prev + page + next;
}

//分页按钮点击事件
function pageBtnClickHandler(api) {
    let pageBtns = $('.comment-pager a[data-page]');
    //console.log(pageBtns);
    pageBtns.off('click').on('click', function() {
        if($(this).hasClass('disabled'))
            return;
        let pageNum = $(this).attr('data-page');
        if(page == pageNum)
            return;

        page = pageNum;
        return $.getJSON(api+'&tag='+tag+'&page='+page+'&orderBy='+orderBy, function(data) {
            //console.log(data);
            commentListHtml(data.commentInfos);
            observer.observe();
            $(document).scrollTop(scrollTop);
            return pageNavHtml(data.pagaInfo, api);
        });
    });
}

//详情页内容区导航设置
function setDetailNavbarFixed() {
	let detailNavbar = $('.detail-navbar');
	let timer = null;
	let isflag = false;

	$(document).on('scroll', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			// console.log($(this).scrollTop());
			if($(this).scrollTop() >= 1200 && !isflag) {
				//console.log($('.yx-tabnavs-fixed'));
				$('.yx-tabnavs-fixed').velocity({
					translateY: -60
				}, {
					duration: 300,
					complete(elem) {
						detailNavbar.addClass('fixed-detail-navbar').css('top', '-50px');
						detailNavbar.velocity({
							top: 0
						}, {
							duration: 300
						});
						isflag = true;
					}
				});
			} else if($(this).scrollTop() < 1200 && isflag) {
				if(detailNavbar.hasClass('fixed-detail-navbar')) {
					detailNavbar.removeClass('fixed-detail-navbar');
					$('.yx-tabnavs-fixed').velocity({
						translateY: 0
					}, {
						duration: 300,
						complete() {
							isflag = false;
						}
					});
				}
			}
		}, 70);
	});
}