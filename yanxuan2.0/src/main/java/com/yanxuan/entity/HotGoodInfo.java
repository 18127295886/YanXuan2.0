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
@TableName("HotGoodInfo")
public class HotGoodInfo extends Model<HotGoodInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "hotGoodId", type = IdType.AUTO)
    private Integer hotGoodId;
    private Integer goodId;
    private Integer goodType;


    public Integer getHotGoodId() {
        return hotGoodId;
    }

    public void setHotGoodId(Integer hotGoodId) {
        this.hotGoodId = hotGoodId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getGoodType() {
        return goodType;
    }

    public void setGoodType(Integer goodType) {
        this.goodType = goodType;
    }

    @Override
    protected Serializable pkVal() {
        return this.hotGoodId;
    }

    @Override
    public String toString() {
        return "HotGoodInfo{" +
        ", hotGoodId=" + hotGoodId +
        ", goodId=" + goodId +
        ", goodType=" + goodType +
        "}";
    }
}
