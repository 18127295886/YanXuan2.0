/**
 * @author: llk
 * @date: 2018/9/3
 * @function: 搜索也
 */

(function(global, factory) {
	global.search = factory();
})(window, function() {
	function createItem(data, url) {
		let itemHtml = "";
		if(data) {
			let isTag = '';
			if(data.goodTag) {
				isTag = `<span class="tag tag-other">${data.goodTag}</span>`;
			}

			itemHtml =
			`<div class="product-item good-item">
				<div class="item-hd">
					<a href="${url}?goodId=${data.goodId}" target="_blank" title="${data.goodName}">
						<div style="width: 100%; height: 100%"><img class="img img-noload img-small" src="${data.goodPic}" alt="${data.goodName}"></div>
					</a>
				</div>
				<div class="item-bd">
					<div class="item-tags">`
						+ isTag +
					`</div>
					<div class="item-name">
						<a href="${url}?goodId=${data.goodId}" target="_blank" title="${data.goodName}">${data.goodName}</a>
					</div>
					<div class="item-price">
						<span class="price">¥${data.goodPrice}</span>
					</div>
					<div class="item-desc">${data.goodDesc}</div>
				</div>
			</div>`;
		}

		return itemHtml;
	}
	
	function nullItem() {
		return `<div class="search-null">欢迎来到虚空！</div>`
	}

	return {
		createItem,
		nullItem
	};
});