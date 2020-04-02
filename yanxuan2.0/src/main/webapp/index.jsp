<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>网易严选 - 以严谨的态度，为中国消费者甄选天下优品</title>
	<meta name="keywords" content="网易严选,严选,网易优选,网易甄选,网易优品,网易精选,甄选家,严选态度">
	<meta name="description" content="网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。">
	<link rel="shortcut icon" href="<%=basePath%>/public/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>/public/style/basic.css">
	<link rel="stylesheet" href="<%=basePath%>/public/fonts/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>/public/style/index.css">
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
				if(index == 0) {
					navItem.eq(index).addClass('yx-active');
				}
			});
		});
	</script>
	<!-- 主体 -->
	<div id="yx-body">
		<!-- 横幅 -->
		<div class="yx-banner">
			<div class="slick-wrap">
				<div class="slick-slider">
					<button class="btn btn-prev"><i class="iconfont icon-prev"></i></button>
					<div class="slick-list">
						<div class="slick-track">
							<div class="slick-item show-item">
								<a href="javascript:;" target="_blank" title="活动 教师节">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/3269d529b4494dc7e4e6f8ed58359c4c.jpg?imageView&quality=95&thumbnail=1920x420" alt="活动 教师节"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="专题 9月穿搭A">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/055e8bd76776a05a42d96c88c4b3176b.jpg?imageView&quality=95&thumbnail=1920x420" alt="专题 9月穿搭A"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="活动 秋品换新">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/27e8d4cfd629ce415bb3866c9a6fd157.jpg?imageView&quality=95&thumbnail=1920x420" alt="活动 秋品换新"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="福利社 百货宠物">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/5d4661aea523f539e1ec8bab56bd0e71.jpg?imageView&quality=95&thumbnail=1920x420" alt="福利社 百货宠物"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="福利社 教师节美食">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/c4d4cd27a1bcb5c4c72a19db633db270.jpg?imageView&quality=95&thumbnail=1920x420" alt="福利社 教师节美食"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="专题 酒">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/e339b7b02e8d745052d983e4dfb1689c.jpg?imageView&quality=95&thumbnail=1920x420" alt="专题 酒"></a>
							</div>
							<div class="slick-item">
								<a href="javascript:;" target="_blank" title="专题 职场新鲜人">
								<img class="img lozad" data-src="https://yanxuan.nosdn.127.net/81d4f9d81a89ae3141de255dfa5ac61e.jpg?imageView&quality=95&thumbnail=1920x420" alt="专题 职场新鲜人"></a>
							</div>
						</div>
					</div>
					<button class="btn btn-next"><i class="iconfont icon-next"></i></button>
					<ul class="slick-dots">
						<li class="slick-dot slick-dot-active"><button class="dot-btn">1</button></li>
						<li class="slick-dot"><button class="dot-btn">2</button></li>
						<li class="slick-dot"><button class="dot-btn">3</button></li>
						<li class="slick-dot"><button class="dot-btn">4</button></li>
						<li class="slick-dot"><button class="dot-btn">5</button></li>
						<li class="slick-dot"><button class="dot-btn">6</button></li>
						<li class="slick-dot"><button class="dot-btn">7</button></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="xy-container">
			<!-- 品牌制造商 -->
			<div class="con-section yx-manufacturer">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">品牌制造商</h2>
							</a>
							<small class="yx-fz14 yx-ibt">工厂直达消费者，剔除品牌溢价</small>
						</div>
						<div class="yx-fl-right">
							<a href="javascript:;" target="_blank" class="more yx-fz14">更多制造商 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="manufacturer-list">
							<a href="javascript:;" target="_blank" class="manufacturer first large">
								<div class="mask"></div>
								<div class="name">海外制造商</div>
								<div class="price">9.9元起</div>
								<div class="imgWrap">
									<img class="img img-noload lozad" data-src="http://yanxuan.nosdn.127.net/802ff06dd3ef161db046eeb8db6cb4be.jpg" alt="海外制造商">
								</div>
							</a>
							<a href="javascript:;" target="_blank" class="manufacturer second large">
								<div class="mask"></div>
								<div class="name">Kenneth Cole制造商</div>
								<div class="price">219元起</div>
								<div class="imgWrap">
									<img class="img img-noload lozad" data-src="<%=basePath%>/public/images/items/manufacturer/m_KC.png" alt="CK制造商">
								</div>
							</a>
							<a href="javascript:;" target="_blank" class="manufacturer small">
								<div class="mask"></div>
								<div class="name">Ralph Lauren制造商</div>
								<div class="price">19元起</div>
								<div class="imgWrap">
									<img class="img img-noload lozad" data-src="<%=basePath%>/public/images/items/manufacturer/m_RL.png" alt="CK制造商">
								</div>
							</a>
							<a href="javascript:;" target="_blank" class="manufacturer small last">
								<div class="mask"></div>
								<div class="name">CK制造商</div>
								<div class="price">9.9元起</div>
								<div class="imgWrap">
									<img class="img img-noload lozad" data-src="<%=basePath%>/public/images/items/manufacturer/m_foreign.jpg" alt="CK制造商">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 新品首发 -->
			<div class="con-section yx-newProduct">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">新品首发</h2>
							</a>
							<small class="yx-fz14 yx-ibt">为你寻觅世间好物</small>
						</div>
						<div class="yx-fl-right">
							<a href="javascript:;" target="_blank" class="more yx-fz14">更多新品 &gt;</a>
						</div>
					</div>
					<div class="section-body slick-wrap">
						<div class="slick-slider">
							<button class="btn btn-prev"><i class="iconfont icon-prev"></i></button>
							<div class="slick-list draggable">
								<div class="slick-track">
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="网易有道翻译王 2.0pro" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/621362a91fcab80a55eb4685649ccb5f.png?quality=95&thumbnail=265x265&imageView"  alt="网易有道翻译王 2.0pro">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/1052f693fa0b062b3259bdf9be758356.png?quality=95&thumbnail=265x265&imageView"  alt="网易有道翻译王 2.0pro">
												</div>
											</a>
										</div>
										<div class="item-bd">
											<div class="item-tags">
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="网易有道翻译王 2.0pro">网易有道翻译王 2.0pro</a>
											</div>
											<div class="item-price">
												<span class="price">¥1688</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="头层牛皮舒软女休闲鞋" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/86013f5b233479d29ee5b8c725b4c8ee.png?quality=95&thumbnail=265x265&imageView"  alt="头层牛皮舒软女休闲鞋">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/43dbb888ae7cfc88bc3e4f2e1a218fa2.jpg?quality=95&thumbnail=265x265&imageView"  alt="头层牛皮舒软女休闲鞋">
												</div>
											</a>
											<div class="color-num">3色可选</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="头层牛皮舒软女休闲鞋">头层牛皮舒软女休闲鞋</a>
											</div>
											<div class="item-price">
												<span class="price">¥329</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="泰国制造 天然乳胶枕 护肩舒眠 升级抗菌" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/5d5ac39fa2e4ba1f9edb2bb1cb469ddf.png?quality=95&thumbnail=265x265&imageView"  alt="泰国制造 天然乳胶枕 护肩舒眠 升级抗菌">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/c491f5bc7d1fc25f095abd482f2f6a96.jpg?quality=95&thumbnail=265x265&imageView"  alt="泰国制造 天然乳胶枕 护肩舒眠 升级抗菌">
												</div>
											</a>
											<div class="color-num">泰国制造</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="泰国制造 天然乳胶枕 护肩舒眠 升级抗菌">泰国制造 天然乳胶枕 护肩舒眠 升级抗菌</a>
											</div>
											<div class="item-price">
												<span class="price">¥199</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="日本制造 缤纷果味汽水 300毫升" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/89449ebb60d9f933ec4f879eabb4c900.png?quality=95&thumbnail=265x265&imageView"
														alt="日本制造 缤纷果味汽水 300毫升">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/ba34c63eef150de82ea0b26493dd6ed9.jpg?quality=95&thumbnail=265x265&imageView"
														alt="日本制造 缤纷果味汽水 300毫升">
												</div>
											</a>
											<div class="color-num">日本制造</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
												<span class="tag tag-hot">满额减</span>
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="日本制造 缤纷果味汽水 300毫升">日本制造 缤纷果味汽水 300毫升</a>
											</div>
											<div class="item-price">
												<span class="price">¥9999</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="韩国制造 超声波去角质离子导入美容仪" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/49042bb9fe2ac558968dad373431a899.png?quality=95&thumbnail=265x265&imageView"
														alt="韩国制造 超声波去角质离子导入美容仪">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/72d173e58cebef786b2093766084458a.jpg?quality=95&thumbnail=265x265&imageView"
														alt="韩国制造 超声波去角质离子导入美容仪">
												</div>
											</a>
											<div class="color-num">韩国制造</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
												<span class="tag tag-hot">爆品</span>
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="韩国制造 超声波去角质离子导入美容仪">韩国制造 超声波去角质离子导入美容仪</a>
											</div>
											<div class="item-price">
												<span class="price">¥269</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="日本除菌除氯净水龙头" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/1dc8f019e9be0164990edfa1d253ebb1.png?quality=95&thumbnail=265x265&imageView"
														alt="日本除菌除氯净水龙头">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad"
														data-src="https://yanxuan.nosdn.127.net/3d11d83a53af9c7ca06c0fc55bdf71b2.jpg?quality=95&thumbnail=265x265&imageView"
														alt="日本除菌除氯净水龙头">
												</div>
											</a>
											<div class="color-num">日本专利</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="日本除菌除氯净水龙头">日本除菌除氯净水龙头</a>
											</div>
											<div class="item-price">
												<span class="price">¥295</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="开学季床品礼包" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/f748d0f26169c77dafdca069784443b8.png?quality=95&thumbnail=265x265&imageView"  alt="开学季床品礼包">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/bbaf0df51156f98566cf41df95ff4af7.jpg?quality=95&thumbnail=265x265&imageView"  alt="开学季床品礼包">
												</div>
											</a>
										</div>
										<div class="item-bd">
											<div class="item-tags">
												<span class="tag tag-other">福利价</span>
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="开学季床品礼包">开学季床品礼包</a>
											</div>
											<div class="item-price">
												<span class="price">¥299</span>
											</div>
										</div>
									</div>
									<div class="product-item new-product">
										<div class="item-hd">
											<a href="javascript:;" title="假日物语阳台折叠挂桌" target="_blank">
												<div class="show-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/d9d0ade7d44d1c447cab884a895dfb38.png?quality=95&thumbnail=265x265&imageView"  alt="假日物语阳台折叠挂桌">
												</div>
												<div class="hover-img">
													<img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/50ec4bebd2a24902e06479f954ebfa91.png?quality=95&thumbnail=265x265&imageView"  alt="假日物语阳台折叠挂桌">
												</div>
											</a>
											<div class="color-num">3色可选</div>
										</div>
										<div class="item-bd">
											<div class="item-tags">
												<span class="tag"></span>
											</div>
											<div class="item-name">
												<a href="javascript:;" target="_blank" title="假日物语阳台折叠挂桌">假日物语阳台折叠挂桌</a>
											</div>
											<div class="item-price">
												<span class="price">¥139</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn btn-next"><i class="iconfont icon-next"></i></button>
						</div>
					</div>
				</div>
			</div>

			<!-- 人气推荐 -->
			<div class="con-section yx-popular">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">人气推荐</h2>
							</a>
							<div class="common-tab yx-ibt">
								<ul class="tab-list">
									<li class="item active yx-ibt">
										<a href="javascript:;">编辑推荐</a>
									</li>
									<li class="item yx-ibt">
										<a href="javascript:;">热销总榜</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="yx-fl-right">
							<a href="javascript:;" target="_blank" class="more yx-fz14">更多推荐 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="show-container">
							<div class="product-item popular-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="20寸全铝镁合金登机箱">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/a2c2f2b27abe0b3c710c03af27655720.png?quality=95&thumbnail=320x320&imageView" alt="20寸全铝镁合金登机箱"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="20寸全铝镁合金登机箱">20寸全铝镁合金登机箱</a>
									</div>
									<div class="item-price">
										<span class="price">¥699</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="AB面独立弹簧床垫 进口乳胶">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/60de0631b077e236160a4d621c00ebe8.png?quality=95&thumbnail=180y180&imageView"
											alt="AB面独立弹簧床垫 进口乳胶"></div>
									</a>
									<div class="color-num">2色可选</div>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="AB面独立弹簧床垫 进口乳胶">AB面独立弹簧床垫 进口乳胶</a>
									</div>
									<div class="item-price">
										<span class="price">¥2599</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="网易智造X3 Plus蓝牙HiFi耳机">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/ccdbdc82bdc8929723e4941a93f85550.png?quality=95&thumbnail=180y180&imageView"
											alt="网易智造X3 Plus蓝牙HiFi耳机"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="网易智造X3 Plus蓝牙HiFi耳机">网易智造X3 Plus蓝牙HiFi耳机</a>
									</div>
									<div class="item-price">
										<span class="price">¥199</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="茶六趣茗茶礼盒 165克">
										<div style="width: 100%; height: 100%">
											<img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/cff23a222493b0424461c8f818348e6d.png?quality=95&thumbnail=180y180&imageView"
											alt="茶六趣茗茶礼盒 165克"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="茶六趣茗茶礼盒 165克">茶六趣茗茶礼盒 165克</a>
									</div>
									<div class="item-price">
										<span class="price">¥159</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item down">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="美国制造 除甲醛空气净化剂227g">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/2d43d642d928240ef2013e8da1c133b2.png?quality=95&thumbnail=180y180&imageView"
											alt="美国制造 除甲醛空气净化剂227g"></div>
									</a>
									<div class="color-num">美国制造</div>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
										<span class="tag tag-other">限时购</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="美国制造 除甲醛空气净化剂227g">美国制造 除甲醛空气净化剂227g</a>
									</div>
									<div class="item-price">
										<span class="price">¥38.3</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item down">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="每日坚果">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad"
										data-src="https://yanxuan.nosdn.127.net/12cea73ce3039c94b89a47ee25e04d52.png?quality=95&thumbnail=180y180&imageView" alt="每日坚果"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="每日坚果">每日坚果</a>
									</div>
									<div class="item-price">
										<span class="price">¥35.8</span>
									</div>
								</div>
							</div>
							<div class="product-item popular-item down">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="日式和风声波式电动牙刷（可单买刷头）">
										<div style="width: 100%; height: 100%">
										<img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/e5474a8f4fd5748079e2ba2ead806b51.png?quality=95&thumbnail=180y180&imageView"
											alt="日式和风声波式电动牙刷（可单买刷头）"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="日式和风声波式电动牙刷（可单买刷头）">日式和风声波式电动牙刷（可单买刷头）</a>
									</div>
									<div class="item-price">
										<span class="price">¥129</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 限时购 -->
			<div class="con-section yx-flashSale">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">限时购</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<a href="javascript:;" target="_blank" class="more yx-fz14">更多抢购 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="flash-sale-lt">
							<div class="screen-hd">18点场</div>
							<div class="line"></div>
							<div class="screen-endtips">距离结束还剩</div>
							<!-- 倒计时 -->
							<div class="count-down">
								<span class="w-cd" id="hour">02</span>
								<span class="colon">:</span>
								<span class="w-cd" id="minute">00</span>
								<span class="colon">:</span>
								<span class="w-cd" id="second">00</span>
							</div>
							<button class="btn btn-see-more">查看更多</button>
							<a class="link" href="javascript:;" target="_blank"></a>
						</div>
						<div class="flash-sale-rt flash-item-list">
						<!-- 商品模块 -->
							<div class="flash-sale-item">
								<div class="item-lt">
									<a href="javascript:;" target="_blank" title="日本制造 晶钻玻璃锅套装">
										<div><img class="img img-noload lozad" data-src="<%=basePath%>/public/images/items/flashSale/item1.png" alt="严选"></div>
									</a>
								</div>
								<div class="item-rt">
									<h3 class="item-name"><a href="javascript:;" target="_blank">日本制造 晶钻玻璃锅套装</a></h3>
									<p class="item-des">世界五百强康宁出品</p>
									<div class="item-num">
										<div class="num-bar">
											<div class="num-bar-in"></div>
										</div>
										<div class="num-tips">
											<span>还剩</span>
											<span>149</span>
											<span>件</span>
										</div>
									</div>
									<div class="item-price">
										<span class="now-price">
											<span>限时价</span>
											<span class="yuan">￥</span>
											<span class="n-price">599</span>
										</span>
										<span class="old-price">
											<span>原价</span>
											<span class="o-price">￥685</span>
										</span>
									</div>
									<a href="" class="btn btn-buynow">立即抢购</a>
								</div>
							</div>
						<!-- end -->
							<div class="flash-sale-item">
								<div class="item-lt">
									<a href="javascript:;" target="_blank" title="硅藻土浴室地垫">
										<div><img class="img img-noload lozad"
											data-src="https://yanxuan.nosdn.127.net/74467088dd7edd3ea26a8955cdf91227.png?imageView&thumbnail=180x180&quality=95"
											alt="严选"></div>
									</a>
								</div>
								<div class="item-rt">
									<h3 class="item-name"><a href="javascript:;" target="_blank">硅藻土浴室地垫</a></h3>
									<p class="item-des">防滑防霉，能喝水的天然地垫</p>
									<div class="item-num">
										<div class="num-bar">
											<div class="num-bar-in" style="width: 94%"></div>
										</div>
										<div class="num-tips">
											<span>还剩</span>
											<span>546</span>
											<span>件</span>
										</div>
									</div>
									<div class="item-price">
										<span class="now-price">
											<span>限时价</span>
											<span class="yuan">￥</span>
											<span class="n-price">98.7</span>
										</span>
										<span class="old-price">
											<span>原价</span>
											<span class="o-price">￥138</span>
										</span>
									</div>
									<a href="" class="btn btn-buynow">立即抢购</a>
								</div>
							</div>
							<div class="flash-sale-item">
								<div class="item-lt">
									<a href="javascript:;" target="_blank" title="宁夏枸杞 258克">
										<div><img class="img img-noload lozad"
											data-src="https://yanxuan.nosdn.127.net/49eede33b74a81b84392b15e81bb867d.png?imageView&thumbnail=180x180&quality=95"
											alt="严选"></div>
									</a>
								</div>
								<div class="item-rt">
									<h3 class="item-name"><a href="javascript:;" target="_blank">宁夏枸杞 258克</a></h3>
									<p class="item-des">粒大色红，甘醇甜糯</p>
									<div class="item-num">
										<div class="num-bar">
											<div class="num-bar-in" style="width: 87%"></div>
										</div>
										<div class="num-tips">
											<span>还剩</span>
											<span>799</span>
											<span>件</span>
										</div>
									</div>
									<div class="item-price">
										<span class="now-price">
											<span>限时价</span>
											<span class="yuan">￥</span>
											<span class="n-price">28.9</span>
										</span>
										<span class="old-price">
											<span>原价</span>
											<span class="o-price">￥35</span>
										</span>
									</div>
									<a href="" class="btn btn-buynow">立即抢购</a>
								</div>
							</div>
							<div class="flash-sale-item">
								<div class="item-lt">
									<a href="javascript:;" target="_blank" title="清凉透气男式船袜">
										<div><img class="img img-noload img-noload lozad"
											data-src="https://yanxuan.nosdn.127.net/20a5739359790a8c9d3923aec66cb3fa.png?imageView&thumbnail=180x180&quality=95"
											alt="严选"></div>
									</a>
								</div>
								<div class="item-rt">
									<h3 class="item-name"><a href="javascript:;" target="_blank">"清凉透气男式船袜"</a></h3>
									<p class="item-des">取材“棉中贵族”皮马棉，更柔韧更透气</p>
									<div class="item-num">
										<div class="num-bar">
											<div class="num-bar-in" style="width: 77%"></div>
										</div>
										<div class="num-tips">
											<span>还剩</span>
											<span>487</span>
											<span>件</span>
										</div>
									</div>
									<div class="item-price">
										<span class="now-price">
											<span>限时价</span>
											<span class="yuan">￥</span>
											<span class="n-price">21</span>
										</span>
										<span class="old-price">
											<span>原价</span>
											<span class="o-price">￥29</span>
										</span>
									</div>
									<a href="" class="btn btn-buynow">立即抢购</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 福利社 -->
			<div class="con-section yx-saleCenter">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">福利社</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<a href="javascript:;" target="_blank" class="more yx-fz14">查看全部福利 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="index-carousel yx-fl-left">
							<div class="slick-wrap">
								<div class="slick-slider">
									<button class="btn btn-prev"><i class="iconfont icon-prev"></i></button>
									<div class="slick-list">
										<div class="slick-track">
											<div class="slick-item show-item">
												<a href="javascript:;" target="_blank"><img src="<%=basePath%>/public/images/items/saleCenter/slide_item1.jpg" alt="领券中心"></a>
											</div>
											<div class="slick-item">
												<a href="javascript:;" target="_blank"><img src="<%=basePath%>/public/images/items/saleCenter/slide_item2.jpg" alt="福利早餐"></a>
											</div>
										</div>
									</div>
									<button class="btn btn-next"><i class="iconfont icon-next"></i></button>
									<ul class="slick-dots">
										<li class="slick-dot slick-dot-active"><button class="dot-btn">1</button></li>
										<li class="slick-dot"><button class="dot-btn">2</button></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="module-list yx-fl-left">
							<!-- 今日特价 -->
							<div class="module">
								<div class="module-hd yx-clearfix">
									<div class="yx-fl-left">今日特价</div>
									<div class="yx-fl-right">
										<a href="javascript:;" target="_blank" class="more yx-fz12">查看全部 &gt;</a>
									</div>
								</div>
								<div class="module-bd yx-clearfix">
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank" title="色胶布刺绣折伞"><img src="<%=basePath%>/public/images/items/saleCenter/item1.png" alt="色胶布刺绣折伞" class="img"></a>
											<div class="discount">
												<span class="num">8.5</span>
												<span>折</span>
											</div>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;">色胶布刺绣折伞</a></div>
											<div class="limit-price">
												<span>限时价</span>
												<span class="yuan">￥</span>
												<span class="price">73.1</span>
											</div>
											<div class="counter-price">
												<span>原价</span>
												<span class="price">￥86</span>
											</div>
											<a href="javascript:;" target="_blank" class="btn-buynow">立即抢购</a>
										</div>
									</div>
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank" title="冬夏两用 护脊椰棕弹簧床垫">
												<img data-src="https://yanxuan.nosdn.127.net/05ecfb1f8beff52a1aa4e48b21dda530.png?quality=95&thumbnail=130x130&imageView"
													alt="冬夏两用 护脊椰棕弹簧床垫" class="img lozad"></a>
											<div class="discount">
												<span class="num">9</span>
												<span>折</span>
											</div>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;">冬夏两用 护脊椰棕弹簧床垫</a></div>
											<div class="limit-price">
												<span>限时价</span>
												<span class="yuan">￥</span>
												<span class="price">1899</span>
											</div>
											<div class="counter-price">
												<span>原价</span>
												<span class="price">￥2090</span>
											</div>
											<a href="javascript:;" target="_blank" class="btn-buynow">立即抢购</a>
										</div>
									</div>
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank" title="贝壳头儿童运动鞋">
												<img data-src="https://yanxuan.nosdn.127.net/6d6c75b47f9608e3085be939ba1f65fc.png?quality=95&thumbnail=130x130&imageView"
												alt="商品名" class="img lozad"></a>
											<div class="discount">
												<span class="num">7.8</span>
												<span>折</span>
											</div>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;">贝壳头儿童运动鞋</a></div>
											<div class="limit-price">
												<span>限时价</span>
												<span class="yuan">￥</span>
												<span class="price">109</span>
											</div>
											<div class="counter-price">
												<span>原价</span>
												<span class="price">￥139</span>
											</div>
											<a href="javascript:;" target="_blank" class="btn-buynow">立即抢购</a>
										</div>
									</div>
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank" title="（特惠装）婴幼儿手口湿巾1920片">
											<img data-src="https://yanxuan.nosdn.127.net/914ba4d6fbacf9a4a143f1d10e16eb3f.png?quality=95&thumbnail=130x130&imageView"
												alt="商品名" class="img lozad"></a>
											<div class="discount">
												<span class="num">8.5</span>
												<span>折</span>
											</div>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;">（特惠装）婴幼儿手口湿巾1920片</a></div>
											<div class="limit-price">
												<span>限时价</span>
												<span class="yuan">￥</span>
												<span class="price">146</span>
											</div>
											<div class="counter-price">
												<span>原价</span>
												<span class="price">￥172</span>
											</div>
											<a href="javascript:;" target="_blank" class="btn-buynow">立即抢购</a>
										</div>
									</div>
								</div>
							</div>
							<div class="module module-small">
								<div class="module-hd yx-clearfix">
									<div class="yx-fl-left">季节折扣</div>
									<div class="yx-fl-right">
										<a href="javascript:;" target="_blank" class="more yx-fz12">全部 &gt;</a>
									</div>
								</div>
								<!-- 季节折扣 -->
								<div class="module-bd">
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank">
												<img src="<%=basePath%>/public/images/items/saleCenter/sd_item1.png" alt="" class="img"></a>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;" target="_blank">男式塔罗彩条 拉链针织开衫</a></div>
											<div class="item-price">
												<span class="limit-price">
													<span>￥</span>
													<span>169</span>
												</span>
												<span class="counter-price">
													<span>￥</span>
													<span>329</span>
												</span>
											</div>
											<a href="javascript:;" target="_blank"><i class="iconfont icon-cart"></i></a>
										</div>
									</div>
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank">
												<img data-src="https://yanxuan.nosdn.127.net/88576f942d8286d3b6783e555c1a519b.png?quality=95&thumbnail=50x50&imageView" alt="" class="img lozad"></a>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;" target="_blank">棉质生活 婴儿纯棉柔巾</a></div>
											<div class="item-price">
												<span class="limit-price">
													<span>￥</span>
													<span>69</span>
												</span>
											</div>
											<a href="javascript:;" target="_blank"><i class="iconfont icon-cart"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- 今日APP价 -->
							<div class="module module-small">

								<div class="module-hd yx-clearfix">
									<div class="yx-fl-left">今日APP价</div>
									<div class="yx-fl-right">
										<a href="javascript:;" target="_blank" class="more yx-fz12">全部 &gt;</a>
									</div>
								</div>
								<div class="module-bd">

									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank">
												<img data-src="https://yanxuan.nosdn.127.net/3ab1fe8d3339598b11ae75dbcf243287.png?quality=95&thumbnail=50x50&imageView" alt="" class="img lozad"></a>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;" target="_blank">春风TryFun魂系列千面电动飞机杯</a></div>
											<div class="item-price">
												<span class="limit-price">
													<span>￥</span>
													<span>69.1</span>
												</span>
												<span class="counter-price">
													<span>￥</span>
													<span>99</span>
												</span>
											</div>
											<a href="javascript:;" target="_blank"><i class="iconfont icon-cart"></i></a>
										</div>
									</div>
									<div class="m-item">
										<div class="item-hd">
											<a href="javascript:;" target="_blank">
												<img data-src="https://yanxuan.nosdn.127.net/06ffbdabf215e9d9d7ab0048a77f0ee3.png?quality=95&thumbnail=50x50&imageView" alt="" class="img lozad"></a>
										</div>
										<div class="item-bd">
											<div class="item-name"><a href="javascript:;" target="_blank">韩国制造 青木时 挂钟</a></div>
											<div class="item-price">
												<span class="limit-price">
													<span>￥</span>
													<span>193</span>
												</span>
												<span class="counter-price">
													<span>￥</span>
													<span>199</span>
												</span>
											</div>
											<a href="javascript:;" target="_blank"><i class="iconfont icon-cart"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 导航商品类型 -->
			<div class="con-section yx-indexCates">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">居家</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">夏凉</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">床品件套</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">被枕</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">家具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">灯具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">收纳</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">布艺软装</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="<%=basePath%>/public/images/items/jujia/big_pic1.jpg" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="AB面独立弹簧床垫 进口乳胶">
										<div><img class="img img-noload img-small lozad"
											data-src="<%=basePath%>/public/images/items/jujia/pic2.png" alt="AB面独立弹簧床垫 进口乳胶"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="AB面独立弹簧床垫 进口乳胶">AB面独立弹簧床垫 进口乳胶</a>
									</div>
									<div class="item-price">
										<span class="price">¥2599</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="全期猫粮 1.8KG">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/aa68d160af714a4df687227bbdf89768.png?quality=95&thumbnail=265x265&imageView" alt="全期猫粮 1.8KG"></div>

									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags"><span class="tag-other">满折</span></div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="全期猫粮 1.8KG">AB面独立弹簧床垫 进口乳胶</a>
									</div>
									<div class="item-price">
										<span class="price">¥88</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="全棉针织条纹四件套 新款">
										<div><img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/2eb0624b89d2cce1a5fb13187a0c10d8.jpg?quality=95&thumbnail=265x265&imageView"
												alt="全棉针织条纹四件套 新款"></div>
										<div class="color-num">5色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags"><span class="tag-other">爆品</span></div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="全棉针织条纹四件套 新款">AB面独立弹簧床垫 进口乳胶</a>
									</div>
									<div class="item-price">
										<span class="price">¥299</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="林音系列实木床">
										<div><img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/58acbc1b7450c0bd6c685fc8acd0aab3.png?quality=95&thumbnail=265x265&imageView"
											alt="林音系列实木床"></div>
										<div class="color-num">2色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags"></div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="林音系列实木床">AB面独立弹簧床垫 进口乳胶</a>
									</div>
									<div class="item-price">
										<span class="price">¥1999</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">鞋包配饰</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">行李箱</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">女士包袋</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">男士包袋</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">钱包及小皮件</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">女鞋</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">男鞋</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">拖鞋</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/bc99e6be40877ee0fb997c96122dc2d1.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="尖头后绊带女高跟鞋">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/4f9f7156359026bd0dc7dcbf16a6dcfd.png?quality=95&thumbnail=265x265&imageView" alt="尖头后绊带女高跟鞋"></div>
										<div class="color-num">2色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">秋季特惠</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="尖头后绊带女高跟鞋">尖头后绊带女高跟鞋</a>
									</div>
									<div class="item-price">
										<span class="price">¥269</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="玩趣彩虹四季拖鞋">
										<div><img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/0466a812b3bd56197650d0b618abbf62.png?quality=95&thumbnail=265x265&imageView"
											alt="玩趣彩虹四季拖鞋"></div>
										<div class="color-num">10色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="玩趣彩虹四季拖鞋">玩趣彩虹四季拖鞋</a>
									</div>
									<div class="item-price">
										<span class="price">¥19</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="金属流苏小方包">
										<div><img class="img img-noload img-small lozad"
										data-src="https://yanxuan.nosdn.127.net/a9cf9ba39ab1993a1515a6783db08da9.png?quality=95&thumbnail=265x265&imageView"
										alt="金属流苏小方包"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="金属流苏小方包">金属流苏小方包</a>
									</div>
									<div class="item-price">
										<span class="price">¥299</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="清新舒适帆布鞋">
										<div><img class="img img-noload img-small lozad"
											data-src="https://yanxuan.nosdn.127.net/822d8a4a583fd0b4306391f6c776d623.png?quality=95&thumbnail=265x265&imageView"
											alt="清新舒适帆布鞋"></div>
										<div class="color-num">4色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">满折</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="清新舒适帆布鞋">清新舒适帆布鞋</a>
									</div>
									<div class="item-price">
										<span class="price">¥99</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">服装</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">T恤</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">运动</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">牛仔</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">女式上装</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">女式外套</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">女式下装</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">男式上装</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/6a82694f13d51f27d0ed6a8f56e385e1.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="女式修身简约小脚裤">
										<div><img class="img img-noload img-small lozad"
										data-src="https://yanxuan.nosdn.127.net/45c6730e33fe7afbd96f0cead502d08d.png?quality=95&thumbnail=265x265&imageView" alt="女式修身简约小脚裤"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">加购价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="女式修身简约小脚裤">女式修身简约小脚裤</a>
									</div>
									<div class="item-price">
										<span class="price">¥199</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="男式无缝休闲运动T恤">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/b729be19f346810f91fa6d8e770cec73.png?quality=95&thumbnail=265x265&imageView" alt="男式无缝休闲运动T恤"></div>
										<div class="color-num">4色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="男式无缝休闲运动T恤">男式无缝休闲运动T恤</a>
									</div>
									<div class="item-price">
										<span class="price">¥69</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="女式天丝棉弹小脚牛仔裤">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/07b59c4612704de9169e9aa6d8edeb3a.png?quality=95&thumbnail=265x265&imageView" alt="女式天丝棉弹小脚牛仔裤"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">加购价</span>
										<span class="tag tag-other">换季特惠</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="女式天丝棉弹小脚牛仔裤">女式天丝棉弹小脚牛仔裤</a>
									</div>
									<div class="item-price">
										<span class="price">¥119</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="女式浪漫散摆修身连衣裙">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/e0fcd63d29618685f2690e4e47719b4e.png?quality=95&thumbnail=265x265&imageView" alt="女式浪漫散摆修身连衣裙"></div>
										<div class="color-num">2色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="女式浪漫散摆修身连衣裙">女式浪漫散摆修身连衣裙</a>
									</div>
									<div class="item-price">
										<span class="price">¥399</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">电器</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">生活电器</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">厨房电器</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">个护健康</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">数码</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">影音娱乐</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/7598c623e51be892450d4784e1837dea.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="多功能料理机/榨汁机">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/b4478556c9cee77bf37d140e3785f075.png?quality=95&thumbnail=265x265&imageView" alt="多功能料理机/榨汁机"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">满额减</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="多功能料理机/榨汁机">多功能料理机/榨汁机</a>
									</div>
									<div class="item-price">
										<span class="price">¥259</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="网易智造 LS2 超薄振膜耳机">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/20de6c8554c32f747da159709413a095.png?quality=95&thumbnail=265x265&imageView" alt="网易智造 LS2 超薄振膜耳机"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="网易智造 LS2 超薄振膜耳机">网易智造 LS2 超薄振膜耳机</a>
									</div>
									<div class="item-price">
										<span class="price">¥99</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="网易智造空气感超薄苹果手机壳">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/58de46e4ece818a686e54510606c091f.png?quality=95&thumbnail=265x265&imageView" alt="网易智造空气感超薄苹果手机壳"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="网易智造空气感超薄苹果手机壳">网易智造空气感超薄苹果手机壳</a>
									</div>
									<div class="item-price">
										<span class="price">¥39</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="养生壶">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/04763003a311710e58da2539bf573949.png?quality=95&thumbnail=265x265&imageView" alt="养生壶"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">满额减</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="养生壶">养生壶</a>
									</div>
									<div class="item-price">
										<span class="price">¥399</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">洗护</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">纸品湿巾</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">家庭清洁</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">生理用品</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">浴室用具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">毛巾</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">美妆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">香氛</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/334444e6a7bbcf30be9fc0ea7945568f.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="女士洗面奶 150ml">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/95cbd0fdea8d832cc87f2452e0a66fa0.png?quality=95&thumbnail=265x265&imageView" alt="女士洗面奶 150ml"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="女士洗面奶 150ml">女士洗面奶 150ml</a>
									</div>
									<div class="item-price">
										<span class="price">¥59</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="男士洗面奶 150ml">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/4ed0b3ba344a1a8a050de4f06d178b7d.png?quality=95&thumbnail=265x265&imageViewg" alt="男士洗面奶 150ml"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="男士洗面奶 150ml">男士洗面奶 150ml</a>
									</div>
									<div class="item-price">
										<span class="price">¥59</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="日本制造 无火香氛 No.11">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/d14589809d950caa8e48e177cf56581b.png?quality=95&thumbnail=265x265&imageView" alt="日本制造 无火香氛 No.11"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="日本制造 无火香氛 No.11">日本制造 无火香氛 No.11</a>
									</div>
									<div class="item-price">
										<span class="price">¥89</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="日本制造 天然草本睡眠足贴">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/2331196ef5d46010f234632f538fb06b.png?quality=95&thumbnail=265x265&imageView" alt="日本制造 天然草本睡眠足贴"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">满折</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="日本制造 天然草本睡眠足贴">日本制造 天然草本睡眠足贴</a>
									</div>
									<div class="item-price">
										<span class="price">¥69</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">饮食</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">糕点</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">小食</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">坚果炒货</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">果干</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">肉类零食</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">冲饮</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">茗茶</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/8f4c20915c03a74cd658cb92eb447755.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="致师者黑巧克力礼盒 72克">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/e21bd963603cb86c14fb583060c743c7.png?quality=95&thumbnail=265x265&imageView" alt="致师者黑巧克力礼盒 72克"></div>
										<div class="color-num">2种图案</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="致师者黑巧克力礼盒 72克">致师者黑巧克力礼盒 72克</a>
									</div>
									<div class="item-price">
										<span class="price">¥48</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="仲秋·拾月 茗月夜月饼礼盒 60克*8枚">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/25219f227cbe1002288674e3b4831f69.png?quality=95&thumbnail=265x265&imageView" alt="仲秋·拾月 茗月夜月饼礼盒 60克*8枚"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="仲秋·拾月 茗月夜月饼礼盒 60克*8枚">仲秋·拾月 茗月夜月饼礼盒 60克*8枚</a>
									</div>
									<div class="item-price">
										<span class="price">¥199</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="眷村酱面 115克*4袋">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/331b5c2dc0d3c57331992f892f4f589c.png?quality=95&thumbnail=265x265&imageView" alt="眷村酱面 115克*4袋"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="眷村酱面 115克*4袋">眷村酱面 115克*4袋</a>
									</div>
									<div class="item-price">
										<span class="price">¥62</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="商品名称">
										<div><img class="img img-noload img-small lozad" data-src="<%=basePath%>/public/images/items/jujia/pic2.png" alt="商品名称"></div>
										<div class="color-num">几色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">标签</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="商品名称">商品名称</a>
									</div>
									<div class="item-price">
										<span class="price">¥9999</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">餐厨</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">水具杯壶</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">餐具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">锅具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">清洁保鲜</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">厨房配件</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">刀剪砧板</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">茶具咖啡具酒具</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/29bd0ca07cebe4dc999856c3824b6ea5.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="友趣 烘焙体验装22件套">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/a82338fa52c3d434b55d38f22aa6e3a9.png?quality=95&thumbnail=265x265&imageView" alt="友趣 烘焙体验装22件套"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">满额减</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="友趣 烘焙体验装22件套">友趣 烘焙体验装22件套</a>
									</div>
									<div class="item-price">
										<span class="price">¥89</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="地板除尘干巾">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/ff9d71cf05bf5900dd81e1e6d8deaf6b.png?quality=95&thumbnail=265x265&imageView" alt="地板除尘干巾"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="地板除尘干巾">地板除尘干巾</a>
									</div>
									<div class="item-price">
										<span class="price">¥9</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="双面抗菌 防滑透明菜板">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/2815759563c3b926e1fbe661ced2abaf.png?quality=95&thumbnail=265x265&imageView" alt="双面抗菌 防滑透明菜板"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="双面抗菌 防滑透明菜板">双面抗菌 防滑透明菜板</a>
									</div>
									<div class="item-price">
										<span class="price">¥49</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="100年传世珐琅锅">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/ee60377a8d743036f82ae0de1c42cab0.png?quality=95&thumbnail=265x265&imageView" alt="100年传世珐琅锅"></div>
										<div class="color-num">2色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">爆品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="100年传世珐琅锅">100年传世珐琅锅</a>
									</div>
									<div class="item-price">
										<span class="price">¥268</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">婴童</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">暑期好物</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">新生儿服装</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">小童服装</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">中大童服装</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">内衣配搭</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">童鞋童包</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">婴童洗护</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/b184988f96d8119aa726f75a423c618a.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="贝壳头儿童运动鞋">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/6d6c75b47f9608e3085be939ba1f65fc.png?quality=95&thumbnail=265x265&imageView" alt="贝壳头儿童运动鞋"></div>
										<div class="color-num">4色可选</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">今日特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="贝壳头儿童运动鞋">贝壳头儿童运动鞋</a>
									</div>
									<div class="item-price">
										<span class="price">¥109</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="6件装 婴幼儿手口湿巾80片">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/5713af62fb5b0da45db3e054afc3504e.png?quality=95&thumbnail=265x265&imageView" alt="6件装 婴幼儿手口湿巾80片"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">今日特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="6件装 婴幼儿手口湿巾80片">6件装 婴幼儿手口湿巾80片</a>
									</div>
									<div class="item-price">
										<span class="price">¥44</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="日式简约 大豆纤维水洗棉枕">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/2332fa80d31e3cc6b54c487c6505c0d5.png?quality=95&thumbnail=265x265&imageView" alt="日式简约 大豆纤维水洗棉枕"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">今日特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="日式简约 大豆纤维水洗棉枕">日式简约 大豆纤维水洗棉枕</a>
									</div>
									<div class="item-price">
										<span class="price">¥49</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="3条装 蜂巢华夫格双层方巾3条装">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/8d523402b8b8c71177f458e579249fdc.png?quality=95&thumbnail=265x265&imageView" alt="3条装 蜂巢华夫格双层方巾3条装"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">今日特价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="3条装 蜂巢华夫格双层方巾3条装">3条装 蜂巢华夫格双层方巾3条装</a>
									</div>
									<div class="item-price">
										<span class="price">¥29</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">文体</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">文具</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">运动户外</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">唱片</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">礼品卡</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">游戏点卡</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">暴雪周边</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">我的世界</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/8090d8b7b756007eb3a1277e6be94ded.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="头层牛皮单肩/斜挎包 网易游戏">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/f9eb3b93dd8f7182cf81420d0ef7b7d0.png?quality=95&thumbnail=265x265&imageView" alt="头层牛皮单肩/斜挎包 网易游戏"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="头层牛皮单肩/斜挎包 网易游戏">头层牛皮单肩/斜挎包 网易游戏</a>
									</div>
									<div class="item-price">
										<span class="price">¥358</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="微孔头水性笔">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/2db03b84d1004b65321169ecd39c14db.png?quality=95&thumbnail=265x265&imageView" alt="微孔头水性笔"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-other">满件减</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="微孔头水性笔">微孔头水性笔</a>
									</div>
									<div class="item-price">
										<span class="price">¥7</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="严选礼品卡 200元面值">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/a31d7ecdec0f914e1c375fac666c1183.png?quality=95&thumbnail=265x265&imageView" alt="严选礼品卡 200元面值"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="严选礼品卡 200元面值">严选礼品卡 200元面值</a>
									</div>
									<div class="item-price">
										<span class="price">¥200</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="云音乐哆啦探索·哆啦A梦海洋大作战手机壳">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/4e4da513dc3ea81a3fdd925feb6e9d95.png?quality=95&thumbnail=265x265&imageView" alt="云音乐哆啦探索·哆啦A梦海洋大作战手机壳"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">新品</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="云音乐哆啦探索·哆啦A梦海洋大作战手机壳">云音乐哆啦探索·哆啦A梦海洋大作战手机壳</a>
									</div>
									<div class="item-price">
										<span class="price">¥25</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">特色区</h2>
							</a>
						</div>
						<div class="yx-fl-right">
							<div class="subcate-list">
								<span>
									<a href="javascript:;" target="_blank">日本馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">韩国馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">东南亚馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">欧美馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">澳新馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">智造馆</a>
								</span>
								<span>
									<b class="spilt">/</b>
									<a href="javascript:;" target="_blank">春风馆</a>
								</span>
							</div>

							<a href="javascript:;" target="_blank" class="more">查看更多 &gt;</a>
						</div>
					</div>
					<div class="section-body">
						<div class="banner">
							<a href="javascript:;" target="_blank" title="">
								<img class="banner-img lozad" data-src="https://yanxuan.nosdn.127.net/5eec0d04396e109e3dde91f08945c9b7.jpg?imageView&&thumbnail=1090x310&quality=95" alt="">
							</a>
						</div>
						<div class="product-list">
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="日本制造 和歌山柚子梅酒 720毫升">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/790ecbc8e5b42e7756948b5476d0fcee.png?quality=95&thumbnail=265x265&imageView" alt="日本制造 和歌山柚子梅酒 720毫升"></div>
										<div class="color-num">日本制造</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
										<span class="tag tag-hot">福利价</span>
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="日本制造 和歌山柚子梅酒 720毫升">日本制造 和歌山柚子梅酒 720毫升</a>
									</div>
									<div class="item-price">
										<span class="price">¥109</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="意大利制造 男女款100%超细美利奴毛衣">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/fb6e2a0fd689c95d37b3a95f458c523b.png?quality=95&thumbnail=265x265&imageView" alt="意大利制造 男女款100%超细美利奴毛衣"></div>
										<div class="color-num">意大利制造</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="意大利制造 男女款100%超细美利奴毛衣">意大利制造 男女款100%超细美利奴毛衣</a>
									</div>
									<div class="item-price">
										<span class="price">¥899</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="网易智造小方盒插线板（新国标）">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/977f4a6c991f4f95159127c66fd1007c.png?quality=95&thumbnail=265x265&imageView" alt="网易智造小方盒插线板（新国标）"></div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="网易智造小方盒插线板（新国标）">网易智造小方盒插线板（新国标）</a>
									</div>
									<div class="item-price">
										<span class="price">¥69</span>
									</div>
								</div>
							</div>
							<div class="product-item">
								<div class="item-hd">
									<a href="javascript:;" target="_blank" title="泰国制造 分区颗粒乳胶枕 儿童款">
										<div><img class="img img-noload img-small lozad" data-src="https://yanxuan.nosdn.127.net/f405d355cc63184d5cd5205bbcc6aad9.png?quality=95&thumbnail=265x265&imageView" alt="泰国制造 分区颗粒乳胶枕 儿童款"></div>
										<div class="color-num">泰国制造</div>
									</a>
								</div>
								<div class="item-bd">
									<div class="item-tags">
									</div>
									<div class="item-name">
										<a href="javascript:;" target="_blank" title="泰国制造 分区颗粒乳胶枕 儿童款">泰国制造 分区颗粒乳胶枕 儿童款</a>
									</div>
									<div class="item-price">
										<span class="price">¥129</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 甄选家 -->
			<div class="con-section yx-expert">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">甄选家</h2>
							</a>
							<small class="yx-fz14 yx-ibt">我们在寻找，对生活有态度的你</small>
						</div>
					</div>
					<div class="section-body">
						<div class="expert-content">
							<a href="javascript:;" target="_blank" class="expert-item large">
								<div><img src="<%=basePath%>/public/images/items/expert/large.jpg" alt="样品试用"></div>
							</a>
							<a href="javascript:;" target="_blank" class="expert-item small">
								<div><img src="<%=basePath%>/public/images/items/expert/small.jpg" alt="建议征集"></div>
							</a>
							<a href="javascript:;" target="_blank" class="expert-item small last">
								<div><img src="<%=basePath%>/public/images/items/expert/small2.jpg" alt="样式甄选"></div>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 大家都在说 -->
			<div class="con-section yx-indexComment">
				<div class="yx-row">
					<div class="section-header">
						<div class="yx-fl-left">
							<a href="javascript:;" target="_blank" class="yx-ibt">
								<h2 class="name">大家都在说</h2>
							</a>
							<small class="yx-fz14 yx-ibt">生活，没有统一标准</small>
						</div>
					</div>
					<div class="section-body slick-wrap">
						<div class="slick-slider">
							<button class="btn btn-prev"><i class="iconfont icon-prev"></i></button>
							<div class="slick-list">
								<div class="slick-track">
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/150a5af5551a431b2a0f27e9dac0ace8.jpg?imageView&quality=95&thumbnail=355x355" alt="每日坚果" title="每日坚果"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">w****1</div>
												<div class="date">2018-08-30 22:14</div>
											</div>
											<div class="com-middle">
												<div class="pname">每日坚果</div>
												<div class="price">￥35</div>
											</div>
											<div class="com-content">
												<p>坚果搭配比例合理，满意，棒棒哒(ง •̀_•́)ง</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/a45fd32d1e554de8006bb78cc2715f38.jpg?imageView&quality=95&thumbnail=355x355" alt="咸蛋黄饼干 160克" title="咸蛋黄饼干 160克"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">y****s</div>
												<div class="date">2018-08-30 21:25</div>
											</div>
											<div class="com-middle">
												<div class="pname">咸蛋黄饼干 160克</div>
												<div class="price">￥19</div>
											</div>
											<div class="com-content">
												<p>非常好吃鸭，酥脆酥脆的</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/b570367b2c6a071d95e3d3c9cdf37e96.jpg?imageView&quality=95&thumbnail=355x355" alt="玩趣彩虹四季拖鞋" title="玩趣彩虹四季拖鞋"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">梵****</div>
												<div class="date">2018-08-30 20:29</div>
											</div>
											<div class="com-middle">
												<div class="pname">玩趣彩虹四季拖鞋</div>
												<div class="price">￥19</div>
											</div>
											<div class="com-content">
												<p>拖鞋颜色质地非常好，包装也很高大上，第一次在严选买东西，太满意了</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/c2341edb8e5d23de8eea395edf3e700f.jpg?imageView&quality=95&thumbnail=355x355" alt="网易智造X3 Plus蓝牙HiFi耳机" title="网易智造X3 Plus蓝牙HiFi耳机"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">w****2</div>
												<div class="date">2018-08-30 20:19</div>
											</div>
											<div class="com-middle">
												<div class="pname">网易智造X3 Plus蓝牙HiFi耳机</div>
												<div class="price">￥198</div>
											</div>
											<div class="com-content">
												<p>耳机挺好看的，声音太好听了</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/67ca636338a88f42e92c3c7aa0b5b5a1.jpg?imageView&quality=95&thumbnail=355x355" alt="男式舒适磨毛休闲裤" title="男式舒适磨毛休闲裤"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">W****</div>
												<div class="date">2018-09-08 15:56</div>
											</div>
											<div class="com-middle">
												<div class="pname">男式舒适磨毛休闲裤</div>
												<div class="price">￥259</div>
											</div>
											<div class="com-content">
												<p>终于收到我需要的宝贝了，东西很好，价美物廉，谢谢掌柜的！说实在，这是我淘宝购物来让我最满意的一次购物。无论是掌柜的态度还是对物品，我都非常满意的。掌柜态度很专业热情，有问必答，回复也很快，我问了不少问题，他都不觉得烦，都会认真回答我，这点我向掌柜表示由衷的敬意，这样的好掌柜可不多。再说宝贝，正是我需要的，收到的时候包装完整，打开后让我惊喜的是，宝贝比我想象中的还要好！不得不得竖起大拇指。下次需要的时候我还会再来的，到时候麻烦掌柜给个优惠哦！</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/72d173e58cebef786b2093766084458a.jpg?imageView&quality=95&thumbnail=355x355" alt="韩国制造 超声波去角质离子导入美容仪" title="韩国制造 超声波去角质离子导入美容仪"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">m****2</div>
												<div class="date">2018-09-07 08:33</div>
											</div>
											<div class="com-middle">
												<div class="pname">韩国制造 超声波去角质离子导入美容仪</div>
												<div class="price">￥269</div>
											</div>
											<div class="com-content">
												<p>太好用啦！接触皮肤时有轻微的电流感，鼻子及下巴处的白头眼看着排出来了、神器神器！</p>
											</div>
										</div>
									</div>
									<div class="slick-item product-item">
										<div class="item-hd">
											<a href="javascript:;">
												<div><img class="img img-noload lozad" data-src="https://yanxuan.nosdn.127.net/a527ff3521f781553502518d2ec95cf8.jpg?imageView&quality=95&thumbnail=355x355" alt="女式撞色V领羊毛衫" title="女式撞色V领羊毛衫"></div>
											</a>
										</div>
										<div class="item-bd comment-bd">
											<div class="com-top">
												<div class="front-name">m****5</div>
												<div class="date">2018-09-06 22:15</div>
											</div>
											<div class="com-middle">
												<div class="pname">女式撞色V领羊毛衫</div>
												<div class="price">￥248</div>
											</div>
											<div class="com-content">
												<p>喜欢</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn btn-next"><i class="iconfont icon-next"></i></button>
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

	<!-- 模态框组件 -->
	<div class="fixed-modal">
		<div class="modal-wrap">
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.0/velocity.min.js"></script>
	<script src="public/script/dialogModal.js"></script>
	<script src="public/script/basicFn.js"></script>
	<script src="public/script/slickSlide.js"></script>
	<script src="public/lib/lozad.min.js"></script>
	<script>
		$(function() {
			slickSlide($('.yx-banner .slick-wrap'));
			slickSlide($('.yx-saleCenter .slick-wrap'));

			slickSlideMove($('.yx-newProduct .slick-wrap'), {
				slickItems: $('.yx-newProduct .new-product')
			});

			slickSlideMove($('.yx-indexComment .slick-wrap'), {}, {
				duration: 4000,
				easing: 'linear'
			});

			//loadModal();
			const observer = lozad();
			observer.observe();
		});
	</script>
</body>
</html>