package com.yanxuan.ctrl;

import com.yanxuan.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author weiwu
 * @description ${DESCRIPTION}
 * @date 2018/9/6 15:15
 */
public class CommentCtrl extends HttpServlet {
    protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("goodId");
        String substring = id.substring(1, id.length() - 1);

        Integer goodId = Integer.valueOf(substring);
        String tag = request.getParameter("tag");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer orderBy = Integer.valueOf(request.getParameter("orderBy"));

        CommentService commentService = new CommentService();
        String json = commentService.getCommentAsJSON(goodId, tag, page, orderBy);

        PrintWriter writer = response.getWriter();
        writer.print(json);

    }
}
