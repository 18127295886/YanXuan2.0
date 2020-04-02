package com.yanxuan.dto;

import java.util.Arrays;

/**
 * @author weiwu
 * @description 商品规格类
 * @date 2018/9/6 19:44
 */
public class GoodSpec {
    /*
    {
        "goodSpecName": "颜色",
        "goodSpecValue": [
            "极致白"
        ]
    }
    */

    String goodSpecName;
    String[] goodSpecValue;

    public String getGoodSpecName() {
        return goodSpecName;
    }

    public void setGoodSpecName( String goodSpecName ) {
        this.goodSpecName = goodSpecName;
    }

    public String[] getGoodSpecValue() {
        return goodSpecValue;
    }

    public void setGoodSpecValue( String[] goodSpecValue ) {
        this.goodSpecValue = goodSpecValue;
    }

    @Override
    public String toString() {
        return "GoodSpec{" +
                   "goodSpecName='" + goodSpecName + '\'' +
                   ", goodSpecValue=" + Arrays.toString(goodSpecValue) +
                   '}';
    }
}
