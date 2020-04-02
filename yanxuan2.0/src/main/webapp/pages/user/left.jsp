<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="aside-nav yx-ibt">
		<div class="side-bar">
			<div class="side-item">
				<div class="hd side-text">账号管理</div>
				<div class="bd">
					<ul>
						<li><a href="<%=basePath%>pages/user/index.jsp"
							class="menu-item side-text">个人中心</a></li>
						<li><a href="<%=basePath%>pages/user/info.jsp"
							class="menu-item side-text">账号信息</a></li>
						<li><a href="<%=basePath%>addressServlet"
							class="menu-item side-text">地址管理</a></li>
						<li><a href="<%=basePath%>showCollectionCtrl"
							class="menu-item side-text">我的收藏</a></li>
						<li><a href="<%=basePath%>footprint"
							class="menu-item side-text">我的足迹</a></li>
					</ul>
				</div>
			</div>
			<div class="side-item">
				<div class="hd side-text">交易管理</div>
				<div class="bd">
					<ul>
						<li><a href="<%=basePath%>pages/order/mylist.jsp"
							class="menu-item side-text">订单管理</a></li>
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
	
</body>
</html>