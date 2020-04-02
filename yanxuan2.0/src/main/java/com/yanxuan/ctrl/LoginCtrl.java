package com.yanxuan.ctrl;

import com.yanxuan.dao.UserDao;
import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.impl.UserImpl;
import com.yanxuan.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet ( "/LoginCtrl" )
public class LoginCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf8");

        String userMail = request.getParameter("userMail");
        String userPwd = request.getParameter("userPwd");
        //		System.out.println(userMail);
        //		System.out.println(userPwd);

        HttpSession session = request.getSession();
        UserInfo user = UserDao.getUser(userMail);

        boolean result = UserImpl.getUserServiceImpl().loginUser(userMail, userPwd);
        if ( result ) {
            Cookie userMailCookie = new Cookie("user_mail", userMail);
            Cookie userPwdCookie = new Cookie("user_pwd", userPwd);

            userMailCookie.setMaxAge(7 * 24 * 3600);
            userPwdCookie.setMaxAge(7 * 24 * 3600);

            response.addCookie(userPwdCookie);
            response.addCookie(userMailCookie);

            PrintWriter out = response.getWriter();
            session.setAttribute("user", user);

            ShopCartService cartService = new ShopCartService();
            if ( user != null ) {
                Integer userId = user.getUserId();

                LinkedList<ShopCartIGoodtem> shoppingCartAsList = cartService.getShoppingCartAsList(userId);
                request.getSession().setAttribute("cartlist", shoppingCartAsList);
            }

            out.print(true);

        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
