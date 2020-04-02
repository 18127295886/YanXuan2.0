<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物车 - 网易严选</title>
    <meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
    <meta name="description"
          content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
    <link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
    <link rel="stylesheet" href="<%=basePath%>/public/style/cart.css">
    <%--<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>--%>
    <script src="<%=basePath%>/public/lib/jquery.js"></script>
</head>
<body>
<!-- 头部 -->
<jsp:include page="/header.jsp"></jsp:include>
<!-- 主体 -->
<div id="yx-body">
    <div class="yx-row">
        <c:choose>
            <c:when test="${empty cartlist}">
                <!-- 购物车为空时 -->
                <div class="cart-null cart-wrap">
                    <div class="emptylist-wrap">
                        <div class="empty-status">
                            <div class="icon-empty icon-empty-cart"></div>
                            <div class="empty-text">购物车还是空滴</div>
                            <a href="<%=basePath%>/index.jsp" class="btn btn-ghost">继续逛</a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 购物车不为空时 -->
                <div class="cart-wrap">
                    <div class="cart-head">
                        <div class="yx-ibt w w1 left">
                            <div class="chkbox">
                                <label><input type="checkbox" class="select-all"> 全选</label>
                            </div>
                        </div>
                        <div class="yx-ibt w w2 left">商品信息</div>
                        <div class="yx-ibt w w3">单价</div>
                        <div class="yx-ibt w w4">数量</div>
                        <div class="yx-ibt w w5">小计</div>
                        <div class="yx-ibt w w6 left">操作</div>
                    </div>
                    <div class="cart-body">
                        <!-- 购物车列表项，data-id属性的值为购物车项的编号 -->
                        <c:forEach items="${cartlist}" var="cartItem">
                            <%--遍历购物车中的商品信息--%>
                            <div class="cart-group" data-id="${cartItem.goodId}">
                                <div class="cart-item">
                                    <div class="item w7">
                                        <div class="chkbox">
                                            <input type="checkbox" value="${cartItem.goodId}">
                                        </div>
                                    </div>
                                    <div class="item w8">
                                        <div class="pic yx-ibt">
                                            <a href="<%=basePath%>SelectGoodsServlet?goodId=${cartItem.goodId}"
                                               target="_blank">
                                                <img src="${cartItem.goodPic}"
                                                     alt="${cartItem.goodDesc}" class="img">
                                            </a>
                                        </div>
                                        <div class="item-info yx-ibt">
                                            <div class="name">
                                                <a href="<%=basePath%>SelectGoodsServlet?goodId=${cartItem.goodId}"
                                                   target="_blank">${cartItem.goodName}</a>
                                            </div>
                                            <div class="spec">
                                                <span>${cartItem.goodSpec}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item w3">
                                        <p class="price">
									        <span>
										        <span>¥</span>
                                                <span class="price-num">${cartItem.goodPrice}</span>
									        </span>
                                        </p>
                                    </div>
                                    <div class="item w4">
                                        <div>
                                            <div class="op-cont">
                                                <div class="sel-num">
                                                    <button class="sub disabled">-</button>
                                                    <input type="text" value="${cartItem.count}"
                                                           maxlength="5">
                                                    <button class="add">+</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 如果库存小于100显示 -->
                                        <!-- <div class="nervous">
                                            <span>剩余</span>
                                            <span>5</span>
                                            <span>件</span>
                                        </div> -->
                                    </div>
                                    <div class="item w5">
                                        <p class="price sprice">
                                            <span>¥</span>
                                            <span
                                                class="sprice-num">${cartItem.goodPrice*cartItem.count}</span>
                                        </p>
                                    </div>
                                    <div class="item w6 left">
                                        <div class="operate" name="${cartItem.goodId}">
                                            <a href="javascript:;" class="add-collection">加入收藏</a>
                                        </div>
                                        <div class="operate" name="${cartItem.goodId}">
                                            <a href="javascript:;" class="remove">移除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="cart-foot">
                        <div class="chkbox yx-ibt">
                            <input type="checkbox" class="select-all">
                            <!-- <label class="chk-label">已选(<span class="num">0</span>)</label> -->
                            <label class="chk-label">全选</label>
                            <a href="javascript:;" class="batch-delete">批量删除</a>
                        </div>
                        <div class="yx-ibt info">
                            <div class="yx-ibt info-left">
                                <div class="items-price">
                                    <div class="line">
                                        <span class="label">商品合计：</span>
                                        <span class="amount">
										<span>¥</span>
										<span class="price-num">0.00</span>
									</span>
                                    </div>
                                </div>
                            </div>
                            <div class="yx-ibt info-right">
                                <div class="should-pay-money">
                                    <span class="label">应付金额：</span>
                                    <span class="money-info">
									<span>¥</span>
									<span class="money">0.00</span>
								</span>
                                </div>
                            </div>
                        </div>
                        <div class="yx-ibt pay">
                            <a href="javascript:;"
                               class="btn btn-primary btn-pay btn-disabled">下单</a>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="fixed-right return-top">
        <div class="return-top-btn">
            <a href="javascript:;">TOP</a>
        </div>
    </div>
</div>
<!-- 底部 -->
<jsp:include page="/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
<script src="<%=basePath%>/public/script/basicFn.js"></script>
<script src="<%=basePath%>/public/script/cart.js"></script>
<script>
    $(function () {
        var $cartList = $(".cart-group");
        for (var i = 0; i < $cartList.length; i++) {
            var id = $cartList.eq(i).attr("data-id");
            console.log("id:" + id);
            //获得移除按钮的变量，同时增加ajax请求
            var remove = $cartList.eq(i).find(".remove");
            // console.log(remove.length);
            remove.on("click", function () {
                var parent = $(this).parent();
                var goodIdTem = parent.attr("name");
                var goodId = parseInt(goodIdTem);
                $.post(
                    "<%=basePath%>" + "shopcart",
                    {
                        method: "delFromCart",
                        goodIds: goodId
                    },
                    function (data) {
                        console.log("移除商品" + goodId + "成功！！！");
                    }
                );
                /*console.log(typeof goodIdTem);*/
                /*console.log(goodId);
                console.log(typeof goodId);*/

                // console.log(name);
            });

            var $addCollection = $cartList.eq(i).find(".add-collection");
            $addCollection.on("click", function () {
                var parent = $(this).parent();
                var goodIdTem = parent.attr("name");
                var goodId = parseInt(goodIdTem);
                // console.log(goodId);
                //console.log($addCollection.text())
                $.post(
                    "<%=basePath%>updateCollectionCtrl",
                    {
                        goodId: goodId,
                        action: "加入"
                    },
                    function (data) {
                        //console.log(goodId + "加入收藏夹！！！")
                    }
                );
            });


        }

        var $pay = $(".btn-pay").eq(0);
        $pay.on("click", function () {
            console.log($(".chkbox").length);
        });

        cartHandler({
            topayUrl: "<%=basePath%>/ConfirmCtrl?action=even"
        });

    })
</script>
</body>
</html>