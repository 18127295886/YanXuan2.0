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
@TableName("GoodTypeInfo")
public class GoodTypeInfo extends Model<GoodTypeInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "goodTypeId", type = IdType.AUTO)
    private Integer goodTypeId;
    private String typeName;
    private String midTypeName;
    private String smallType;


    public Integer getGoodTypeId() {
        return goodTypeId;
    }

    public void setGoodTypeId(Integer goodTypeId) {
        this.goodTypeId = goodTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getMidTypeName() {
        return midTypeName;
    }

    public void setMidTypeName(String midTypeName) {
        this.midTypeName = midTypeName;
    }

    public String getSmallType() {
        return smallType;
    }

    public void setSmallType(String smallType) {
        this.smallType = smallType;
    }

    @Override
    protected Serializable pkVal() {
        return this.goodTypeId;
    }

    @Override
    public String toString() {
        return "GoodTypeInfo{" +
        ", goodTypeId=" + goodTypeId +
        ", typeName=" + typeName +
        ", midTypeName=" + midTypeName +
        ", smallType=" + smallType +
        "}";
    }
}
