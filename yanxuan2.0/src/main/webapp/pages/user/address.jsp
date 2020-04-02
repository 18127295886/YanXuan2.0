<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.yanxuan.entity.Address"%>
<%@ page import="com.yanxuan.entity.UserInfo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地址管理 - 网易严选</title>
<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
<meta name="description"
	content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico"
	type="image/x-icon">
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
				<a href="../../index.html">首页</a> <span
					class="iconfont icon-next crumb-arrow"></span> <span
					class="cur-loc">地址管理</span>
			</div>

			<div class="container">
		<jsp:include page="/pages/user/left.jsp"></jsp:include>		
		
				<script>
					$(function() {
						let menuItems = $('.menu-item');
						menuItems.removeClass('active').eq(2).addClass('active');
					});
				</script>
				<div class="main-content yx-ibt">
					<div class="address-con">
						<%
							List<Address> userAddressList = (List<Address>) request.getAttribute("userAddressList");
							
						//UserInfo user=(UserInfo)session.getAttribute("user");
						//UserInfo user=new UserInfo();
						//user.setUserAddress(59);
						//user.setUserId(1000000);
						//session.setAttribute("user", user);
						%>
						<!-- 地址为空时 -->
						<c:if test="${empty userAddressList}">
							<div class="address-null">
								<div class="emptylist-wrap">
									<div class="empty-status">
										<div class="icon-empty icon-empty-address"></div>
										<div class="empty-text">您还没有收货地址</div>
										<a href="javascript:;" data-tigger="address"
											class="link add-address">新建地址</a>
									</div>
								</div>
							</div>
						</c:if>
						<!-- 地址不为空 -->
						<c:if test="${not empty userAddressList}">
							<div class="address-wrap">
								<div class="address-top yx-clearfix">
									<div class="title">
										<span>已保存收货地址(地址最多20条，还能保存</span> <span><%=20-userAddressList.size()
										%></span> <span>条)</span>
									</div>
									<a href="javascript:;" class="link" data-tigger="address">+新建地址</a>
								</div>
								<div class="address-body">
									<table class="address-list">
										<thead>
											<tr>
												<th>收货人</th>
												<th>地址</th>
												<th>联系方式</th>
												<th>操作</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userAddressList}" var="userAddress">
												<tr data-addrId="${userAddress.addrId}">
													<td>${userAddress.userId}</td>
													<td class="full-addr"><div>${userAddress.province}${userAddress.city}${userAddress.area}${userAddress.addrDetail}</div></td>
													<td>${userAddress.mobile}</td>
		
													<td><a id="delete-address" href='javascript:;' class="link delete" onclick='deleteAddress(this)'>删除</a></td>
														<script type="text/javascript">
															function deleteAddress(obj) {
																let parTr = $(obj).parents('tr');
																let addrId = parTr.attr("data-addrId");
																//alert(addrId);
																$.ajax({
																	url : "<%=path%>/deleteAddressServlet?addrId="+addrId,
																	type : "get",
																	data : {addrId : addrId},
																	success:function(data){
																		$(obj).parents('tr').velocity('fadeOut', {
												                        	complete(elem) {
												                        		$(elem).remove();
												                        	}
												                        })
																	},
													                error:function(){
												                        $(obj).parents('tr').velocity('fadeOut', {
												                        	complete(elem) {
												                        		$(elem).remove();
												                        	}
												                        })
												                    }
																})
																
															}
															function setDefaultAddress(obj){
																let parTr = $(obj).parents('tr');
																let addrId = parTr.attr("data-addrId");
																//alert(addrId);
																$.ajax({
																	url : "<%=path%>/setDefaultAddressServlet?addrId="+addrId,
																	type : "get",
																	data : {addrId : addrId},
																	success:function(data){
																		let curTr = $(obj).parents('tr');
																		let defaultAddrBtn =$('.default-addrBtn');
																		let defaultBtnHtml = `<button class="btn btn-ghost default-addrBtn">默认地址</button>`;
																		let setDefaultHtml = `<a href="javascript:;" class="link default" onclick='setDefaultAddress(this)'>设为默认地址</a>`;
																		
																		defaultAddrBtn.parent('td').html(setDefaultHtml);
																		curTr.velocity('fadeOut', {
																			duration: 300,
																			complete(elem) {
																				console.log(curTr);
																				$(obj).parent('td').html(defaultBtnHtml);
																				$('.address-list tbody').prepend(elem);
																				$(elem).velocity('fadeIn', {duration: 300});
																			}
																		});
																	},
													                error:function(){
												                       
												                    }
																})
															}
														</script>
					
														<c:choose>
													<c:when test="${user.userAddress==userAddress.addrId}">
														<td><button class="btn btn-ghost default-addrBtn">默认地址</button></td>
													</c:when>
													<c:otherwise>
														<td><a href="javascript:;" class="link default" onclick='setDefaultAddress(this)'>设为默认地址</a></td>
					<!--  亮凯在这里-->
													</c:otherwise>
													</c:choose>
												</tr>


												<!-- <tr>
												<td>llk</td>
												<td class="full-addr"><div>广东省广州市南沙区南沙街道</div></td>
												<td>178****1835</td>
												<td><a href="javascript:;" class="link delete">删除</a></td>
												<td><button class="btn btn-ghost">默认地址</button></td>
											</tr>
											<tr>
												<td>llk</td>
												<td class="full-addr"><div>广东省广州市南沙区南沙街道</div></td>
												<td>178****1835</td>
												<td><a href="javascript:;" class="link delete">删除</a></td>
												<td><a href="javascript:;" class="link default">设为默认地址</a></td>
											</tr> -->
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:if>

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
		<div class="modal-wrap"></div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>/public/script/data.min.js"></script>
	<script src="<%=basePath%>/public/script/address.js"></script>
	<script src="<%=basePath%>/public/script/dialogModal.js"></script>
	<script src="<%=basePath%>/public/script/basicFn.js"></script>
	<script>
		$(function() {
			loadModal({
				addrUrl: "<%=basePath%>pages/components/modal/address.html"
			});
		});
	</script>
	
</body>
</html>



