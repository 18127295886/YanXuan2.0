<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我的收藏 - 网易严选</title>
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
				<span class="cur-loc">我的收藏</span>
			</div>

			<div class="container">
			<jsp:include page="/pages/user/left.jsp"></jsp:include>
				<script>
					$(function() {
						let menuItems = $('.menu-item');
						menuItems.removeClass('active').eq(3).addClass('active');
					});
				</script>
				<div class="main-content yx-ibt">
					<div class="collection">
						<div class="common-tab">
							<div class="tab-inner theme1">
								<ul>
									<li class="item active"><a href="javascript:;">商品收藏(<span>2</span>)</a></li>
								</ul>
							</div>
						</div>
						<%
							
						%>
						<div class="collection-con">
							<!-- 收藏为空时 -->
							<c:if test="${empty simpleItems}">
							 <div class="collection-null">
								<div class="emptylist-wrap">
									<div class="empty-status">
										<div class="icon-empty icon-empty-collection"></div>
										<div class="empty-text">还没有任何收藏呢</div>
									</div>
								</div>
							</div> 
							</c:if>

							<c:if test="${not empty simpleItems }">
								<div class="collection-list item-list">
							<c:forEach items="${simpleItems}" var="goodItem">
									 <div class="product-item collection-item" data-goodId="${goodItem.goodId}">
										<div class="delete"><span class="close-topic" onclick='deleteConnection(this)'>×</span></div>
										<div class="item-hd">
											<a href="<%=basePath%>SelectGoodsServlet?goodId=${goodItem.goodId}"
													target="_blank" title="${goodItem.goodName}">
													<div style="width: 100%; height: 100%">
														<img class="img img-noload img-small"
															src="${goodItem.goodPic}"
                                                    alt="${goodItem.goodName}">
													</div>
												</a>
											<!-- <div class="color-num">4色可选</div> -->
										</div>
										<div class="item-bd">
											<div class="item-tags">
													<c:if test="${not empty goodItem.goodTag}">
														<span class="tag tag-other">${goodItem.goodTag}</span>
													</c:if>
												</div>
												<div class="item-name">
													<a href="<%=basePath%>SelectGoodsServlet?goodId=${goodItem.goodId}" target="_blank"
														title="${goodItem.goodName}">${goodItem.goodName}</a>
												</div>
												<div class="item-price">
													<span class="price">${goodItem.goodPrice}</span>
												</div>
										</div>
									</div>
									</c:forEach>
									</div>
									</c:if>
									
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
	<script type="text/javascript">
	function deleteConnection(obj){
		let parTr = $(obj).parents('.product-item');
		let goodId = parTr.attr("data-goodId");
		 $.ajax({
			url : "<%=path%>/updateCollectionCtrl?goodId="+goodId+"&action="+"删除",
			type : "get",
			data : {goodId : goodId,
				action:"删除"	
				},
			success:function(data){
				parTr.remove();
			},
            error:function(){
            	parTr.remove();
            }
		})
	}
	</script>
</body>
</html>