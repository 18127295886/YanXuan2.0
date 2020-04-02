package com.yanxuan.service;

import com.yanxuan.dao.ShoppingCartDao;
import com.yanxuan.dto.po.ShopCartIGoodtem;

import java.util.LinkedList;

/**
 * @author weiwu
 * @description 购物车的service层
 * @date 2018/9/4 17:05
 */
public class ShopCartService {

    private ShoppingCartDao cartDao = new ShoppingCartDao();

    /**
     * 用于处理增加购物车、减少购物车商品数量的业务逻辑
     *
     * @param userId   用户的id
     * @param goodId   商品的id
     * @param count    商品的数量（接受的是商品的总量，而不是增量）
     * @param goodSpec 用户加入购物车的商品的规格（一个商品存在一个或多个规格）
     */
    public void ModifyShopCartGoodAndCount( Integer userId, Integer goodId, int count, String
                                                                                           goodSpec ) {
        cartDao.addGoodToShopCart(userId, goodId, count, goodSpec);
    }

    /**
     * 用于处理移除购物车的业务逻辑
     *
     * @param userId  用户的id
     * @param goodIds 移除的商品id（可变参数，接受移除一个或者移除多个的商品id）
     */
    public void delGoodFromShopCart( Integer userId, Integer... goodIds ) {
        cartDao.delGoodFromShopCart(userId, goodIds);
    }

    /**
     * 获得用户当前的购物车的list集合，原本保存的是以map的集合形式存在的，方便前台的遍历
     *
     * @param userId
     * @return
     */
    public LinkedList<ShopCartIGoodtem> getShoppingCartAsList( Integer userId ) {
        LinkedList<ShopCartIGoodtem> shoppingCartList = cartDao.getShoppingCartAsList(userId);
        return shoppingCartList;
    }

}
