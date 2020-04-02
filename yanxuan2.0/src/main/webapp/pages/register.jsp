<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册 - 网易严选</title>
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
				<div class="yx-register-wrap">
					<div class="register-box">
						<div class="wrap-header">
							<div class="register-hd">
								<div class="hd-title mail-register-hd">邮箱注册</div>
							</div>
						</div>
						<div id="mail-register-box" class="yx-loading">
							<div class="register-box-bd">
								<form action="login.jsp" id="registerForm" name="registerForm" class="form" >
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-user"></i></div>
										<div class="fc-input">
											<input type="email" name="username" id="username" autocomplete="on" maxlength="35" placeholder="请输入邮箱" required>
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
									</div>
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-password"></i></div>
										<div class="fc-input">
											<input type="password" name="password" id="password" autocomplete="off" maxlength="20" placeholder="请输入密码" required>
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
									</div>
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-password"></i></div>
										<div class="fc-input">
											<input type="password" name="password2" id="password2" autocomplete="off" maxlength="20" placeholder="请确认密码" required>
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
									</div>
									<div class="form-control">
										<div class="fc-icon"><i class="iconfont icon-password"></i></div>
										<div class="fc-input" style="width: 190px;">
											<input type="text" name="mailCode" id="mailCode" autocomplete="off" maxlength="6" placeholder="请输入验证码" >
											<span class="clear"><i class="iconfont icon-close"></i></span>
										</div>
										<input type="button" class="btn btn-default" data-fn="send-code" style="position: absolute;top: 0;right: 0;height: 38px;width:auto;margin:0" value="发送验证码">
									</div>
									<div class="error-tips">
										<!-- <p><i class="iconfont icon-tip"></i><span class="error-type">账号或密码错误</span></p> -->
									</div>
									<div class="form-control-btn">
										<input type="button" value="注 册 " id="login-submit" class="btn-submit">
									</div>
									<script type="text/javascript" th:inline="javascript">
									$('input[data-fn="send-code"]').on('click',function(){
										var username = $("#username").val(); 
										if($(this).hasClass("btn-disabled")) {
											return;
										}
											var message ={
													Send : "true",
													userMail : username
												}
											
											let second = 60;
											$(this).addClass("btn-disabled").val(second + 's');
											let _this = $(this);
										$.ajax({
											url:"<%=path%>/EmailCtrl",
											type:"post",
											data:message,
											success: function() {
												/*let second = 60;
												$(this).addClass("btn-disabled").val(second + 's');
												let timer = setInterval(function() {
													--second;
													if(second === 0) {
														clearInterval(timer);
														$(this).removeClass('btn-disabled').val('重新发送');
													} else {
														$(this).val(second + 's');
													}
												}, 1000);*/
												let timer = setInterval(function() {
													second--;
													_this.val(second + 's');
													if(second === 0) {
														clearInterval(timer);
														_this.removeClass('btn-disabled').val('重新发送');
													}
												}, 1000);
											},
											error:function(){
												
											}
										})
										
										
									})								
									
									$("#login-submit").on('click',function(){
							            var username = $("#username").val();
							            var password = $("#password").val();
							            var password2 = $("#password2").val(); 
							            var Number = $('[name="mailCode"]').val();
							            var errorTips =  $(".error-tips");
							            if(username == '' || password == '' || password2 == '' || Number == ''){
							            	errorTips.text("请输入完整的信息")
							            } else{
							            	var mailReg = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/g;
							            	if(mailReg.test(username)) {
							            		if(password.length > 6){
							            				if(password===password2){
							            					var user= {
											            		userMail: username,
											            		userPwd: password,
											            		number: Number,
											            	}
							            					$.ajax({
											                    url:"<%=path%>/RegisterCtrl",							
											                    type:"post",      
											                    data:user,    
											                    success:function(data){
											                    	
											                        if(eval(data)==false){
											                        	errorTips.text("该邮箱已被注册")    
											                        }
											                        else if(eval(data)==true){
											                        	$(this).val('注 册...');
											                        	$("#registerForm").submit();
											                        }
											                        else{         
											                        	errorTips.text("验证码错误")   
											                        } 
											                    },
											                    
											                })
							            				}else{
							            					errorTips.text("前后密码不一致");
							            				}
							            				
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
							<div class="register-box-ft">
								<div class="ft-row">
									<ul class="other-login-list yx-fl-left">
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-weixin"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-qq"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-xinlang"></i></a></li>
										<li class="yx-ibt"><a href="javascript:;" target="_blank"><i class="iconfont icon-wangyi0"></i></a></li>
									</ul>
									<p class="yx-fl-right">
										<a class="link" href="javascript:;" target="_blank">已有账号?</a>
										<a class="link" href="<%=basePath%>/pages/login.jsp" target="_blank">返回登录</a>
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