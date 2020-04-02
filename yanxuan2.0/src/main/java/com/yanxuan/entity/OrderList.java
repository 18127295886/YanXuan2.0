package com.yanxuan.entity;

import java.util.Date;

public class OrderList {
	private String goodName;
	private String goodPic;
	private String orderId;
	private Date orderDate;
	private Integer orderGoodNum;
	private Integer orderStatus;
	private Integer goodId;
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	@Override
	public String toString() {
		return "OrderList [goodName=" + goodName + ", goodPic=" + goodPic + ", orderId=" + orderId + ", orderDate="
				+ orderDate + ", orderGoodNum=" + orderGoodNum + ", orderStatus=" + orderStatus + ", orderPay="
				+ orderPay + "]";
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getGoodPic() {
		return goodPic;
	}
	public void setGoodPic(String goodPic) {
		this.goodPic = goodPic;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getOrderGoodNum() {
		return orderGoodNum;
	}
	public void setOrderGoodNum(Integer orderGoodNum) {
		this.orderGoodNum = orderGoodNum;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Integer getOrderPay() {
		return orderPay;
	}
	public void setOrderPay(Integer orderPay) {
		this.orderPay = orderPay;
	}
	private Integer orderPay;
}
