<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>网易严选居家篇 -
	夏凉床品，舒适一夏、MUJI等品牌制造商出品、守护你的睡眠时光、大师级工艺、一盏灯，温暖一个家、选自古驰竹柄原料供应商、各种风格软装装点你的家、装饰你的家、出行小物，贴心相伴、居家晾晒必备好物、专业家庭医用好物、抑菌除味，打造宠物舒适空间</title>
<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
<meta name="description"
	content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
<link rel="stylesheet" href="<%=basePath%>/public/style/itemList.css">
<!-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>-->
<script src="<%=basePath%>/public/lib/jquery.js"></script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="/header.jsp"></jsp:include>
	
	<script>
		$(function() {
			let navItem = $('.yx-nav-item');
			navItem.removeClass('yx-active');
			navItem.each(function(index) {
				if(navItem.eq(index).attr('data-type') == 'dianqi') {
					navItem.eq(index).addClass('yx-active');
				}
			});
		});
	</script>
	<!-- 主体 -->
	<div id="yx-body">
		<div class="bd-bg">
			<div class="yx-row">
				<!-- 路径导航 -->
				<div class="yx-crumbs">
					<a href="/index.html">首页</a> <span
						class="iconfont icon-next crumb-arrow"></span> <span
						class="cur-loc">电器</span>
				</div>
				<!-- 横幅 轮播图-->
				<div class="yx-banner">
					<div class="slick-wrap">
						<div class="slick-slider">
							<button class="btn btn-prev">
								<i class="iconfont icon-prev"></i>
							</button>
							<div class="slick-list">
								<div class="slick-track">
									<div class="slick-item show-item">
										<a href="javascript:;" target="_blank" title="夏凉冷感床品"><img
											class="img"
											src="<%=basePath%>/public/images/banner_slide/jujia_pic1.jpg"
											alt="夏凉冷感床品"></a>
									</div>
									<div class="slick-item">
										<a href="javascript:;" target="_blank" title="美颜新品上线"><img
											class="img"
											src="<%=basePath%>/public/images/banner_slide/jujia_pic2.jpg"
											alt="美颜新品上线"></a>
									</div>
								</div>
							</div>
							<button class="btn btn-next">
								<i class="iconfont icon-next"></i>
							</button>
							<ul class="slick-dots">
								<li class="slick-dot slick-dot-active">
									<button class="dot-btn">1</button>
								</li>
								<li class="slick-dot">
									<button class="dot-btn">2</button>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 导航商品类型 -->
				<div class="good-area">
					<div class="good-sort-bar">
						<div class="categories">
							<div class="name yx-ibt">分类：</div>
							<div class="category-group yx-ibt">
								<a href="javascript:;" class="category-item active">全部</a>
								<c:forEach items="${glvo.smallTypes}" var="taslable"
									varStatus="flag">
									<a href="javascript:;" class="category-item ">${taslable.smallType}</a>
								</c:forEach>

							</div>
						</div>

						<div class="sorts">
							<div class="name yx-ibt">排序：</div>
							<div class="category-group yx-ibt">
								<a href="javascript:;" class="category-item active default">默认</a>
								<%--  <c:forEach items="${glvo.rankFuns}" var="rankItem" varStatus="flag">
                                <a href="javascript:;" class="category-item ">${rankItem}</a>
                            </c:forEach> --%>

								<a href="javascript:;" class="category-item price"
									data-price="asc">价格</a> <a href="javascript:;"
									class="category-item ">好评</a>
							</div>
						</div>
					</div>


					<div class="good-container">
						<c:forEach items="${glvo.simGoodList}" var="item">
							<div class="good-category">
								<div class="hd">
									<div class="title">
										<img class="img-icon"
											src="<%=basePath%>/public/images/nav_icon/jujia/xialiang.png"
											alt="<c:out value="${item.key.smallType}" />"> <span
											class="name"><c:out value="${item.key.smallType}" /></span>
									</div>
									<%--<p class="desc">夏凉床品，舒适一夏</p>--%>
								</div>
								<div class="good-list">
									<c:forEach items="${item.value}" var="goodItem">
										<!-- 商品列表 -->
										<div class="product-item good-item">
											<div class="item-hd">
												<a href="<%=basePath%>SelectGoodsServlet?goodId=${goodItem.goodId}"
													target="_blank" title="${goodItem.goodName}">
													<div style="width: 100%; height: 100%">
														<img class="img img-noload img-small"
															src="${goodItem.goodPic}"
															<%--src="<%=basePath%>/public/images/items/jujia/xialiang_pic1.png"--%>
                                                    alt="${goodItem.goodName}">
													</div>
												</a>
												<%--<div class="color-num">4色可选</div>--%>
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
												<div class="item-desc">${goodItem.goodDesc}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--<div class="good-container" style="display:none;"></div>-->
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
	<script
		src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>/public/script/basicFn.js"></script>
	<script src="<%=basePath%>/public/script/slickSlide.js"></script>
	<script src="<%=basePath%>/public/script/search.js"></script>
	<script>
    $(function () {
        slickSlide($('.yx-banner .slick-wrap'));
        //tab($('.categories .category-item'));
        //tab($('.sorts .category-item'));
    });
</script>
	<script type="text/javascript">
function tabShowCategory(typeBtn, sortBtn) {
	let sort = '默认', type = '全部';
	
	function typeCategoryClickHandler() {
		typeBtn.on('click', function() {
			typeBtn.removeClass('active');
			$(this).addClass('active');
			type = $(this).text();

			if(sort == '默认' && type == '全部') {
				location.reload();
				return;
			}
			
			//console.log(type, sort);
			sendData();
		});
	}
	
	function sortCategoryClickHandler() {
		sortBtn.on('click', function() {
			sortBtn.removeClass('active');
			$(this).addClass('active');
			sort = $(this).text();
			
			if(sort == '默认' && type == '全部') {
				location.reload();
				return;
			}
			
			if($(this).attr('data-price')) {
				if($(this).attr('data-price') == 'asc') {
					sort = '价格正序';
					$(this).attr('data-price', 'desc');
				} else {
					sort = '价格倒序';
					$(this).attr('data-price', 'asc');
				}
			}
			
			//console.log(type, sort);
			sendData();
		});
	}
	
	function sendData() {
		$.ajax({
			url:"<%=path%>/goodListShowCtrl?type="+type+"&sort="+sort,
			type:'get',
			data:{
				type:sort,
				sort:sort
			},
			success: function(data){
				//console.log(data);
				data = JSON.parse(data);
				
				console.log(data);
				let itemHtml = '';
				data.goodInfos.forEach(item => {
					itemHtml += search.createItem(item, '<%=basePath%>SelectGoodsServlet');
				});
				if(!itemHtml) {
					itemHtml = search.nullItem();
				}
				let goodList = `<div class="good-list" style="margin-top: 25px;">`+itemHtml+`</div>`;
				$('.good-container').empty().append(goodList);
			},
		})
	}
	
	typeCategoryClickHandler();
	sortCategoryClickHandler();
}

tabShowCategory($('.categories .category-item'), $('.sorts .category-item'))
</script>
</body>
</html>