package com.yanxuan.dto.po;

import java.util.LinkedHashMap;

/**
 * @author weiwu
 * @description 购物车类，用于保存所有购物车的商品记录
 * @date 2018/9/1 22:55
 */
public class ShoppingCart {
    /*
     * 单例模式——恶汉模式，初始化就自动分配堆内存空间
     * key：商品的id
     * value:封装的购物车商品类ShopCartIGoodtem
     * */
    private LinkedHashMap<String, ShopCartIGoodtem> map = new LinkedHashMap<>();

    public LinkedHashMap<String, ShopCartIGoodtem> getMap() {
        return map;
    }

    public void setMap( LinkedHashMap<String, ShopCartIGoodtem> map ) {
        this.map = map;
    }
}
