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
	<title>订单管理 - 网易严选</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/user.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/order.css">
	<!-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>-->
	<script src="<%=basePath%>/public/lib/jquery.js"></script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="/header.jsp"></jsp:include>
	<!-- 主体 -->
	<div id="yx-body">
		<div class="yx-row">
			<!-- 路径导航 -->
			<div class="yx-crumbs">
				<a href="<%=basePath%>/index.jsp">首页</a>
				<span class="iconfont icon-next crumb-arrow"></span>
				<span class="cur-loc">订单管理</span>
			</div>

			<div class="container">
				<jsp:include page="/pages/user/left.jsp"></jsp:include>
				<script>
					$(function() {
						let menuItems = $('.menu-item');
						menuItems.removeClass('active').eq(5).addClass('active');
					});
				</script>
				<div class="main-content yx-ibt">
					<div class="order-container">
						<div class="order-list">
							<div class="order-list-hd filter">
								<div class="common-tab order-list-tab yx-ibt">
									<div class="tab-inner theme2">
										<ul>
											<li class="item active"><a href="javascript:;">全部订单</a></li>
											<li class="item "><a href="javascript:;">待付款</a></li>
											<li class="item "><a href="javascript:;">待发货</a></li>
											<li class="item "><a href="javascript:;">已发货</a></li>
											<li class="item "><a href="javascript:;">待评价</a></li>
										</ul>
									</div>
								</div>
								<div class="search-filter yx-ibt">
									<input type="text" name="filterInput" class="order-filter-input yx-ibt" placeholder="输入商品名称或订单号搜索">
									<input type="submit" value="搜索" class="btn order-filter-submit yx-ibt">
								</div>
							</div>
							<div class="order-panel">
								<div class="order-wrap">
									<!-- 订单项 -->
								
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
	<script src="<%=basePath%>/public/script/orderFn.js"></script>
	<script>
		$(function() {
			loadOrderTabContent({
				orderApi: '<%=basePath%>/MyListCtrl',
				baseUrl: '<%=basePath%>'
			});
		});
	</script>
</body>
</html>