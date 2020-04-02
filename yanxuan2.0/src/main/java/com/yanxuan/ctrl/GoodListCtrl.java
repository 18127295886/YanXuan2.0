package com.yanxuan.ctrl;

import com.yanxuan.dto.vo.GoodListVo;
import com.yanxuan.service.GoodListService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GoodListCtrl extends HttpServlet {
    protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        //获得查询的的列名对应的value值
        String typeName = request.getParameter("typeName");
        //获取要查询的列名
        String type = request.getParameter("type");
        GoodListService goodListService = new GoodListService();
        GoodListVo glvo = goodListService.getGoodListByTypeName(typeName);

        //        HashMap<GoodTypeInfo, List<GoodSimpleItem>> simGoodList = glvo.getSimGoodList();
        //        simGoodList.forEach(( k, v ) -> {
        //            System.out.println(k);
        //            v.forEach(System.out::println);
        //        });

        request.setAttribute("glvo", glvo);
        request.getRequestDispatcher("/pages/item/list.jsp").forward(request, response);
        //        System.out.println("即将跳转！！！");
        //        response.sendRedirect(request.getContextPath() + "/pages/item/list.jsp");
    }
}
