<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.yanxuan.service.picLis" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>网易严选居家篇 -
        夏凉床品，舒适一夏、MUJI等品牌制造商出品、守护你的睡眠时光、大师级工艺、一盏灯，温暖一个家、选自古驰竹柄原料供应商、各种风格软装装点你的家、装饰你的家、出行小物，贴心相伴、居家晾晒必备好物、专业家庭医用好物、抑菌除味，打造宠物舒适空间</title>
    <meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
    <meta name="description"
          content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
    <link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
    <link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>/public/style/itemList.css">
    <script src="<%=basePath%>/public/lib/jquery.js"></script>
</head>
<body>
<!-- 头部 -->
<jsp:include page="/header.jsp"></jsp:include>
<%
    picLis picLis = (picLis)request.getAttribute("picLis");
%>
<c:forEach var="goodInfo" items="${GoodInfo}">
    <!-- 主体 -->
    <div id="yx-body">
        <div class="yx-row">
            <!-- 路径导航 -->
            <div class="yx-crumbs">
                <c:forEach var="goodType" items="${ GoodTypeInfo}">
                    <a href="/index.html">首页</a>
                    <span class="iconfont icon-next crumb-arrow"></span>
                    <a href="javascript:;">${goodType.typeName }</a>
                    <span class="iconfont icon-next crumb-arrow"></span>
                    <a href="javascript:;">${goodType.midTypeName }</a>
                    <span class="iconfont icon-next crumb-arrow"></span>
                    <span class="cur-loc">${goodInfo.goodName}</span>
                </c:forEach>
            </div>
            <!-- 商品详情 -->
            <div class="yx-detail">
                <!-- 详情头 -->
                <div class="detail-hd">
                    <div class="detail-hd-slide yx-ibt">
                        <div class="view yx-ibt">
                            <img class="img-large" src="<%=picLis.getPicList()[0] %>" alt="">
                        </div>
                        <div class="view-list yx-ibt">
                            <ul>
                                <li class="active"><a href="javascript:;"><img class="img-small"
                                                                               src="<%=picLis.getPicList()[0] %>" />"
                                    alt=""></a></li>
                                <li><a href="javascript:;"><img class="img-small"
                                                                src="<%=picLis.getPicList()[1] %>"
                                                                alt=""></a></li>
                                <li><a href="javascript:;"><img class="img-small"
                                                                src="<%=picLis.getPicList()[2] %>"
                                                                alt=""></a></li>
                                <li><a href="javascript:;"><img class="img-small"
                                                                src="<%=picLis.getPicList()[3] %>"
                                                                alt=""></a></li>
                                <li><a href="javascript:;"><img class="img-small"
                                                                src="<%=picLis.getPicList()[4] %>"
                                                                alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="detail-hd-info yx-ibt">
                        <div class="hd-intro">
                            <div class="name">
                                <span title="${goodInfo.goodName}">${goodInfo.goodName}</span>
                                <a href="javascript:;">
                                    <div class="comment">
                                        <span
                                            style="font-size:20px; color:#e36844">${goodInfo.goodRate}</span><br>
                                        <span style="font-size: 13px;">好评率</span>
                                    </div>
                                </a>
                            </div>
                            <div class="desc">${goodInfo.goodDesc}</div>
                        </div>
                        <div class="hd-price">
                            <div class="price-block pbox">
                                <span class="label">价格</span>
                                <span class="price">
									<span class="yuan">¥</span>
									<span class="num">${goodInfo.goodPrice}</span>
								</span>
                            </div>
                            <div class="sale-block pbox">
                                <span class="label">促销</span>
                                <span>
									<span class="tag tag-other">满额减</span>
									<span class="desc-tag">每满299元减60元</span>
								</span>
                            </div>
                            <div class="point-block pbox">
                                <span class="label">积分</span>
                                <span>购买最高得19积分</span>
                            </div>
                            <div class="server-block pbox">
                                <span class="label">服务</span>
                                <div class="server-list yx-ibt">
                                    <span>支持30天无忧退换货</span>
                                    <span>48小时快速退款</span>
                                    <span>满88元免邮费</span><br>
                                    <span>网易自营品牌</span>
                                    <span>国内部分地区无法配送</span>
                                </div>
                            </div>
                        </div>
                        <div class="choice-option">
                            <!-- 规格-颜色 -->
                            <div class="op-spec op-item" data-spec="color">
                                <span class="label">${requestScope.goodSpec.goodSpecName}</span>
                                <div class="op-cont">
                                    <ul class="tabs">
                                        <c:forEach var="spec"
                                                   items="${requestScope.goodSpec.goodSpecValue}"
                                                   varStatus="status">
                                            <c:choose>
                                                <c:when test="${status.index eq 0}">
                                                    <li class="tab-con active" data-label="gold">
                                                        <a class="tab-txt" href="javascript:;"
                                                           title="${spec}">${spec}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="tab-con" data-label="gold">
                                                        <a class="tab-txt" href="javascript:;"
                                                           title="${spec}">${spec}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="op-num op-item">
                                <span class="label">数量</span>
                                <div class="op-cont">
                                    <div class="sel-num">
                                        <button class="sub disabled">-</button>
                                        <!-- 最大数量为库存值，即max的值 -->
                                        <input type="text" value="1" maxlength="5" max="100">
                                        <button class="add">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-group">
                            <a href="<%=basePath%>ConfirmCtrl?action=single&goodId=${GoodInfo[0].goodId}"
                               class="btn btn-detail-hd btn-buynow btn-ghost" target="_blank">立即购买
                            </a>
                            <a href="javascript:;"
                               class="btn btn-detail-hd btn-primary btn-addcart">
                                <i class="iconfont icon-cart"></i>加入购物车
                            </a>
                            <div title="点击收藏" class="collect-block">
                                <div class="top"><i class="iconfont icon-collect collect"></i></div>
                                <div class="bottom"><p>收藏</p></div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    $(function () {

                        tab($('.op-spec .tab-con'));
                    });
                </script>
                <!-- 大家都在看 -->
                <div class="similar-container">
                    <div class="similar-hd">
                        <span class="hd-title">大家都在看</span>
                    </div>
                    <div class="similar-list">
                    
                        <c:forEach items="${randomGoodList}" var="randomGood">
                        <!-- 内容 -->
                        <div class="product-item similar-item">
                            <div class="item-hd">
                                <a href="<%=basePath%>SelectGoodsServlet?goodId=${randomGood.goodId}" target="_blank"
                                   title="${randomGood.goodName}">
                                    <div><img class="img img-noload img-small"
                                              src="${randomGood.goodPic}"
                                              alt="${randomGood.goodName}"></div>
                                </a>
                                <!-- <div class="color-num">3色可选</div> -->
                            </div>
                            <div class="item-bd">
                                <div class="item-tags">
                                	<c:if test="${not empty randomGood.goodTag}">
                                    <span class="tag tag-other">${randomGood.goodTag}</span>
                                    </c:if>
                                </div>
                                <div class="item-name">
                                    <a href="<%=basePath%>SelectGoodsServlet?goodId=${randomGood.goodId}" 
                                    target="_blank"
                                       title="${randomGood.goodName}">${randomGood.goodName}</a>
                                </div>
                                <div class="item-price">
                                    <span class="price">¥${randomGood.goodPrice}</span>
                                   <!--  <span class="old-price">¥129</span> -->
                                </div>
                            </div>
                        </div>
                       <!-- 内容 --> 
                        </c:forEach>
                    </div>
                    
                    
                </div>
                <!-- 详情内容 -->
                <div class="detail-bd">
                    <div class="detail-bd-lt yx-ibt">
                        <div class="detail-navbar">
                            <div class="common-tab">
                                <div class="tab-inner theme1">
                                    <ul>
                                        <li class="item active"><a href="javascript:;">详情</a></li>
                                        <li class="item"><a href="javascript:;">评价</a></li>
                                        <li class="item"><a href="javascript:;">常见问题</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="detail-wrap tab-content show">
                        </div>
                    </div>
                    
                    <!-- 右侧栏 -->
                    <div class="detail-bd-rt yx-ibt">
                        <div class="hot-sell">
                        <!--足迹不为空才显示足迹，否则显示火爆 -->
                        <c:choose>
                        	<c:when test="${not empty detailFootprintList}">
                            <div class="hd">刚刚看了</div>
                            <div class="bd">
                                <div>
                                    <c:forEach items="${detailFootprintList}" var="detailFootprint">
                                    <!--内容  -->
                                    <div class="product-item item">
                                        <div class="item-hd">
                                            <a href="<%=basePath%>SelectGoodsServlet?goodId=${detailFootprint.goodId}" 
                                            target="_blank"
                                               title="${detailFootprint.goodName}">
                                                <div><img class="img img-noload"
                                                          src="${detailFootprint.goodPic}"
                                                          alt="${detailFootprint.goodName}"></div>
                                            </a>
                                            <!-- <div class="color-num">3色可选</div> -->
                                        </div>
                                        <div class="item-bd">
                                            <div class="item-name">
                                            	<c:if test="${not empty goodItem.goodTag}">
                                                <span class="tag tag-hot">${detailFootprint.goodTag}</span>
												</c:if>
                                                <a href="<%=basePath%>SelectGoodsServlet?goodId=${detailFootprint.goodId}"
                                                   target="_blank" title="${detailFootprint.goodName}">${detailFootprint.goodName}</a>
                                            </div>
                                            <div class="item-price">
                                                <span class="price">¥${detailFootprint.goodPrice}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!--内容  -->
                                    </c:forEach>
                                </div>
                            </div>
                            </c:when>
                            <c:otherwise>
                            <div class="hd">24小时热销</div>
                            <div class="bd">
                                <div>
                                    <c:forEach items="${hotGootList}" var="hotGoot">
                                    <!--内容  -->
                                    <div class="product-item item">
                                        <div class="item-hd">
                                            <a href="<%=basePath%>SelectGoodsServlet?goodId=${hotGoot.goodId}" 
                                            target="_blank"
                                               title="${hotGoot.goodName}">
                                                <div><img class="img img-noload"
                                                          src="${hotGoot.goodPic}"
                                                          alt="${hotGoot.goodName}"></div>
                                            </a>
                                            <!-- <div class="color-num">3色可选</div> -->
                                        </div>
                                        <div class="item-bd">
                                            <div class="item-name">
                                            	<c:if test="${not empty hotGoot.goodTag}">
                                                <span class="tag tag-hot">${hotGoot.goodTag}</span>
												</c:if>
                                                <a href="<%=basePath%>SelectGoodsServlet?goodId=${hotGoot.goodId}"
                                                   target="_blank" title="${hotGoot.goodName}">${hotGoot.goodName}</a>
                                            </div>
                                            <div class="item-price">
                                                <span class="price">¥${hotGoot.goodPrice}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!--内容  -->
                                    </c:forEach>
                                </div>
                            </div>
							</c:otherwise>
                            </c:choose>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<!-- 底部 -->
<jsp:include page="/footer.jsp"></jsp:include>
<!-- 模态框组件 -->
<div class="fixed-modal">
    <div class="modal-wrap">
    	<div class="yx-login-wrap">
			<div class="login-box">
				<div class="wrap-header">
					<div class="close">&times;</div>
				</div>
				<div class="content" style="padding: 20px 0 50px;">
		    		<p class="txt-center" style="line-height: 2em;font-size: 18px;color: #999;letter-spacing: 4px;">客官您还未登录呢！</p>
		    		<a href="<%=basePath%>/pages/login.jsp" class="btn btn-primary" 
		    			style="display: block;margin: 15px auto 10px;width: 140px;height: 35px;line-height: 35px;font-size: 14px;">点我登录</a>
		    	</div>
			</div>
		</div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
<script src="<%=basePath%>/public/lib/lozad.min.js"></script>
<script src="<%=basePath%>/public/script/detail.js"></script>
<script src="<%=basePath%>/public/script/dialogModal.js"></script>
<script src="<%=basePath%>/public/script/basicFn.js"></script>
<script>
    $(function () {
        loadDetailTabContent({
            loadUrl: [
                '<%=basePath%>/pages/components/detail/detail.html .detail-html',
                '<%=basePath%>/pages/components/detail/comment.html .detail-comment',
                '<%=basePath%>/pages/components/detail/issue.html .comment-issue'
            ],
            commentDataApi: '<%=basePath%>/comment?goodId="${GoodInfo[0].goodId}"',
            goodDetailApi: '<%=basePath%>/GetGoodDetailsServlet?goodId="${GoodInfo[0].goodId}"'
        });
        initDetail({
        	baseUrl: "<%=basePath%>",
        	goodId: "${GoodInfo[0].goodId}"
        });
        
        gotoBuy("<%=session.getAttribute("user")%>");
		function gotoBuy(user) {
			let fixedModal = $('.fixed-modal');
			let btn = $('.btn-buynow');
			let url = btn.attr('href');
			btn.attr('href', 'javascript:;');
			
			btn.on('click', function() {
				/*console.log(user);
				return;*/
				if(user == "null") {
					btn.attr('href', 'javascript:;');
					fixedModal.velocity('fadeIn', 400);
					return;
				} else {
					btn.attr('href', url);
				}
			});
		}       

        var btns = $(".btn-group").eq(0);
        btns.find(".collect-block").on("click", function () {
            var collecIcon = btns.find($(".collect"));
            if (collecIcon.hasClass("icon-collect")) {
                //在点击按钮的的时候，当前的显示状态就是未收藏状态
                collecIcon.removeClass("icon-collect").addClass("icon-collected");
                btns.find(".bottom").eq(0).children('p').text("已收藏");
                postColl("加入");

            } else {
                //当点击按钮的时候，当前的显示状态就是已经收藏状态
                collecIcon.removeClass("icon-collected").addClass("icon-collect");
                btns.find(".bottom").eq(0).children('p').text("收藏");
                postColl("删除");
            }
        })


        function postColl(action) {
            var goodId = parseInt("${GoodInfo[0].goodId}");
            $.post(
                "<%=basePath%>updateCollectionCtrl",
                {
                    goodId: goodId,
                    action: action
                },
                function (data) {
                });
        }

        function collectFun() {

            var btns = $(".btn-group").eq(0);
            var collecIcon = btns.find($(".collect"));
            var attr = collecIcon.attr("class");
            console.log(attr);
            var goodId = parseInt("${GoodInfo[0].goodId}");

            $.post(
                "<%=basePath%>updateCollectionCtrl",
                {
                    goodId: goodId,
                    action: "检查"
                },
                function (data) {
                    var resultJSON = eval("(" + data + ")");
                    var code = resultJSON.code;
                    var msg = resultJSON.msg;
                    //console.log(code + "::" + msg);
                    if (code == 200) {
                        //还没有被收藏的时候


                    }
                    if (code == 400) {
                        //已经被收藏的时候(代表样式)
                        collecIcon.removeClass("icon-collect").addClass("icon-collected");
                        btns.find(".bottom").eq(0).children('p').text("已收藏");
                    }
                }
            );
        }

        collectFun();


    });
</script>
</body>
</html>