<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>支付宝 - 网上支付 安全快速！</title>
	<link rel="icon" href="https://i.alipayobjects.com/common/favicon/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="https://i.alipayobjects.com/common/favicon/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>public/style/alipay.css">
</head>
<body>
	<div id="header">
		<div class="header-inner">
			<div class="header-title">
				<div class="alipay-logo"></div>
				<div class="logo-title">我的收银台</div>
			</div>
		</div>
	</div>
	<%
		int count = (int)request.getAttribute("count");
		String orderId = (String)request.getAttribute("orderId");
	%>
	<div id="container">
		<div class="row">
			<div class="content-hd">
				<p class="ibt">
					<span>[网易严选支付订单]</span>
					<span class="pay-order"><%=orderId %></span>

				</p>
				<p class="ibt"><span>收款方：杭州网易严选贸易有限公司</span></p>
			</div>
			<div class="content-bd">
				<div class="qrcode-area">
					<div class="qrcode-hd">
						<div class="txt-center">扫一扫付款<span style="color:#f7b63d; font-size:16px;font-weight:bold"><%=count %></span>（元）</div>
						<div class="txt-center qrcode-money"></div>
					</div>
					<div class="qrcode-img-wrap">
						<div class="qrcode-img-area">
							<img id="qrcode-img" src="https://i.loli.net/2018/09/09/5b94d7d769fdc.png" alt="二维码">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="copyright">
			<p><a href="javascript:;">ICP证：沪B2-20150087</a></p>
		</div>
		<div class="partner">
			<img src="https://i.alipayobjects.com/e/201303/2R3cKfrKqS.png" alt="合作机构">
		</div>
	</div>

	<div class="fixed-modal">
		<div class="modal-wrap">
			<div class="yx-modal-wrap">
				<div class="modal-box yx-loading">
					<div class="content">
						<p class="txt-center tip">付款成功</p>
						<button id="returnIndex">付款成功，点击返回首页</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=basePath%>public/lib/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="<%=basePath%>public/script/storage.js"></script>
	<script>

		$(function() {
			let qrMoney = $('.qrcode-money');

			qrMoney.text(storage.get('totalPay'));

			successPay();
			function successPay() {
				let timer = null;
				clearTimeout(timer);

				timer = setTimeout(function() {
					let $fixedModal = $('.fixed-modal');
					$fixedModal.velocity('fadeIn', {
						duration: 300,
						complete(elem) {
							setTimeout(function() {
								$(elem).find('.modal-box').removeClass('yx-loading');
								$(elem).find('.content').velocity('fadeIn', 100);
								$('#returnIndex').on('click', function() {
									storage.removeAll();
									self.location = '<%=basePath%>EndingCtrl?orderId=<%=orderId%>';
								});
							}, 1000);
						}
					});
				}, 15000);
			}
		});
	</script>
</body>
</html>