package com.yanxuan.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.UserInfo;
import com.yanxuan.impl.UserImpl;

/**
 * Servlet implementation class RegisterCtrl
 */
@WebServlet("/RegisterCtrl")
public class RegisterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		
		HttpSession session = request.getSession();
		int number =(int) session.getAttribute("EmailNumber");
		String userMail=request.getParameter("userMail");
		String userPwd=request.getParameter("userPwd");
		String number1=request.getParameter("number");
		
		int parseInt = Integer.parseInt(number1);
		PrintWriter out = response.getWriter();
		
		
		if(number==parseInt) {
			boolean result=UserImpl.getUserServiceImpl().registerUser(userPwd, userMail);
			System.out.println(result);
			out.print(result);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

