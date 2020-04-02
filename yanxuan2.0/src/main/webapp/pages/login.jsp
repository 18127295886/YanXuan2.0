<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
	%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录 - 网易严选</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/login.css">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<script src="<%=basePath%>/public/lib/jquery.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script> -->
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- 主体 -->
	<div id="yx-body">
		<div class="yx-body-bg">
			<div class="yx-row">
			<!-- 登录块 -->
				<div class="yx-login-wrap">
					<div class="login-box">
						<div class="wrap-header">
							<div class="login-hd">
								<div class="hd-title mail-login-hd">邮箱登录</div>
							</div>
						</div>
						<div id="mail-login-box" class="yx-loading">
							<div class="login-box-bd">
								<form  id="loginForm" name="loginForm" class="form"  action="../index.jsp">
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-user"></i></div>
										<div class="fc-input">
										<%
											request.setCharacterEncoding("utf-8");
											response.setCharacterEncoding("utf-8");
											
											Cookie[] allCookies = request.getCookies();
											String userMail =null;
											String userPwd = null;
											
											if(allCookies!=null){
												for(Cookie cookie: allCookies){
													if(cookie.getName().equals("user_mail")){
														userMail = cookie.getValue();
													}
													if(cookie.getName().equals("user_pwd")){
														userPwd = cookie.getValue();
													}
												}
											}

										%>
											<%if(userMail != null && userMail.trim().length()>0){ %>
											<input type="text" name="username" id="username" autocomplete="off" maxlength="35" placeholder="请输入邮箱" value=<%=userMail %>>
											<%}else{%>
											<input type="text" name="username" id="username" autocomplete="off" maxlength="35" placeholder="请输入邮箱">
											<%
											}
											%>
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
									</div>
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-password"></i></div>
										<div class="fc-input">
										<%if(userPwd != null && userPwd.trim().length()>0){ %>
											<input type="password" name="password" id="password" autocomplete="off" maxlength="20" placeholder="请输入密码" >
										<%}else{ %>
											<input type="password" name="password" id="password" autocomplete="off" maxlength="20" placeholder="请输入密码" >
										<%} %>
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
									</div>
									<div class="error-tips">
										<!-- <p><i class="iconfont icon-tip"></i><span class="error-type">账号或密码错误</span></p> -->
									</div>
									<div class="form-control-btn">
										<input type="button" value="登 录" id="login-submit" class="btn-submit">
									</div>
									
									<script type="text/javascript">
									$("#login-submit").on('click',function(){
										
							            var username = $("#username").val();
							            var password = $("#password").val();
							            var errorTips =  $(".error-tips");
							            if(username == '' || password == ''){
							            	errorTips.text("账号或密码错误");
							                return;
							            } else{
							            	var mailReg = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/g;
							            	if(mailReg.test(username)) {
							            		if(password.length > 6){
							            			var user=
							            					{
											            		userMail: username,
											            		userPwd: password
											            	}
							           
							            		$.ajax({
								                    url:"<%=path%>/LoginCtrl",							
								                    type:"post",      
								                    data: user,
								                    success:function(data){
								                   		if(data == false){
								                        	errorTips.text("账号或密码错误")
								                       
								                        }
								                        else{
															$(this).val('登 录...');
								                        	$("#loginForm").submit();
								                        }
								                    },
								                    error:function(){
								                        errorTips.text("失败");
								                    }  
								                })
							            		}else{
							            			errorTips.text("密码必须大于6位");
							            		}
							            	} else {
							            		errorTips.text("邮箱格式错误");
							            	}	
							            }
							        })
									</script>
								</form>
							</div>
							<div class="login-box-ft">
								<div class="ft-row">
									<ul class="other-login-list yx-fl-left">
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-weixin"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-qq"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-xinlang"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-wangyi0"></i></a></li>
									</ul>
									<p class="yx-fl-right">
										<a class="link" href="<%=basePath%>/pages/register.jsp" target="_blank">邮箱注册</a>
										<a class="link" href="javascript:;" target="_blank">忘记密码?</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- end -->
			</div>
		</div>
	</div>

	<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>