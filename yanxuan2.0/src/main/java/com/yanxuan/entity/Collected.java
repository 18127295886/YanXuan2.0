package com.yanxuan.entity;

import java.io.Serializable;

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
@TableName("Collected")
public class Collected extends Model<Collected> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "cId", type = IdType.AUTO)
    private Integer cId;
    private Integer userId;
    private Integer goodId;


    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
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

    @Override
    protected Serializable pkVal() {
        return this.cId;
    }

    @Override
    public String toString() {
        return "Collected{" +
        ", cId=" + cId +
        ", userId=" + userId +
        ", goodId=" + goodId +
        "}";
    }
}
