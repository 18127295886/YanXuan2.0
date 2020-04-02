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
	<title>选择付款方式 - 以严谨的态度，为中国消费者甄选天下优品</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/comfirm.css">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body>
	<!-- 头部 -->
<jsp:include page="/header.jsp"></jsp:include>

<%
	int count = (int)request.getAttribute("count");
	String orderId =(String)request.getAttribute("orderId");
%>
	<!-- 主体 -->
	<div id="yx-body">
		<div class="yx-row">
			<div class="pay-panel">
				<div class="pay-panel-hd">
					<h2>选择付款方式</h2>
					<div class="yx-clearfix">
						<p class="yx-fl-left txt-muted trade-no yx-fz16">
							交易号: <span><%=orderId %></span>
						</p>
						<p class="yx-fl-right yx-fz18">
							实付：<span class="txt-red">¥<%=count %></span>
						</p>
					</div>
				</div>
				<form action="../../pages/order/topay.html" method="get" class="payForm" id="payForm">
					<div class="pay-method-panel">
						<div class="hd">支付方式</div>
						<div class="bd">
							<div class="method-list">
								<div class="method-item yx-ibt">
									<div class="radio-box"><input type="radio" name="methods" value="0"></div>
									<i class="icon-payMethod payMethod-alipay"></i>
								</div>
								<div class="method-item yx-ibt">
									<div class="radio-box"><input type="radio" name="methods" value="1"></div>
									<i class="icon-payMethod payMethod-weixin"></i>
								</div>
								<div class="method-item yx-ibt">
									<div class="radio-box"><input type="radio" name="methods" value="2"></div>
									<i class="icon-payMethod payMethod-epay"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="to-pay yx-clearfix">
						<!-- 表单提交的字段，tradNo为交易号，payMethod为付款方式 -->
						<input type="hidden" name="tradeNo" value="20180824153905YXMPDD1609641620">
						<input type="hidden" name="payMethod" value>
						<input type="button" value="立即付款" class="btn btn-primary yx-fl-right" id="go-pay">
					</div>
				</form>
				<!-- 剩余时间 -->
				<div class="paytime-down">
					<span class="label">剩余付款时间：</span>
					<span class="remain-time"></span>
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
			<div class="yx-login-wrap">
				<div class="login-box">
					<div class="wrap-header">
						<div class="close">&times;</div>
					</div>
					<div id="payTip">
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>/public/script/storage.js"></script>
	<script src="<%=basePath%>/public/script/dialogModal.js"></script>
	<script src="<%=basePath%>/public/script/basicFn.js"></script>
	<script src="<%=basePath%>/public/script/topay.js"></script>
	<script>
		$(function() {
			goPayClickHandler({
				alipay: '<%=basePath%>/AlpayCtrl?count=<%=count%>&orderId=<%=orderId%>'
			});
		});
	</script>
	
</body>
</html>