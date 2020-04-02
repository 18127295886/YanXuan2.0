package com.yanxuan.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
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

@TableName ( "GoodInfo" )
public class GoodInfo extends Model<GoodInfo> {

    private static final long serialVersionUID = 1L;

    @TableId ( value = "goodId", type = IdType.AUTO )
    private Integer goodId;
    private String goodName;
    private Integer goodTypeId;
    private String goodDesc;
    private Integer goodPrice;
    private String goodSpec;
    private String goodRate;
    private Integer goodStock;
    private Integer goodSales;
    private String goodTag;
    private String goodPic;
    private String goodDetail;
    private String goodDetailPic;

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId( Integer goodId ) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName( String goodName ) {
        this.goodName = goodName;
    }

    public Integer getGoodTypeId() {
        return goodTypeId;
    }

    public void setGoodTypeId( Integer goodTypeId ) {
        this.goodTypeId = goodTypeId;
    }

    public String getGoodDesc() {
        return goodDesc;
    }

    public void setGoodDesc( String goodDesc ) {
        this.goodDesc = goodDesc;
    }

    public Integer getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice( Integer goodPrice ) {
        this.goodPrice = goodPrice;
    }

    public String getGoodSpec() {
        return goodSpec;
    }

    public void setGoodSpec( String goodSpec ) {
        this.goodSpec = goodSpec;
    }

    public String getGoodRate() {
        return goodRate;
    }

    public void setGoodRate( String goodRate ) {
        this.goodRate = goodRate;
    }

    public Integer getGoodStock() {
        return goodStock;
    }

    public void setGoodStock( Integer goodStock ) {
        this.goodStock = goodStock;
    }

    public Integer getGoodSales() {
        return goodSales;
    }

    public void setGoodSales( Integer goodSales ) {
        this.goodSales = goodSales;
    }

    public String getGoodTag() {
        return goodTag;
    }

    public void setGoodTag( String goodTag ) {
        this.goodTag = goodTag;
    }

    public String getGoodPic() {
        return goodPic;
    }

    public void setGoodPic( String goodPic ) {
        this.goodPic = goodPic;
    }

    public String getGoodDetail() {
        return goodDetail;
    }

    public void setGoodDetail( String goodDetail ) {
        this.goodDetail = goodDetail;
    }

    public String getGoodDetailPic() {
        return goodDetailPic;
    }

    public void setGoodDetailPic( String goodDetailPic ) {
        this.goodDetailPic = goodDetailPic;
    }

    @Override
    protected Serializable pkVal() {
        return this.goodId;
    }

    @Override
    public String toString() {
        return "GoodInfo{" +
                   ", goodId=" + goodId +
                   ", goodName=" + goodName +
                   ", goodTypeId=" + goodTypeId +
                   ", goodDesc=" + goodDesc +
                   ", goodPrice=" + goodPrice +
                   ", goodSpec=" + goodSpec +
                   ", goodRate=" + goodRate +
                   ", goodStock=" + goodStock +
                   ", goodSales=" + goodSales +
                   ", goodTag=" + goodTag +
                   ", goodPic=" + goodPic +
                   ", goodDetail=" + goodDetail +
                   ", goodDetailPic=" + goodDetailPic +
                   "}";
    }
}
