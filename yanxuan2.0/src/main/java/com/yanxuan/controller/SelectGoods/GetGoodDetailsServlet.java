package com.yanxuan.controller.SelectGoods;

import com.yanxuan.service.GetGoodsDetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LogginView
 */
@WebServlet ( "/GetGoodDetailsServlet" )
public class GetGoodDetailsServlet extends HttpServlet {

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");

        String parameter = request.getParameter("goodId");
        String goodIdTem = parameter.replace("\"", "");

        int goodId = Integer.parseInt(goodIdTem);

        //        System.out.println();
        //        System.out.println();
        //        System.out.println();
        //        System.out.println(goodId);
        //        System.out.println();
        //        System.out.println();
        //        System.out.println();

        String jsonStr = GetGoodsDetailService.getGoodsDetail(goodId);
        //        System.out.println(jsonStr);
        PrintWriter writer = response.getWriter();
        writer.print(jsonStr.toString());

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        doGet(request, response);
    }
}