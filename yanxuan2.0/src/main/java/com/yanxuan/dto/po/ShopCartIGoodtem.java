package com.yanxuan.dto.po;

/**
 * @author weiwu
 * @description 购物车中的商品的包装类（PO 持久化）
 * @date 2018/9/1 22:47
 */
public class ShopCartIGoodtem {
    //商品ID
    private Integer goodId;
    //商品名称
    private String goodName;
    //商品描述
    private String goodDesc;
    //商品价格
    private Integer goodPrice;
    //商品标签
    private String goodTag;
    //商品图片地址
    private String goodPic;
    //商品规格
    private String goodSpec;
    //购物车中，该商品的数量
    private Integer count;

    public ShopCartIGoodtem() {
    }

    public ShopCartIGoodtem( Integer goodId, String goodName, String goodDesc, Integer goodPrice, String goodTag, String goodPic, String goodSpec, Integer count ) {
        this.goodId = goodId;
        this.goodName = goodName;
        this.goodDesc = goodDesc;
        this.goodPrice = goodPrice;
        this.goodTag = goodTag;
        this.goodPic = goodPic;
        this.goodSpec = goodSpec;
        this.count = count;
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

    public String getGoodSpec() {
        return goodSpec;
    }

    public void setGoodSpec( String goodSpec ) {
        this.goodSpec = goodSpec;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount( Integer count ) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ShopCartIGoodtem{" +
                   "goodId=" + goodId +
                   ", goodName='" + goodName + '\'' +
                   ", goodDesc='" + goodDesc + '\'' +
                   ", goodPrice=" + goodPrice +
                   ", goodTag='" + goodTag + '\'' +
                   ", goodPic='" + goodPic + '\'' +
                   ", goodSpec='" + goodSpec + '\'' +
                   ", count=" + count +
                   '}';
    }
}
