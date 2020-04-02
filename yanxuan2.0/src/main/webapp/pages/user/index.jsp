<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心 - 网易严选</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/user.css">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body>
	<!-- 头部 -->
<jsp:include page="/header.jsp"></jsp:include>

	<!-- 主体 -->
	<div id="yx-body">
		<div class="yx-row">
			<!-- 路径导航 -->
			<div class="yx-crumbs">
				<a href="../../index.html">首页</a>
				<span class="iconfont icon-next crumb-arrow"></span>
				<span class="cur-loc">个人中心</span>
			</div>

			<div class="container">
				<jsp:include page="/pages/user/left.jsp"></jsp:include>
				<script>
					$(function() {
						let menuItems = $('.menu-item');
						menuItems.removeClass('active').eq(0).addClass('active');
					});
				</script>
				<div class="main-content yx-ibt">
					<div>
						<div class="user-info-wrap">
							<div class="info yx-ibt">
								<div class="info-wrap">
									<a href="<%=basePath%>/publicinfo.html" class="avatar yx-ibt"><img src="<%=basePath%>/public/images/icon/default_user.png" alt="" class="avatar-img"></a>
									<div class="name yx-ibt">
										<a href="<%=basePath%>/publicinfo.html" class="nick-name">username</a>
									</div>
								</div>
								<div class="grow-wrap">
									<div class="grow-num">
										<span class="yx-fl-left"><a href="javascript:;">成长值 &gt;&gt;</a></span>
										<span class="yx-fl-right">
											<span>0</span>
											<span>/</span>
											<span>1</span>
										</span>
									</div>
									<div class="grow-process">
										<div class="pro-num"></div>
									</div>
								</div>
							</div>
							<div class="asset yx-ibt">
								<div class="item">
									<div class="label">我的红包</div>
									<div class="content"><a href="javascript:;">¥0.00</a></div>
								</div>
								<div class="item">
									<div class="label">优惠券</div>
									<div class="content"><a href="javascript:;">0张</a></div>
								</div>
								<div class="item">
									<div class="label">可兑返利</div>
									<div class="content"><a href="javascript:;">¥0.00</a></div>
								</div>
								<div class="item">
									<div class="label">礼品卡</div>
									<div class="content"><a href="javascript:;">¥0.00</a></div>
								</div>
								<div class="item">
									<div class="label">我的积分</div>
									<div class="content"><a href="javascript:;">0</a></div>
								</div>
								<div class="item">
									<div class="label">待领礼包</div>
									<div class="content"><a href="javascript:;">0个</a></div>
								</div>
							</div>
						</div>

						<!-- 未完成订单, 为空时显示 -->
						<div class="undone-orderlist undone-orderlist-empty section-wrap">
							<div class="orderlist-hd section-wrap-hd">
								<h3>
									<span>未完成订单</span>
									<a href="/pages/order/mylist.html" class="see-all-order">查看全部订单</a>
								</h3>
							</div>
							<!-- 未空时 -->
							<div class="emptylist-wrap">
								<div class="empty-status">
									<div class="icon-empty icon-empty-order"></div>
									<div class="empty-text">你已经很久没有下单了哦！</div>
									<a href="/index.html" class="btn btn-ghost">去逛逛</a>
								</div>
							</div>
						</div>

						<!-- 如果有收藏时，显示; 没有收藏时，不显示 -->
						<div class="collection-item-list section-wrap">
							<div class="collection-list-hd section-wrap-hd">
								<h3>
									<span>我的收藏</span>
									<a href="collection.html" class="see-all-order">查看全部收藏</a>
								</h3>
							</div>
							<div class="collection-list section-wrap-bd">
								<div class="product-item collection-item">
									<div class="delete"><span class="close-topic">×</span></div>
									<div class="item-hd">
										<a href="/pages/item/detail.html" target="_blank" title="新色 奢华植鞣头层水牛皮席三件套">
											<div style="width: 100%; height: 100%"><img class="img img-noload img-small" src="<%=basePath%>/public/images/items/jujia/xialiang_pic1.png" alt="新色 奢华植鞣头层水牛皮席三件套"></div>
										</a>
										<div class="color-num">4色可选</div>
									</div>
									<div class="item-bd">
										<div class="item-tags">
											<span class="tag tag-other">满额减</span>
										</div>
										<div class="item-name">
											<a href="/pages/item/detail.html" target="_blank" title="新色 奢华植鞣头层水牛皮席三件套">新色 奢华植鞣头层水牛皮席三件套</a>
										</div>
										<div class="item-price">
											<span class="price">¥2499</span>
										</div>
									</div>
								</div>
								<div class="product-item collection-item">
									<div class="delete"><span class="close-topic">×</span></div>
									<div class="item-hd">
										<a href="/pages/item/detail.html" target="_blank" title=" 平滑密编清凉仿藤席">
											<div style="width: 100%; height: 100%"><img class="img img-noload img-small" src="<%=basePath%>/public/images/items/jujia/xialiang_pic2.png" alt=" 平滑密编清凉仿藤席"></div>
										</a>
										<div class="color-num">2色可选</div>
									</div>
									<div class="item-bd">
										<div class="item-tags">
											<span class="tag tag-other">居家特惠</span>
										</div>
										<div class="item-name">
											<a href="/pages/item/detail.html" target="_blank" title=" 平滑密编清凉仿藤席"> 平滑密编清凉仿藤席</a>
										</div>
										<div class="item-price">
											<span class="price">¥194.4</span>
											<span class="old-price">¥299</span>
										</div>
									</div>
								</div>
								<div class="product-item collection-item">
									<div class="delete"><span class="close-topic">×</span></div>
									<div class="item-hd">
										<a href="/pages/item/detail.html" target="_blank" title=" 商品名">
											<div style="width: 100%; height: 100%"><img class="img img-noload img-small" src="<%=basePath%>/public/images/items/jujia/xialiang_pic2.png" alt=" 商品名"></div>
										</a>
										<div class="color-num">2色可选</div>
									</div>
									<div class="item-bd">
										<div class="item-tags">
											<span class="tag tag-other">标签</span>
										</div>
										<div class="item-name">
											<a href="/pages/item/detail.html" target="_blank" title=" 商品名"> 商品名</a>
										</div>
										<div class="item-price">
											<span class="price">¥194.4</span>
											<span class="old-price">¥299</span>
										</div>
									</div>
								</div>
								<div class="product-item collection-item">
									<div class="delete"><span class="close-topic">×</span></div>
									<div class="item-hd">
										<a href="/pages/item/detail.html" target="_blank" title=" 商品名">
											<div style="width: 100%; height: 100%"><img class="img img-noload img-small" src="<%=basePath%>/public/images/items/jujia/xialiang_pic2.png" alt=" 商品名"></div>
										</a>
										<div class="color-num">2色可选</div>
									</div>
									<div class="item-bd">
										<div class="item-tags">
											<span class="tag tag-other">标签</span>
										</div>
										<div class="item-name">
											<a href="/pages/item/detail.html" target="_blank" title=" 商品名"> 商品名</a>
										</div>
										<div class="item-price">
											<span class="price">¥194.4</span>
											<span class="old-price">¥299</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
</body>
</html>