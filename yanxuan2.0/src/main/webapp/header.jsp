<%@page import="com.yanxuan.entity.UserInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="yx-header">
    <div class="black-top-nav yx-fz12" id="top-nav">
        <div class="yx-row">
            <div class="tnav-left">
                <div class="xy-sologn yx-ibt">
                    <a href="javascript:;">好的生活，没那么贵</a>
                </div>
                <div class="yx-notices yx-ibt">
                    <ul class="yx-notice-list yx-ibt">
                        <li class="notice-item"><a href="javascript:;">【福利】下载严选APP，抢1元包邮团，领...</a></li>
                        <li class="notice-item"><a href="javascript:;">【5折SALE】服装好物超值抢>></a></li>
                        <li class="notice-item"><a href="javascript:;">【严选x中行联名卡】达标领80元礼品卡></a></li>
                        <li class="notice-item"><a href="javascript:;">【福利】下载严选APP，抢1元包邮团，领...</a></li>
                    </ul>
                </div>
            </div>
            <div class="tnav-right">
                <ul class="yx-tnav-item">
                    <%
                        UserInfo user = (UserInfo)session.getAttribute("user");
                    %>
                    <% if ( user == null ) { %>
                    <!-- 未登录时显示 -->
                    <li class="yx-ibt"><a href="<%=basePath%>/pages/login.jsp">登录</a>
                    </li>
                    <li class="yx-ibt"><a href="<%=basePath%>/pages/register.jsp"
                                          target="_blank">注册</a></li>
                    <!-- end -->
                    <%} else { %>
                    <!-- 登录时显示 -->
                    <li class="yx-ibt user-drop">
                        <a href="<%=basePath%>/pages/user/index.jsp"
                           target="_blank"><%=user.getUserName() %>
                        </a>
                        <div class="user-drop-menu dropdown-menu">
                            <ul class="dm-list">
                                <li><a class="link" href="<%=basePath%>/pages/user/index.jsp"
                                       target="_blank">个人中心</a></li>
                                <li><a class="link" href="<%=basePath%>/pages/user/info.jsp"
                                       target="_blank">账户信息</a></li>
                                <li><a class="link" href="<%=basePath%>showCollectionCtrl"
                                       target="_blank">我的收藏</a></li>
                                <li><a class="link" href="<%=basePath%>/pages/user/msgcenter.jsp"
                                       target="_blank">消息中心</a></li>
                                <li><a class="link" href="<%=basePath%>/ExitCtrl">退出</a></li>
                            </ul>
                        </div>
                    </li>
                    <!-- end -->
                    <%} %>
                    <li class="yx-ibt"><a href="<%=basePath%>/pages/order/mylist.jsp"
                                          target="_blank">我的订单</a></li>
                    <li class="yx-ibt"><a href="javascript:;">会员</a></li>
                    <li class="yx-ibt"><a href="javascript:;">甄选家</a></li>
                    <li class="yx-ibt"><a href="javascript:;">企业采购</a></li>
                    <li class="yx-ibt customer-drop">
                        <a href="javascript:;">客户服务</a>
                        <div class="customer-drop-menu dropdown-menu">
                            <ul class="dm-list">
                                <li><a href="javascript:;">在线客服</a></li>
                                <li><a href="javascript:;">帮助中心</a></li>
                                <li><a href="javascript:;">商务合作</a></li>
                                <li><a href="javascript:;">开放平台</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="top-tabnavs">
        <div class="yx-row">
            <a href="<%=basePath%>/index.jsp" class="yx-logo yx-ibt" title="网易严选"><i
                class="icon icon-top icon-logo"></i></a>
            <!-- 购物车 -->
            <div class="yx-top-cart">
                <div class="yx-cartEnter">
                    <a href="<%=basePath%>shopcart?method=getCartList" target="_blank">
                        <i class="icon icon-top icon-cart"></i>
                        <i class="icon icon-top icon-badge cart-num">0</i>
                    </a>
                </div>
                <!-- 如果购物车数量为0则不显示 -->
                <div class="cart-show-panel">
                    <div class="cart-wrap">
                        <div class="cart-info">
                            <div class="cart-info-inner">
                            </div>
                        </div>
                        <div class="cart-bottom yx-clearfix">
                            <div class="cart-totalPrice">
                                <span style="color:#999;">商品合计:</span><br>
                                <span>
						<span>¥</span>
						<span class="total-price">0</span>
					</span>
                            </div>
                            <div class="cart-gotoCart">
                                <a href="<%=basePath%>shopcart?method=getCartList" class="btn btn-primary">去购物车结算</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 用户为空yx-top-userEmpty，用户不为空yx-top-userLogin -->
            <!-- 用户未登录时 -->
            <%
            	if(user == null){
            %>
            <div class="yx-top-userEmpty">
                <a href="pages/login.jsp" target="_blank"><i
                    class="icon icon-top icon-user"></i></a>
                <div class="dropdown-menu">
                    <ul class="dm-list">
                        <li><a class="link" href="javascript:;" data-tigger="login">登录</a></li>
                        <li><a class="link" href="javascript:;">注册</a></li>
                    </ul>
                </div>
            </div>
            <!-- 用户登录时 -->
            <%
            	}else{            
            %>
            <div class="yx-top-userLogin">
					<a href="<%=basePath%>/pages/user/index.jsp" target="_blank"><i class="icon icon-top icon-user"></i></a>
					<div class="dropdown-menu">
						<ul class="dm-list">
							<li><a class="link" href="<%=basePath%>/pages/user/index.jsp" target="_blank">个人中心</a></li>
							<li><a class="link" href="<%=basePath%>/pages/user/info.jsp" target="_blank">账户信息</a></li>
							<li><a class="link" href="<%=basePath%>/pages/user/collection.jsp" target="_blank">我的收藏</a></li>
							<li><a class="link" href="<%=basePath%>/pages/user/msgcenter.jsp" target="_blank">消息中心</a></li>
							<li><a class="link" href="javascript:;">退出</a></li>
						</ul>
					</div>
				</div>
			<%
            	}
			%>
            <!-- 搜索 -->
            <div class="yx-top-search">
                <form action="<%=basePath%>SendCtrl" method="get" id="searchForm">
                    <div class="yx-searchInputWrap">
                        <div class="fixed-hide-search-wrap">&gt;&gt;</div>
                        <input type="text" name="keyword" id="top-search" autocomplete="off">
                        <div class="default-keyword">服饰季末特惠</div>
                    </div>
                    <div class="yx-searchButton">
                        <a href="javascript:;" target="_blank" class="btn-search"><i
                            class="icon icon-top icon-search"></i></a>
                    </div>
                    <div class="yx-suggest yx-hide">
                        <ul class="suggest-list">
                            <li class="sl-item-tip">
                                <span class="sl-item-txt">大家都在搜</span>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
            <script src="<%=basePath%>/public/script/topNavSearch.js"></script>
            <script>
                let searchDom = $('.yx-top-search');
                search(searchDom, '<%=path%>/SearchCtrl', '<%=path%>/SendCtrl', {
                    searchInputWrap: searchDom.find('.yx-searchInputWrap'),
                    suggestWrap: searchDom.find('.yx-suggest')
                });
            </script>
            <!-- 主导航选项 -->
            <ul class="yx-tabnavs">
                <li class="yx-nav-item yx-ibt">
                    <a href="<%=basePath%>/index.jsp" target="_blank">首页</a>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="pages/item/list.jsp" target="_blank">居家</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="pages/item/list.jsp#xialiang" target="_blank">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ec6d3a9b3bc96dcd5c42c6a1b9e7e50b.png"
                                            alt="">
                                        <p>夏凉</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/785a1507ce654746875063805c6c4235.png"
                                            alt="">
                                        <p>床品套件</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ee60a9a2601fb8362cb5c2a8653b643a.png"
                                            alt="">
                                        <p>被枕</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/5bc69104d820dceb8d8b85ae93bb92a1.png"
                                            alt="">
                                        <p>家居</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/b46926e47db6d9b33122da594a488800.png"
                                            alt="">
                                        <p>收纳</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f57994dcda1e459f69a6d3a092aebe7d.png"
                                            alt="">
                                        <p>布衣软装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/1bd51b940ede5b0a975a36d20f9c12de.png"
                                            alt="">
                                        <p>家饰</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f3cb3a8619734ea6d0ba674e084f6477.png"
                                            alt="">
                                        <p>旅行用品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/73b7fa444f9dd370d396dd9cd03aa7f6.png"
                                            alt="">
                                        <p>晾晒除味</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/aa5e66de1609462db109f2e4b6a4d389.png"
                                            alt="">
                                        <p>家庭医疗</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ab8d667cb93158a472014d424e595704.png"
                                            alt="">
                                        <p>宠物</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">鞋包配饰</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c334fe053304b63f9cdcf88b7d16b948.png"
                                            alt="">
                                        <p>行李箱</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/32781d3bce89750f6a54b09b89336b68.png"
                                            alt="">
                                        <p>女士包袋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/9fb399df67095062a642a238537f079c.png"
                                            alt="">
                                        <p>男士包袋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/439253538b5f545212e0537b5df00b91.png"
                                            alt="">
                                        <p>钱包及小皮件</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/4ab4b4ff0bce6236a46c13f28823736d.png"
                                            alt="">
                                        <p>女鞋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c1052ec10b350e7612cb9226a60cdfd5.png"
                                            alt="">
                                        <p>男鞋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/9173b2d0bbcc9b9d57449e1b68bbb003.png"
                                            alt="">
                                        <p>拖鞋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/5f8fe16b1b2fdc423880b1a4078386cb.png"
                                            alt="">
                                        <p>鞋配</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/03ff440c52675dca0f33f3be7a8edfef.png"
                                            alt="">
                                        <p>袜子</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c5bfc03ac5e04f8eab0563c512332910.png"
                                            alt="">
                                        <p>丝袜</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/cfbcc9051426024191492e1eebd0ef69.png"
                                            alt="">
                                        <p>配饰</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/2c51cf2f8f745b5dea3000d73e103705.png"
                                            alt="">
                                        <p>眼镜</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/019f3bc29160c276ae2ead5b84d1d4db.png"
                                            alt="">
                                        <p>围巾件套</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">服饰</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/80b28950d290b785b2d2b85e49fb650a.png"
                                            alt="T恤">
                                        <p>T恤</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f23b374777d201b88d58dee17d824ac0.png"
                                            alt="运动">
                                        <p>运动</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;" title="牛仔">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/60e59a3bc835a33278664d8353b1a976.png"
                                            alt="牛仔">
                                        <p>牛仔</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;" title="牛仔">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ac4ee6d60d599666061b2954eea116b2.png"
                                            alt="Yessing轻运动">
                                        <p>Yessing轻运动</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/58fd27579c43c3455489edf4e158ee25.jpg"
                                            alt="女士上装">
                                        <p>女士上装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/b22cc2f686dedd170e7ebf3720517ad0.png"
                                            alt="女士外套">
                                        <p>女士外套</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/2dd15203d2965d250b6f5a9028685556.png"
                                            alt="女士下装">
                                        <p>女士下装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/0fc4b06165e29b166d5e4f4e014990b5.png"
                                            alt="男士上装">
                                        <p>男士上装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/cdd6ee383be7f743aa155e62b88cb271.png"
                                            alt="男士外套">
                                        <p>男士外套</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/d1a8f76015045aecbd779213e63d9b48.png"
                                            alt="男士下装">
                                        <p>男士下装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ffaa82419993278cc0fbf595f61d33ec.png"
                                            alt="男士内衣内裤">
                                        <p>男士内衣内裤</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/5d55ab521e516245a0bb1f1dc72ea84d.png"
                                            alt="女士内衣内裤">
                                        <p>女士内衣内裤</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/10d99d8816e5294f0c0042cdb6de8ec9.png"
                                            alt="男士家居服">
                                        <p>男士家居服</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/3a9f82f0e74bb8f139208c781aa3f836.png"
                                            alt="女士家居服">
                                        <p>女士家居服</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt" data-type="dianqi">
                    <a href="<%=basePath%>goodList?typeName=电器" target="_blank">电器</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="<%=basePath%>goodList?typeName=生活电器">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/66e260e70017bfb6b3e52eadf258a579.png"
                                            alt="生活电器">
                                        <p>生活电器</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="<%=basePath%>goodList?typeName=厨房电器">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f6e0b5ae9c3f24dd0d5cf5fcd3649287.png"
                                            alt="厨房电器">
                                        <p>厨房电器</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="<%=basePath%>goodList?typeName=个护健康">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c2d361558787181260924e8425447191.png"
                                            alt="个护健康">
                                        <p>个护健康</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="<%=basePath%>goodList?typeName=数码">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/2c1f794e57ec0d67be0e71a04f83325c.png"
                                            alt="数码">
                                        <p>数码</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="<%=basePath%>goodList?typeName=影音娱乐">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/39de359a98434d1e8474597ce0547f5b.png"
                                            alt="影音娱乐">
                                        <p>影音娱乐</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">洗护</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/0a0adeda6913fb19848af3b9726c6698.png"
                                            alt="纸品湿巾">
                                        <p>纸品湿巾</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/4d953a47df5b6ceeba0256f1aa082603.png"
                                            alt="家庭清洁">
                                        <p>家庭清洁</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/6c3ae97c61af61f29d3d438b15808b5b.png"
                                            alt="浴室用具">
                                        <p>浴室用具</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/106d67f956c30a2a5e84b42f078c2ff9.png"
                                            alt="美妆">
                                        <p>美妆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/68feca6cac3b850f3ed0fb9ce7946f8d.png"
                                            alt="毛巾浴巾">
                                        <p>毛巾浴巾</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c9b667b72f0b9439b8a43e94d1b63b35.png"
                                            alt="香水香氛">
                                        <p>香水香氛</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f8045d55aaf569bf950b5d0d47558d8e.png"
                                            alt="面部口腔护理">
                                        <p>面部口腔护理</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ceef2d0336d1984c0856237fa9dfe782.png"
                                            alt="身体护理">
                                        <p>身体护理</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/2559b498593c2553965af7058a4781cf.png"
                                            alt="洗发护发">
                                        <p>洗发护发</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/71b0c859ba60725aa326bb13b0dec8d9.png"
                                            alt="生理用品">
                                        <p>生理用品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/410c66bb742cb23070a96f5a06e90ed7.png"
                                            alt="女性用品">
                                        <p>女性用品</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">饮食</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/6fc4fb2a7401457401eb6d2af307f130.png"
                                            alt="饼干糕点">
                                        <p>饼干糕点</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/b1a09cf8fef5d4ab08aba526cc44b46b.png"
                                            alt="小食糖巧">
                                        <p>小食糖巧</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/9908928554085b1d3b3e069ff91789c5.png"
                                            alt="坚果炒货">
                                        <p>坚果炒货</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/98140409caaf045603a7db3a90070ba6.png"
                                            alt="肉类零食">
                                        <p>肉类零食</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/d78df2655119e5642b48b27248b44a92.png"
                                            alt="蜜饯果干">
                                        <p>蜜饯果干</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/a1db16f707d0c7ff3d379fa0c42de68a.png"
                                            alt="冲调饮品">
                                        <p>冲调饮品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/df1622778d354d4c0898df7b077bffd1.png"
                                            alt="茶包花茶">
                                        <p>茶包花茶</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f14322b575accf7ef8ca5d023c09b11a.png"
                                            alt="传统茗茶">
                                        <p>传统茗茶</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/936256162a066534cbb604e480259c26.png"
                                            alt="方便食品">
                                        <p>方便食品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f6f880040958678fe5c1fc42565815ef.png"
                                            alt="米面粮油">
                                        <p>米面粮油</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/98a47f338697b9500f26b61cf148dce0.png"
                                            alt="南北干货">
                                        <p>南北干货</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">餐厨</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f6b1744e2790b7aaeab6c4c2ffd16a71.png"
                                            alt="锅具">
                                        <p>锅具</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/aadaf279450d3e57f3d79881df7cf3b9.png"
                                            alt="清洁保鲜">
                                        <p>清洁保鲜</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/dac95eb1575480389fff59474a4126c6.png"
                                            alt="厨房配件">
                                        <p>厨房配件</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/df195f1c2a6dd0ae0ace192341cf1f92.png"
                                            alt="刀剪砧板">
                                        <p>刀剪砧板</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/9816bdd2345ea7b63c5a225105f59099.png"
                                            alt="餐具">
                                        <p>餐具</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/8baf2f79c3c65003d85d8020ca51ab8d.png"
                                            alt="水具杯壶">
                                        <p>水具杯壶</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/641fb442b690110a080c18df9e5e732c.png"
                                            alt="茶具咖啡具酒具">
                                        <p>茶具咖啡具酒具</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">婴童</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/fe31ec68d171b7944153e5689f2d0397.png"
                                            alt="婴童洗护">
                                        <p>婴童洗护</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/25ecf019c64367b8ddaef63680da3486.png"
                                            alt="婴童床品">
                                        <p>婴童床品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img src="" alt="">
                                        <p>被枕</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/dd0829800b178b536eb1ef5b6ad559df.png"
                                            alt="毛巾口水巾">
                                        <p>毛巾口水巾</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/39e569aa2004237a3a2c13aba7ad8318.png"
                                            alt="" 儿童家具收纳>
                                        <p>儿童家具收纳</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/5a5a14c875a2b412615969a8360c5eef.png"
                                            alt="喂养用品">
                                        <p>喂养用品</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/b44e86a711a778faa74323533f914f8c.png"
                                            alt="玩具">
                                        <p>玩具</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/b49b276dffb76e66bb12bf8f82e1aff2.png"
                                            alt="童车童床">
                                        <p>童车童床</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/648b7a7db41ab7bf6a9b76e639d212f7.png"
                                            alt="童鞋">
                                        <p>童鞋</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/616ff84b25417aac0c3813b1213b9a8d.png"
                                            alt="童包">
                                        <p>童包</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/cb2cd5422657c123e5dbdf3f65af7e12.png"
                                            alt="新生儿服装">
                                        <p>新生儿服装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/5528872beec7214e692807a66c5276f7.png"
                                            alt="小童服装">
                                        <p>小童服装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/1f8c458e1bbb7f8838bd6e429d5b0f9a.png"
                                            alt="中大童服装">
                                        <p>中大童服装</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/7082e33979b20d0b00682f01ec5b8667.png"
                                            alt="婴童配搭">
                                        <p>婴童配搭</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">文体</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/0f78bbf5e144025f91ec71bf6fb656e5.png"
                                            alt="文具">
                                        <p>文具</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/7b8445566675777d318b24ec5ac52669.png"
                                            alt="运动户外">
                                        <p>运动户外</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/da0ac345e98c04594b697b56ebc373a5.png"
                                            alt="乐器唱片">
                                        <p>乐器唱片</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/c11b42c0b816150c291b9fefa666a2d7.png"
                                            alt="礼品卡">
                                        <p>礼品卡</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/73fd6125bd6aa90dd0de3c7de3eb6bf8.png"
                                            alt="游戏点卡">
                                        <p>游戏点卡</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/d2e8149cee91231f094ccea592799fe6.png"
                                            alt="云音乐周边">
                                        <p>云音乐周边</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/4e653429b5c143f7bf7ca9546be19601.png"
                                            alt="暴雪周边">
                                        <p>暴雪周边</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/476d79ec4630b73c6e6dcb76da0837ed.png"
                                            alt="我的世界">
                                        <p>我的世界</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/63072777cf7e2430c5dbac3a7f497dc0.png"
                                            alt="梦幻西游">
                                        <p>梦幻西游</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/84657971f481074aa08bbf83d840d4f9.png"
                                            alt="大话西游">
                                        <p>大话西游</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f6d0ed7bd274f70831a4244b3e5c837f.png"
                                            alt="阴阳师">
                                        <p>阴阳师</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f53c32bb01b50123de2958863a4b871f.png"
                                            alt="文创周边">
                                        <p>文创周边</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/ec06bbca44a92498428bd314a43ed6ff.png"
                                            alt="影视周边">
                                        <p>影视周边</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt">
                    <a href="javascript:;" target="_blank">特色区</a>
                    <div class="yx-tab-dropdown">
                        <div class="dropdown-panel">
                            <ul class="dropdown-cateCard-list">
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/8f2e45b9b5ba4838a328d76f9320533b.png"
                                            alt="日本馆">
                                        <p>日本馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/3b4cf5ae851e82e431509355dc79906a.png"
                                            alt="韩国馆">
                                        <p>韩国馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/0fbf7fe376918ddae5db6925ab423167.png"
                                            alt="东南亚馆">
                                        <p>东南亚馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/f033edd799535ecb86d8bb17291df098.png"
                                            alt="欧美馆">
                                        <p>欧美馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/56d7aff4a0cea2c1d63a4c639501efbb.png"
                                            alt="澳新馆">
                                        <p>澳新馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/3520b03217f5778653243b74a720b131.png"
                                            alt="智造馆">
                                        <p>智造馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/9499c9f22ca914b2a5f15edd215289b4.png"
                                            alt="春风馆">
                                        <p>春风馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/01d883689cf56bcc5d8a8b893a74d8fb.png"
                                            alt="味央馆">
                                        <p>味央馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/fae3e532cb118f71c9ba4ed2af1cd815.png"
                                            alt="Yessing馆">
                                        <p>Yessing馆</p>
                                    </a>
                                </li>
                                <li class="dropdown-cateCard-item">
                                    <a href="javascript:;">
                                        <img
                                            src="https://yanxuan.nosdn.127.net/89a69617b4f06d6f4021463cc0cf0402.png"
                                            alt="严选推荐馆">
                                        <p>严选推荐馆</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="yx-nav-item yx-ibt yx-fixed-hide">
                    <a href="javascript:;" target="_blank">为你严选</a>
                </li>
                <li class="yx-nav-item yx-ibt yx-fixed-hide">
                    <a href="javascript:;" target="_blank">众筹</a>
                </li>
            </ul>
            <script src="<%=basePath%>/public/script/setTopTabnav.js"></script>
        </div>
    </div>
</div>
<script src="<%=basePath%>/public/lib/jquery.js"></script>
<script src="<%=basePath%>/public/script/headerCart.js"></script>
<script>
    $(function () {
    	cartEventHandler({
    		ajaxUrl: "<%=basePath%>shopcart?method=cartJSON",
    		itemUrl: "<%=basePath%>SelectGoodsServlet",
    		removeUrl: "<%=basePath%>shopcart"
    	});
    })
</script>