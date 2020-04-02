<%@page import="java.util.ArrayList"%>
<%@page import="com.yanxuan.dto.vo.GoodSimpleItem"%>
<%@page import="java.util.LinkedList"%>
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
	<title>搜索 - 网易严选</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/itemList.css">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- 主体 -->
	<div id="yx-body">
		<div class="bd-bg">
			<div class="yx-row">
				<!-- 路径导航 -->
				<div class="yx-crumbs">
					<a href="/index.html">首页</a>
					<span class="iconfont icon-next crumb-arrow"></span>
					<span class="cur-loc">搜索的内容</span>
				</div>

				<!-- 导航商品类型 -->
				<div class="good-area">
					<div class="good-sort-bar">
						<div class="sorts">
							<div class="name yx-ibt">排序：</div>
							<div class="category-group yx-ibt">
								<a href="javascript:;" class="category-item active default">默认</a>
								<a href="javascript:;" class="category-item price"  data-price="asc">价格</a>
								<a href="javascript:;" class="category-item "></a>
							</div>
						</div>
					</div>
					<div class="good-container">
						<div class="good-category" data-type="xialiang">
							<div class="good-list">
							
								<!-- 商品列表 -->
								<%
									LinkedList<GoodSimpleItem> list = (LinkedList<GoodSimpleItem>) session.getAttribute("list");
									
									if(list==null){
										
									
								%>
								<div class="search-null">欢迎来到虚空！</div>
														
									<%
									}else{
										for(int i = 0 ;i<list.size();i++){
									%>
											<div class="product-item good-item" id="test">
											<div class="item-hd">
												<a href="<%=basePath%>SelectGoodsServlet?goodId=<%=list.get(i).getGoodId() %>" target="_blank" title="<%=list.get(i).getGoodName() %>">
													<div style="width: 100%; height: 100%"><img class="img img-noload img-small lozad" data-src="<%=list.get(i).getGoodPic() %>" alt="<%=list.get(i).getGoodName() %>"></div>
												</a>
											</div>
											<div class="item-bd">
												<div class="item-tags">
													<%if(!list.get(i).getGoodTag().equals("")){ %>
														<span class="tag tag-other"><%=list.get(i).getGoodTag() %></span>
													<% }%>
												</div>
												<div class="item-name">
													<a href="<%=basePath%>SelectGoodsServlet?goodId=<%=list.get(i).getGoodId() %>" target="_blank" title="<%=list.get(i).getGoodName() %>"><%=list.get(i).getGoodName() %></a>
												</div>
												<div class="item-price">
													<span class="price">￥<%=list.get(i).getGoodPrice() %></span>
												</div>
												<div class="item-desc"><%=list.get(i).getGoodDesc() %>
												</div>
											</div>
										</div>				
										
									<%
										}
									}
									%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$('a.category-item.default').on('click',function(){
							if($(this).hasClass('active'))
								return;
							
							$.ajax({
								url:'<%=path%>/SendListCtrl',
								type:'post',
								data:{
									sendlist : 0
								},
								success: function(data){
									data = JSON.parse(data);
									console.log(data);
									let itemHtml = '';
									data.forEach(item => {
										itemHtml += search.createItem(item,'<%=basePath%>SelectGoodsServlet');
									});
									if(!itemHtml) {
										itemHtml = search.nullItem();
									}
									$('.good-container .good-list').empty().append(itemHtml);
								},
							})
						})
						$('a.category-item.price').on('click',function(){
							let sort;
							if($(this).attr('data-price') == 'asc') {
								sort = 1;
								$(this).attr('data-price', 'desc');
							} else {
								sort = 2;
								$(this).attr('data-price', 'asc');
							}
							
							$.ajax({
								url:'<%=path%>/SendListCtrl',
								type:'post',
								data:{
									sendlist : sort
								},
								success: function(data){
									data = JSON.parse(data);
									console.log(data);
									let itemHtml = '';
									data.forEach(item => {
										itemHtml += search.createItem(item, '<%=basePath%>SelectGoodsServlet');
									});
									if(!itemHtml) {
										itemHtml = search.nullItem();
									}
									$('.good-container .good-list').empty().append(itemHtml);
								},
							})
						})
					
					</script>
							
				</div>

				<div class="fixed-right return-top">
					<div class="return-top-btn">
						<a href="javascript:;">TOP</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include>

	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>/public/script/basicFn.js"></script>
	<script src="<%=basePath%>/public/script/slickSlide.js"></script>
	<script src="<%=basePath%>/public/script/search.js"></script>
	<script src="<%=basePath%>/public/lib/lozad.min.js"></script>
	<script>
		$(function() {
			slickSlide($('.yx-banner .slick-wrap'));
			tab($('.categories .category-item'));
			tab($('.sorts .category-item'));
			
			const observer = lozad();
			observer.observe();
		});
	</script>
</body>
</html>