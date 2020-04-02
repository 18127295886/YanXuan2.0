package com.yanxuan.dao;

import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.dto.po.ShoppingCart;
import org.junit.Test;

import java.util.LinkedHashMap;
import java.util.LinkedList;

public class ShoppingCartDaoTest {

    ShoppingCartDao cartDao = new ShoppingCartDao();

    @Test
    public void ifShoppingCartExits() {
        boolean exits = cartDao.ifShoppingCartExits(123456);
        System.out.println("判断用户是否存在购物车:" + exits);
    }

    @Test
    public void initShopCart() {
        cartDao.initShopCart(123456);
    }

    @Test
    public void getShopCart() {
        ShoppingCart shopCart = cartDao.getShopCart(4000073);
        if ( shopCart == null ) {
            System.out.println("购物车为空！！！");
        } else {
            System.out.println("购物车不为空！");
        }
        //        System.out.println(shopCart);
        //        System.out.println(shopCart.getMap());
        LinkedHashMap<String, ShopCartIGoodtem> map = shopCart.getMap();
        map.forEach(( k, v ) -> {
            System.out.println(k + ":" + v);
        });
    }

    @Test
    public void addGoodToShopCart() {
        cartDao.addGoodToShopCart(123456, 1341001, 4, "白色");
        cartDao.addGoodToShopCart(123456, 1539003, 4, "白色");
        cartDao.addGoodToShopCart(123456, 1010003, 4, "白色");
        cartDao.addGoodToShopCart(123456, 1564044, 4, "白色");
        cartDao.addGoodToShopCart(123456, 1657022, 4, "白色");
        cartDao.addGoodToShopCart(123456, 3396000, 4, "白色");
    }

    @Test
    public void delGoodFromShopCart() {
        cartDao.delGoodFromShopCart(123456, 1341001);
    }

    @Test
    public void getShoppingCartAsList() {
        LinkedList<ShopCartIGoodtem> shoppingCartAsList = cartDao.getShoppingCartAsList(123456);
        System.out.println(shoppingCartAsList.size());
        shoppingCartAsList.forEach(System.out::println);
    }
}