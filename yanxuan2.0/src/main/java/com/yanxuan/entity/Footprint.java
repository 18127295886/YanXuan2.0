package com.yanxuan.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 
 * </p>
 *
 * @author weiwu
 * @since 2018-08-28
 */
@TableName("Footprint")
public class Footprint extends Model<Footprint> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "fpId", type = IdType.AUTO)
    private Integer fpId;
    private Integer userId;
    private Integer goodId;
    private String fpDate;


    public Integer getFpId() {
        return fpId;
    }

    public void setFpId(Integer fpId) {
        this.fpId = fpId;
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

    public String getFpDate() {
        return fpDate;
    }

    public void setFpDate(String fpDate) {
        this.fpDate = fpDate;
    }

    @Override
    protected Serializable pkVal() {
        return this.fpId;
    }

    @Override
    public String toString() {
        return "Footprint{" +
        ", fpId=" + fpId +
        ", userId=" + userId +
        ", goodId=" + goodId +
        ", fpDate=" + fpDate +
        "}";
    }
}
