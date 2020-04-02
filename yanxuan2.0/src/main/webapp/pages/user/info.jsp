<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.yanxuan.entity.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>账号信息 - 网易严选</title>
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
				<span class="cur-loc">账号信息</span>
			</div>

			<jsp:include page="/pages/user/left.jsp"></jsp:include>
				<script>
					$(function() {
						let menuItems = $('.menu-item');
						menuItems.removeClass('active').eq(1).addClass('active');
					});
				</script>
				<div class="main-content yx-ibt">
					<div>
						<div class="common-tab">
							<div class="tab-inner theme1">
								<ul>
									<li class="item active"><a href="javascript:;">基本资料</a></li>
									<li class="item"><a href="javascript:;">感兴趣的分类</a></li>
								</ul>
							</div>
						</div>
						<%
						UserInfo userInfo = (UserInfo) request.getAttribute("UserInfo");
						%>
						<!-- 基本资料 -->
						
						<div class="tab-content show">
							<form class="userinfo-form" action="/yanxuan2.0/ModifyUserInfoServlet" method="get">
								<div class="item user-avator">
									<label class="label">用户头像</label>
									<div class="content">
										<div class="w-avator"><!-- <%=basePath%>/public/images/icon/default_user.png -->
										<c:choose>
											<c:when test="${empty user.userAvatar}">
											<img class="avator-img" src="<%=basePath%>/public/images/icon/default_user.png" alt="">
										</c:when>
										<c:otherwise>
											<img class="avator-img" src="${user.userAvatar}" alt="">
										</c:otherwise>										
										</c:choose>
											<i class="iconfont icon-xiangji"></i>
											<div class="mask"></div>
										</div>
									</div>
								</div>
								<div class="item">					
									<label class="label">用户ID</label>
									<div class="content">${user.userId} <input type="hidden" name="userId" value="${user.userId}"/></div>
								</div>
								<div class="item">					
									<label class="label">账号</label>
									<div class="content">${user.userMail}</div>
								</div>
								<div class="item">					
									<label class="label">昵称</label>
									<div class="content">
										<input type="text" name="nickname" id="nickname" maxlength="20" style="border:0px" value="${user.userName}">
									</div>
								</div>
								<div class="item">					
									<label class="label">性别</label>
									<div class="content" id="mysex">
										<c:choose>
											<c:when test="${user.userSex==1}">
										<div class="b-radio yx-ibt">
											<input type="radio" name="sex" value="1" id="male" checked>
											<label for="male">男</label>
										</div>
										<div class="b-radio yx-ibt">
											<input type="radio" name="sex" value="0" id="female" >
											<label for="female">女</label>
										</div>
										</c:when>
										<c:otherwise>
											<div class="b-radio yx-ibt">
											<input type="radio" name="sex" value="1" id="male" >
											<label for="male">男</label>
										</div>
										<div class="b-radio yx-ibt">
											<input type="radio" name="sex" value="0" id="female" checked>
											<label for="female">女</label>
										</div>	
										</c:otherwise>
										</c:choose>
										
									</div>
								</div> 
								<div class="item">					
									<label class="label">手机号码</label>
									<div class="content"><input type="text" name="userMobile" id="userMobile" style="border:0px;" value="${user.userMobile}"><!-- <a href="javascript:;" class="link">绑定手机号码</a> --></div>
								</div>
								<div class="item">				
									<label class="label">出生日期</label>
									<div class="content">
										<input type="date" name="birthday" id="birthday" style="border:0px;" value="${user.userBirthday}">
									</div>
								</div>
								<div class="item">					
									<label class="label">&nbsp;</label>
									<div class="content">
										<a href="javascript:;" class="btn btn-primary btn-save" onclick='save()'>保存</a>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 感兴趣的分类 -->
						<div class="tab-content ">
							<div class="user-interested-cate">
								<div class="interest-tip">多选几个，小选会推荐地更精准哦！</div>
								<div class="interest-box">
									<div class="interest-item">
										<div class="item-cover">
											<img src="<%=basePath%>/public/images/interest/int1.png" alt="床品被枕" class="int-img">
											<div class="checked-inner">
												<img src="<%=basePath%>/public/images/icon/checked.png" alt class="checked-icon">
											</div>
										</div>
										<div class="item-desc">
											<span class="check-box">
												<input type="checkbox">
											</span>
											<span class="cate-name">床品被枕</span>
										</div>
									</div>
									<div class="interest-item">
										<div class="item-cover">
											<img src="<%=basePath%>/public/images/interest/int1.png" alt="床品被枕" class="int-img">
											<div class="checked-inner">
												<img src="<%=basePath%>/public/images/icon/checked.png" alt class="checked-icon">
											</div>
										</div>
										<div class="item-desc">
											<span class="check-box">
												<input type="checkbox">
											</span>
											<span class="cate-name">床品被枕</span>
										</div>
									</div>
									<div class="interest-item">
										<div class="item-cover">
											<img src="<%=basePath%>/public/images/interest/int1.png" alt="床品被枕" class="int-img">
											<div class="checked-inner">
												<img src="<%=basePath%>/public/images/icon/checked.png" alt class="checked-icon">
											</div>
										</div>
										<div class="item-desc">
											<span class="check-box">
												<input type="checkbox">
											</span>
											<span class="cate-name">床品被枕</span>
										</div>
									</div>
									<div class="interest-item">
										<div class="item-cover">
											<img src="<%=basePath%>/public/images/interest/int1.png" alt="床品被枕" class="int-img">
											<div class="checked-inner">
												<img src="<%=basePath%>/public/images/icon/checked.png" alt class="checked-icon">
											</div>
										</div>
										<div class="item-desc">
											<span class="check-box">
												<input type="checkbox">
											</span>
											<span class="cate-name">床品被枕</span>
										</div>
									</div>
									<div class="interest-item">
										<div class="item-cover">
											<img src="<%=basePath%>/public/images/interest/int1.png" alt="床品被枕" class="int-img">
											<div class="checked-inner">
												<img src="<%=basePath%>/public/images/icon/checked.png" alt class="checked-icon">
											</div>
										</div>
										<div class="item-desc">
											<span class="check-box">
												<input type="checkbox">
											</span>
											<span class="cate-name">床品被枕</span>
										</div>
									</div>
								</div>
								<div class="submit-interest">
									<buttom class="btn btn-primary btn-submit">提 交</buttom>
									<p class="submit-tip">最少选择一项</p>
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
	<script>
		$(function() {
			tab($('.common-tab .item'), $('.main-content .tab-content'));
		});
	</script>
	<script type="text/javascript">
	function save(){
		var userId='${user.userId}';
		var nickname=$("#nickname").val();
		var sex=$('#mysex input[name="sex"]:checked ').val()
		var userMobile=$("#userMobile").val();
		var birthday=$("#birthday").val();
		//alert(nickname);
		//alert(userMobile);
		//alert(birthday);
		//alert(sex);
		$.ajax({
		url : "<%=path%>/modifyUserInfoServlet",
		type : "post",
		data : {
				userId:userId,
				nickname:nickname,
				sex:sex,
				userMobile:userMobile,
				birthday:birthday
				},
		success:function(data){
			//alert(修改成功);
		},
        error:function(){
               
           }
	})
	}
	</script>
</body>
</html>