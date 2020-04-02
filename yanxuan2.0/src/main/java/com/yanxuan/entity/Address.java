package com.yanxuan.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author weiwu
 * @since 2018-08-28
 */
public class Address extends Model<Address> {

    private static final long serialVersionUID = 1L;

    @TableId ( value = "addrId", type = IdType.AUTO )
    private Integer addrId;
    private Integer userId;
    private String province;
    private String city;
    private String area;
    private String addrDetail;
    private String receiver;
    private String mobile;

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId( Integer addrId ) {
        this.addrId = addrId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId( Integer userId ) {
        this.userId = userId;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince( String province ) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity( String city ) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea( String area ) {
        this.area = area;
    }

    public String getAddrDetail() {
        return addrDetail;
    }

    public void setAddrDetail( String addrDetail ) {
        this.addrDetail = addrDetail;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver( String receiver ) {
        this.receiver = receiver;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile( String mobile ) {
        this.mobile = mobile;
    }

    @Override
    protected Serializable pkVal() {
        return this.addrId;
    }

    @Override
    public String toString() {
        return "Address{" +
                   ", addrId=" + addrId +
                   ", userId=" + userId +
                   ", province=" + province +
                   ", city=" + city +
                   ", area=" + area +
                   ", addrDetail=" + addrDetail +
                   ", receiver=" + receiver +
                   ", mobile=" + mobile +
                   "}";
    }
}
