package com.yanxuan.ctrl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yanxuan.dao.MyListDao;

import net.sf.jsqlparser.statement.create.table.Index;

/**
 * Servlet implementation class AlpayCtrl
 */

public class AlpayCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlpayCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int count =Integer.parseInt(request.getParameter("count"));
		String orderId = request.getParameter("orderId");
		System.out.println(count);
		System.out.println(orderId);
		request.setAttribute("count", count);
		request.setAttribute("orderId", orderId);
		request.getRequestDispatcher("pages/pay/alpay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
