/**
 * @fn：头部购物车显示功能
 * @author: llk
 * @date: 2018/9/8
 */

//购物车相关触发事件
function cartEventHandler(opt={}) {
	let {ajaxUrl, itemUrl, removeUrl} = opt;
	
	let cartBlock = $('.yx-top-cart');
	let cartShowPanel = $('.cart-show-panel');
	let cartPanelInner = cartShowPanel.find('.cart-info-inner');
	let cartNum = cartBlock.find('.cart-num');
	let cartTotalPrice = cartBlock.find('.total-price');
	
	let flag = false;
	let cacheData = []; //缓存
	
	cartBlock.off('mouseenter').on("mouseenter", function () {
		if(flag)
			return;
        $.post(ajaxUrl,{},function (data) {
        	//console.log(data);
            	flag = true;
                data = JSON.parse(data);
                //console.log(data);
                //console.log(cacheData);
                if(data.flag.code == 400) {
                	cartShowPanel.fadeOut();
                	return;
                } else if(data.flag.code == 200) {
                	if(isEqualData(data.data, cacheData)) {
                		cartShowPanel.fadeIn(200);
                		return;
                	}
            		cacheData = [];
            		data.data.forEach(item => {
            			cacheData.push(item);
            		});
            		cartNum.text(cacheData.length);
            		cartPanelInner.empty().append(cartItemsHtml(cacheData, itemUrl));
            		cartTotalPrice.text(computeTotalPrice(cacheData).toFixed(2));
            		
            		removeCartItem(cartShowPanel, removeUrl);
            		cartShowPanel.fadeIn(200);
                }
            }
        );

    });
	
	cartBlock.off('mouseleave').on('mouseleave', function() {
		flag = false;
    	cartShowPanel.fadeOut(300);
	});
}

//判断请求的购物车数据和缓存的购物车数据是否相同，只有长度相同且对应位置的GoodId相同便认为两者相同
function isEqualData(data, cache) {
	let result = false;
	if(data.length == cache.length) {
		result = true;
		for(let i=0; i<data.length; i++) {
			if(data[i].GoodId != cache[i].GoodId) {
				result = false;
				break;
			}
		}
	}
	return result;
}

//计算总价
function computeTotalPrice(data) {
	let price = 0;
	data.forEach(item => {
		price += (item.GoodPrice * item.Count);
	});
	return price
}

//所有购物车项模板
function cartItemsHtml(data, url) {
	let html = '';
	data.forEach(item => {
		html += cartItemHtml(item, url);
	});
	return html;
}

//单个购物车项模板
function cartItemHtml(data, url) {
	if(!data)
		return '';
	let html = `<div class="cart-item yx-clearfix" data-id="${data.GoodId}">
	    <div class="item item-left">
	        <a href="${url}?goodId=${data.GoodId}" target="_blank">
	        	<img src="${data.GoodPic}" class="img"></a>
	    </div>
	    <div class="item item-middle">
	        <p><a href="<%=basePath%>SelectGoodsServlet?goodId=${data.GoodId}"
	            target="_blank">${data.GoodName}</a></p>
	        <p>
	            <span class="spec-value">${data.GoodSpec}</span>&nbsp;
	            <span class="count">
					<span>&times;</span>
					<span>${data.Count}</span>
				</span>
	        </p>
	    </div>
	    <div class="item item-right">
	        <p class="item-price">
				<span>
					<span>¥</span>
					<span>${parseInt(data.GoodPrice) * parseInt(data.Count)}</span>
				</span>
	        </p>
	        <p class="delete-item"><i class="icon-del">&times;</i>
	        </p>
	    </div>
	</div>`
	return html;
}

//购物车项移除
function removeCartItem(obj, url) {
	let cartItem = obj.find('.cart-item');
	
	for(let i=0; i<cartItem.length; i++) {
		let index = i;
		cartItem.eq(index).find('.delete-item').off('click').on('click', function() {
			let id = cartItem.eq(index).attr('data-id');
			cartItem.eq(index).velocity('fadeOut', {
				complete(elem) {
					//console.log(id);
					$(elem).remove();
					$.post(url, {
						method: 'delFromCart',
						goodIds: id
					}, function(data) {
						console.log('success del')
					});
				}
			});
		});
	}
}

/**
 * 添加到购物车
 */
function addToCart(startObj) {
    let btnCart = startObj;
    let isFly = false;
	//let timer = null;

    /*点击加入购物车时，生成一架小飞机飞行购物车*/
    btnCart.off('click').on('click', function(event) {
        if(!isFly) {
            isFly = true;
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

					//clearTimeout(timer);
					//showCart(timer);
                }
            });
        }
    });

    function createFly() { //小飞机的HTML代码
        return `<div class="fly"><i class="iconfont icon-fly"></i></div>`;
    }
};


