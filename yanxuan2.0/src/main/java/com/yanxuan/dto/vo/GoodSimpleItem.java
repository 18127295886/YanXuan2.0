package com.yanxuan.dto.vo;

/**
 * @author weiwu
 * @description 保存商品的基本信息
 * @date 2018/8/30 14:22
 */
public class GoodSimpleItem {
    private Integer goodId;
    private String goodName;
    private String goodDesc;
    private Integer goodPrice;
    private String goodTag;
    private String goodPic;

    @Override
    public String toString() {
        return "GoodSimpleItem{" +
                   "goodId=" + goodId +
                   ", goodName='" + goodName + '\'' +
                   ", goodDesc='" + goodDesc + '\'' +
                   ", goodPrice=" + goodPrice +
                   ", goodTag='" + goodTag + '\'' +
                   ", goodPic='" + goodPic + '\'' +
                   '}';
    }

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
}
