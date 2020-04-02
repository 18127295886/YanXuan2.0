package com.yanxuan.ctrl;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedList;

/**
 * @author weiwu
 * @description ${DESCRIPTION}
 * @date 2018/9/4 17:51
 */
public class ShoppCartCtrl extends javax.servlet.http.HttpServlet {

    ShopCartService cartService = new ShopCartService();

    protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String method = request.getParameter("method");
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("method:" + method);
        System.out.println();
        System.out.println();
        System.out.println();

        Class clazz = this.getClass();
        try {
            Method declaredMethod = getClass().getDeclaredMethod(method, HttpServletRequest.class, HttpServletResponse.class);
            declaredMethod.invoke(this, request, response);

        } catch ( NoSuchMethodException e ) {
            e.printStackTrace();
        } catch ( IllegalAccessException e ) {
            e.printStackTrace();
        } catch ( InvocationTargetException e ) {
            e.printStackTrace();
        }

    }

    //购物车中增加和减少操作对应的请求方法
    public void addAndSub( HttpServletRequest request, HttpServletResponse response ) {
        PrintWriter writer = null;
        JsonObject mgs = new JsonObject();
        try {
            writer = response.getWriter();
            //获得用户的id
            UserInfo user = (UserInfo)request.getSession().getAttribute("user");
            Integer userId = user.getUserId();

            //获得请求传递过来的商品id
            Integer goodId = Integer.valueOf(request.getParameter("goodId"));

            //获得请求传递过来的操作数量（购物车的真实数量，而不是购物车的增量）
            Integer count = Integer.valueOf(request.getParameter("count"));

            //获得请求传递过来的加入购物车的商品数量的规格（注意：一个商品有一种或者多种规格）
            String goodSpec = request.getParameter("goodSpec");

            cartService.ModifyShopCartGoodAndCount(userId, goodId, count, goodSpec);
            mgs.addProperty("code", 200);
            writer.println(mgs);
        } catch ( Exception e ) {
            mgs.addProperty("code", 404);
            writer.println(mgs);
            System.out.println(e.getMessage());
        }
        writer.flush();
    }

    public void delFromCart( HttpServletRequest request, HttpServletResponse response ) {
        //        public void delGoodFromShopCart( Integer userId, Integer... goodIds )

        //获得用户的id
        UserInfo user = (UserInfo)request.getSession().getAttribute("user");
        Integer userId = user.getUserId();

        //获得要删除的购物车中的商品的id（不过是字符串形式的，需要转换为int类型）
        String[] goodIdstrs = request.getParameterValues("goodIds");

        Integer[] goodIds = new Integer[goodIdstrs.length];

        for ( int i = 0; i < goodIdstrs.length; i++ ) {
            goodIds[i] = Integer.valueOf(goodIdstrs[i]);
        }

        cartService.delGoodFromShopCart(userId, goodIds);

    }

    public void getCartList( HttpServletRequest request, HttpServletResponse response ) throws IOException, ServletException {

        System.out.println("执行获得购物车列表的方法！！！");

        //获得用户的id
        UserInfo user = (UserInfo)request.getSession().getAttribute("user");
        if ( user != null ) {
            Integer userId = user.getUserId();
//            System.out.println(userId);

            LinkedList<ShopCartIGoodtem> shoppingCartAsList = cartService.getShoppingCartAsList(userId);

            //            shoppingCartAsList.forEach(System.out::println);

            request.getSession().setAttribute("cartlist", shoppingCartAsList);
        }

        request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
        //        response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");

    }

    public void cartJSON( HttpServletRequest request, HttpServletResponse response ) throws IOException {

        Object attribute = request.getSession().getAttribute("cartlist");
        JsonObject json = new JsonObject();
        JsonObject flag = new JsonObject();
        JsonArray data = new JsonArray();
        if ( attribute != null ) {
            //当前的session中有购物车的属性，状态码为200
            flag.addProperty("code", 200);
            flag.addProperty("msg", "当前存在购物车");
            json.add("flag", flag);

            LinkedList<ShopCartIGoodtem> cartlist = (LinkedList<ShopCartIGoodtem>)attribute;

            Iterator<ShopCartIGoodtem> iterator = cartlist.iterator();
            while ( iterator.hasNext() ) {
                JsonObject jsonTem = new JsonObject();
                ShopCartIGoodtem goodtem = iterator.next();

                jsonTem.addProperty("GoodId", goodtem.getGoodId());
                jsonTem.addProperty("GoodName", goodtem.getGoodName());
                jsonTem.addProperty("GoodPic", goodtem.getGoodPic());
                jsonTem.addProperty("GoodSpec", goodtem.getGoodSpec());
                jsonTem.addProperty("Count", goodtem.getCount());
                jsonTem.addProperty("GoodPrice", goodtem.getGoodPrice());

                data.add(jsonTem);
            }

            json.add("data", data);
        } else {
            //当前的session中有购物车的属性，状态码为200
            flag.addProperty("code", 400);
            flag.addProperty("msg", "当前不存在购物车！！！");
            json.add("flag", flag);
            json.add("data", null);
        }

        PrintWriter writer = response.getWriter();
        writer.println(json.toString());
    }
}
