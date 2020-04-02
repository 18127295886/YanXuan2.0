package com.yanxuan.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 
 * </p>
 *
 * @author weiwu
 * @since 2018-08-28
 */
public class OrderInfo extends Model<OrderInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "orderId", type = IdType.AUTO)
    private String orderId;
    private Integer userId;
    private Integer goodId;
    private Integer addrId;
    private Date orderDate;
    private Integer orderGoodNum;
    private Integer orderStatus;
    private Integer orderPay;
    private String goodSpec;


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
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

    public String getGoodSpec() {
        return goodSpec;
    }

    public void setGoodSpec(String goodSpec) {
        this.goodSpec = goodSpec;
    }

    @Override
    protected Serializable pkVal() {
        return this.orderId;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
        ", orderId=" + orderId +
        ", userId=" + userId +
        ", goodId=" + goodId +
        ", addrId=" + addrId +
        ", orderDate=" + orderDate +
        ", orderGoodNum=" + orderGoodNum +
        ", orderStatus=" + orderStatus +
        ", orderPay=" + orderPay +
        ", goodSpec=" + goodSpec +
        "}";
    }
}
