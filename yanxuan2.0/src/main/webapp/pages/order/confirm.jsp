<%@page import="com.yanxuan.dto.po.ShopCartIGoodtem"%>
<%@page import="com.yanxuan.dto.vo.GoodSimpleItem"%>
<%@page import="com.yanxuan.entity.GoodInfo"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.yanxuan.dao.OrderDao"%>
<%@page import="com.yanxuan.entity.UserInfo"%>
<%@page import="com.yanxuan.entity.Address"%>
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
	<title>网易严选 - 以严谨的态度，为中国消费者甄选天下优品</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/comfirm.css">
	<!-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>-->
	<script src="<%=basePath%>/public/lib/jquery.js"></script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- 主体 -->
	
	<%
		UserInfo user = (UserInfo)session.getAttribute("user");
		Address address = OrderDao.getAddress(user.getUserAddress());
	%>
	<div id="yx-body">
		<div class="yx-row">
			<div class="confirm-container">
				<!-- 收货信息 -->
				<div class="wrap-panel receipt-panel">
					<div class="wrap-hd"><span>收货信息</span></div>
					<div class="wrap-bd">
						<div class="order-addr yx-clearfix">
							<div>
								<div class="yx-fl-left show-addr">
									<p class="line">
										<i class="iconfont icon-address"></i>
										<span class="text">默认地址</span>
									</p>
									<p class="line">
										<span class="label">收&nbsp; 货 人：</span>
										<span class="text"><%=user.getUserName() %></span>
									</p>
									<p class="line">
										<span class="label">联系方式：</span>
										<span class="text"><%=user.getUserMobile() %></span>
									</p>
									<p class="line">
										<span class="label">收获地址：</span>
										<span class="text"><%=address.getProvince() %><%=address.getCity() %><%=address.getArea() %></span>
									</p>
								</div>
								<div class="yx-fl-right">
									<p class="change-addr"><a href="javascript:;" data-tigger="change" class="link">切换地址</a></p>
									<button class="btn btn-default" data-tigger="address">新建地址</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 商品及账单信息 -->
				<div class="wrap-panel good-panel">
					<div>
						<div class="w-table">
							<table class="table">
								<thead class="thead">
									<tr>
										<th class="text-left" style="width: 360px;">商品信息</th>
										<th style="width: 160px;">单价</th>
										<th style="width: 170px;">数量</th>
										<th style="width: 190px;">小计</th>
										<th style="width: 180px;">实付</th>
									</tr>
								</thead>
								<tbody class="tbody">
				<%
					LinkedList<ShopCartIGoodtem> goodSimpleItems = (LinkedList<ShopCartIGoodtem>)session.getAttribute("orderList");
					int count = 0;
					for(int i = 0;i<goodSimpleItems.size();i++){
				%>
									<tr class="tr">
										<td class="item-info">
											<div class="td-wrap">
												<div class="img-wrap">
													<img src="<%=goodSimpleItems.get(i).getGoodPic() %>" alt="" class="img">
												</div>
												<div class="info-wrap">
													<p class="name"><%=goodSimpleItems.get(i).getGoodName() %></p>
													<p class="spec"><%=goodSimpleItems.get(i).getGoodDesc() %></p>
												</div>
											</div>
										</td>
										<td>
											<div class="td-wrap">
												<span>
													<span>¥</span>
													<span><%=goodSimpleItems.get(i).getGoodPrice() %></span>
												</span>
											</div>
										</td>
										<td>
											<div class="td-wrap">
												<span><%=goodSimpleItems.get(i).getCount() %></span>
											</div>
										</td>
										<td>
											<div class="td-wrap">
												<span>
													<span>¥</span>
													<span><%=goodSimpleItems.get(i).getGoodPrice() %></span>
												</span>
											</div>
										</td>
										<td>
											<div class="td-wrap">
												<span>
													<span>¥</span>
													<span><%=goodSimpleItems.get(i).getGoodPrice() %></span>
												</span>
											</div>
										</td>
									</tr>
									<% 
									count = goodSimpleItems.get(i).getGoodPrice()*goodSimpleItems.get(i).getCount()+ count;
					}
					%>
								</tbody>
							</table>
						</div>
					</div>
					<div class="pay-into-panel yx-clearfix">
						<div class="confirm-pay-info">
							<div class="pay-item-info">
								<p class="line">
									<span class="label">商品合计：</span><span class="amount">
										<span>¥</span>
										<span><%=count %></span>
									</span>
								</p>
								<p class="line">
									<span class="label">运费：</span><span class="amount">
										<span>¥</span>
										<span>0.00</span>
									</span>
								</p>
								<p class="line">
									<span class="label">应付总额：</span><span class="amount">
										<span>¥</span>
										<span ><%=count %></span>
									</span>
								</p>
							</div>
							<div class="pay-btn-line">
								<a href="<%=basePath %>OrderCtrl?count=<%=count%>"><input type="button" value="去付款" class="btn btn-primary goto-pay" ></a>
							</div>
							<div class="address-tip">
								<p><%=user.getUserName() %></p>
								<p><%=address.getProvince() %><%=address.getReceiver() %><%=address.getArea() %></p>
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

	<!-- 模态框组件 -->
	<div class="fixed-modal">
		<div class="modal-wrap">
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>/public/script/storage.js"></script>
	<script src="<%=basePath%>/public/script/data.min.js"></script>
	<script src="<%=basePath%>/public/script/address.js"></script>
	<script src="<%=basePath%>/public/script/dialogModal.js"></script>
	<script src="<%=basePath%>/public/script/basicFn.js"></script>
	<script src="<%=basePath%>/public/script/confirm.js"></script>
	<script>
		$(function() {
			loadModal({
				addrUrl: "<%=basePath%>pages/components/modal/address.html"
			});
			gotoPay({
				payUrl: "<%=basePath%>/pages/order/topay.html"
			});
		});
	</script>
</body>
</html>