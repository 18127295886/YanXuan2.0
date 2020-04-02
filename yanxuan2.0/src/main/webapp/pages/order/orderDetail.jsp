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
	<title>订单详情 - 网易严选</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/user.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/order.css">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body>
	<!-- 头部 -->
<jsp:include page="/header.jsp"></jsp:include>

	<!-- 主体 -->
	<div id="yx-body">
		<div class="yx-row">
			<div class="container">
				<div class="aside-nav yx-ibt">
					<div class="side-bar">
						<div class="side-item">
							<div class="hd side-text">账号管理</div>
							<div class="bd">
								<ul>
									<li><a href="../../pages/user/index.html" class="menu-item side-text">个人中心</a></li>
									<li><a href="../../pages/user/info.html" class="menu-item side-text">账号信息</a></li>
									<li><a href="../../pages/user/msgcenter.html" class="menu-item side-text">消息通知</a></li>
									<li><a href="../../pages/user/address.html" class="menu-item side-text">地址管理</a></li>
									<li><a href="../../pages/user/collection.html" class="menu-item side-text">我的收藏</a></li>
									<li><a href="../../pages/user/foot.html" class="menu-item side-text">我的足迹</a></li>
								</ul>
							</div>
						</div>
						<div class="side-item">
							<div class="hd side-text">交易管理</div>
							<div class="bd">
								<ul>
									<li><a href="../../pages/order/mylist.html" class="menu-item side-text active">订单管理</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">我的红包</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">优惠券</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">礼品卡</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">优先购</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">我的众筹</a></li>
								</ul>
							</div>
						</div>
						<div class="side-item">
							<div class="hd side-text">服务中心</div>
							<div class="bd">
								<ul>
									<li><a href="JavaScript:;" class="menu-item side-text">售后记录</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">价格保护</a></li>
									<li><a href="JavaScript:;" class="menu-item side-text">帮助中心</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="main-content yx-ibt">
					<div class="order-detail-container">
						<div class="order-detail">
							<div class="detail-hd">
								<div class="header">
									<div class="yx-ibt" style="height: 50px">
										<span class="yx-ibt header-label">
											<span class="label">订单号</span>
											<span class="value">58506098</span>
										</span>
										<span class="yx-ibt header-label">
											<span class="label">下单时间</span>
											<span class="value">2018-07-25 23:04:12</span>
										</span>
									</div>
								</div>
								<div class="content yx-clearfix">
									<div class="yx-fl-left user-info">
										<p class="label-item addr-item">
											<span class="label">收 件 人：</span>
											<span class="value">llk</span>
										</p>
										<p class="label-item addr-item">
											<span class="label">联系方式：</span>
											<span class="value">178****1835</span>
										</p>
										<p class="label-item addr-item">
											<span class="label">收获地址：</span>
											<span class="value">广东省广州市南沙区环市大道南2号，南沙资讯科技园8号宿舍楼</span>
										</p>
									</div>
									<div class="yx-fl-right pay-info">
										<p class="label-item pay-item">
											<span class="label">商品合计：</span>
											<span class="value">
												<span>¥</span>
												<span>669.00</span>
											</span>
										</p>
										<p class="label-item pay-item">
											<span class="label">运 费：</span>
											<span class="value">
												<span>¥</span>
												<span>0.00</span>
											</span>
										</p>
										<hr class="hr">
										<p class="label-item pay-item">
											<span class="label">应 付：</span>
											<span class="value big-red">
												<span>¥</span>
												<span>669.00</span>
											</span>
										</p>
									</div>
								</div>
							</div>
							<div class="detail-bd">
								<div class="package-item">
									<div class="header">
										<div class="yx-ibt">
											<span class="sequence">包裹1</span>
											<span class="status">已取消</span>
										</div>
									</div>
									<div class="content">
										<div class="inner-wrap">
											<table class="table">
												<thead class="thead">
													<tr>
														<th>商品信息</th>
														<th>单价</th>
														<th>数量</th>
														<th>小计</th>
														<th>实付</th>
													</tr>
												</thead>
												<tbody class="tbody">
													<tr>
														<td class="item-info">
															<div class="img-wrap yx-ibt">
																<a href="../../pages/item/detail.html" target="_blank"><img class="img" src="<%=basePath%>/public/images/order/o1.png" alt=""></a>
															</div>
															<div class="info-wrap yx-ibt">
																<div class="name"><a href="../../pages/item/detail.html" target="_blank">20寸 星空 纯PC铝框登机箱</a></div>
															</div>
														</td>
														<td class="item-price">
															<span>¥</span>
															<span>669.00</span>
														</td>
														<td class="item-count">1</td>
														<td class="item-count">
															<span>¥</span>
															<span>669.00</span>
														</td>
														<td class="item-pay">
															<span>¥</span>
															<span>649.00</span>
														</td>
													</tr>
												</tbody>
											</table>
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