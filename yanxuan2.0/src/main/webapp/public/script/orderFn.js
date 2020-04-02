/**
 * @author: llk
 * @date: 2018/8/13
 * @function: 订单页相关功能
 */

/**
 * 通过load加载订单页面选项卡内容
 * @return {[type]} [description]
 */
function loadOrderTabContent(opt = {}) {
	let curIndex = 0;
	let tabBtn = $('.order-list .item');
	let orderPanel = $('.order-panel'); //待插入选项卡内容的容器
	let defaultOpt = {
		panelComponentUrl: [
			'/pages/components/order/orderItem.html .order-wrap',
			'/pages/components/order/waitPay.html .order-wrap',
			'/pages/components/order/waitSend.html .order-wrap',
			'/pages/components/order/sended.html .order-wrap',
			'/pages/components/order/waitComment.html .order-wrap'
		] //选项卡内容载入路径数组
	};
	
	let {orderApi, baseUrl} = Object.assign({}, defaultOpt, opt);

	loadOrderItem();

	tabBtn.on('click', function() {
		let index = $(this).index();
		if(index === curIndex) {
			//如果点击的是当前处于激活状态的按钮，不做任何动作
			return;
		}
		tabBtn.removeClass('active').eq(index).addClass('active');
		curIndex = index;

		switch(index) {
			case 0:
				loadOrderItem();
				break;
			case 1:
				loadWaitPay();
				break;
			case 2:
				loadWaitSend();
				break;
			case 3:
				loadSended();
				break;
			case 4:
				loadWaitComment();
				break;
			default:
				break;
		}
	});

	//加载全部订单内容
	function loadOrderItem() {
		$.getJSON(orderApi, function(data) {
			console.log(data);
			let orderWrap = orderPanel.find('.order-wrap');
			if(data.length <= 0) {
				orderWrap.addClass('order-null').empty().append(emptyOrderHtml(0));
			} else {
				let html = '';
				data.forEach((item, index) => {
					html += orderItemHtml(item, baseUrl, index+1);
				});
				orderWrap.removeClass('order-null').empty().append(html);
			}

			orderPanel.show(200);
		});
	}

	//加载待付款内容
	function loadWaitPay() {
		$.getJSON(orderApi, function(data) {
			let orderWrap = orderPanel.find('.order-wrap');
			let html = '';
			data.forEach((item, index) => {
				if(item.orderStatus == 1) {
					html += orderItemHtml(item, baseUrl, index+1);
				}
			});

			if(html.length <= 0) {
				orderWrap.addClass('order-null').empty().append(emptyOrderHtml(1));
			} else {
				orderWrap.removeClass('order-null').empty().append(html);
			}
			orderPanel.show(200);
		});
	}

	//加载待发货内容
	function loadWaitSend() {
		$.getJSON(orderApi, function(data) {
			let orderWrap = orderPanel.find('.order-wrap');
			let html = '';
			data.forEach((item, index) => {
				if(item.orderStatus == 3) {
					html += orderItemHtml(item, baseUrl, index+1);
				}
			});

			if(html.length <= 0) {
				orderWrap.addClass('order-null').empty().append(emptyOrderHtml(3));
			} else {
				orderWrap.removeClass('order-null').empty().append(html);
			}
			orderPanel.show(200);
		});
	}

	//加载已发货
	function loadSended() {
		$.getJSON(orderApi, function(data) {
			let orderWrap = orderPanel.find('.order-wrap');
			let html = '';
			data.forEach((item, index) => {
				if(item.orderStatus == 4) {
					html += orderItemHtml(item, baseUrl, index+1);
				}
			});
			
			if(html.length <= 0) {
				orderWrap.addClass('order-null').empty().append(emptyOrderHtml(4));
			} else {
				orderWrap.removeClass('order-null').empty().append(html);
			}
			orderPanel.show(200);
		});
	}

	//加载待评论内容
	function loadWaitComment() {
		$.getJSON(orderApi, function(data) {
			let orderWrap = orderPanel.find('.order-wrap');
			let html = '';
			data.forEach((item, index) => {
				if(item.orderStatus == 5) {
					html += orderItemHtml(item, baseUrl, index+1);
				}
			});
			if(html.length <= 0) {
				orderWrap.addClass('order-null').empty().append(emptyOrderHtml(5));
			} else {
				orderWrap.removeClass('order-null').empty().append(html);
			}
			orderPanel.show(200);
		});
	}
}

//订单项
function orderItemHtml(data, baseUrl, index) {
	if(!data)
		return '';
	
	let orderStatusStr = orderStatus(data.orderStatus);
	let orderStatusHtml = orderStatusStyle(data.orderStatus);
	
	let html = 
	`<table class="order-item" cellpadding="0">
		<tbody>
			<tr class="head">
				<th colspan="3">
					<span class="deal-time">
						<span>下单时间</span>
						<span>${data.orderDate}</span>
					</span>
					<span class="number">
						<span>订单号</span>
						<span>${data.orderId}</span>
					</span>
					<a href="javascript:;" class="iconfont icon-lajitong delete-btn"></a>
				</th>
			</tr>
			<tr class="body">
				<td>
					<div class="package-item">
						<div class="good">
							<a href="${baseUrl}/SelectGoodsServlet?goodId=${data.goodId}" target="_blank"><img class="img" src="${data.goodPic}"></a>
							<span class="info"><a href="${baseUrl}/SelectGoodsServlet?goodId=${data.goodId}" target="_blank">${data.goodName}</a></span>
						</div>
						<div class="express yx-fz12">
							<div class="cell">
								<span>包裹</span>
								<span>${index}</span>
							</div>
							<div class="">
								共${data.orderGoodNum}件商品
							</div>
						</div>
						<div class="status">
							<div class="cell">
								<span>${orderStatusStr}</span>
							</div>
						</div>
					</div>
				</td>
				<td>
					<div class="cost">
						<p class="price">
							<span>¥</span>
							<span>${data.orderPay.toFixed(2)}</span>
						</p>
						<p class="fee">
							<span>（含运费：¥<span>0.00</span>元）</span>
						</p>
					</div>
				</td>
				<td>
					<div class="txt-center">`+orderStatusHtml+`
						<a href="javascript:; class="link" target="_blank">查看详情</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>`;
	return html;
}

//不同状态
function orderStatus(status) {
	let result = '';
	switch(status) {
		case 1:
			result = '未付款';
			break;
		case 2:
			result = '已取消';
			break;
		case 3:
			result = '待发货';
			break;
		case 4:
			result = '已发货';
			break;
		case 5:
			result = '待评价';
			break;
	}
	return result;
}

//不同订单状态风格
function orderStatusStyle(status) {
	let html = '';
	switch(status) {
		case 1:
			html = `<button class="btn btn-primary btn-waitPay">去付款</button>`
			break;
		case 4:
			html = `<button class="btn btn-primary btn-comfirm">确认收货</button>`;
			break;
		case 5:
			html = `<a href="javascript:;" class="btn btn-primary btn-toCommentt" data-tigger="comment">评 论</a>`
			break;
	}
	return html;
}

//订单为空时
function emptyOrderHtml(status) {
	let html = '';
	switch(status) {
		case 4: //已发货
			html = 
				`<div class="emptylist-wrap">
					<div class="empty-status">
						<div class="icon-empty icon-empty-order"></div>
						<div class="empty-text">暂无已发货订单</div>
					</div>
				</div>`;
			break;
		case 1: //待付款
			html = 
				`<div class="emptylist-wrap">
					<div class="empty-status">
						<div class="icon-empty icon-empty-order"></div>
						<div class="empty-text">当前无待付订单</div>
					</div>
				</div>`;
			break;
		case 3: //待发货
			html = 
				`<div class="emptylist-wrap">
					<div class="empty-status">
						<div class="icon-empty icon-empty-order"></div>
						<div class="empty-text">当前无待发货订单</div>
					</div>
				</div>`;
			break;
		case 5: //待评论
			html = 
				`<div class="emptylist-wrap">
					<div class="empty-status">
						<div class="icon-empty icon-empty-order"></div>
						<div class="empty-text">暂无可评论订单</div>
					</div>
				</div>`;
			break;
		default:
			html =  
				`<div class="emptylist-wrap">
					<div class="empty-status">
						<div class="icon-empty icon-empty-order"></div>
						<div class="empty-text">当前订单为空</div>
					</div>
				</div>`;
			break;
	}
	
	return html;
}
