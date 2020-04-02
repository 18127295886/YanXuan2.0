package com.yanxuan.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yanxuan.service.GoodListShowService;

/**
 * Servlet implementation class GoodListShowCtrl
 */
@WebServlet("/GoodListShowCtrl")
public class GoodListShowCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		GoodListShowService glsc=new GoodListShowService();
		//获取点击的商品类型是哪一种
		String smallType=request.getParameter("type");
		//获取商品的排序是哪一种
		String sort=request.getParameter("sort");
		String itemListJson=null;
			
		if(smallType.equals("全部")) {
			if (sort.equals("默认")) {
				response.sendRedirect("/goodListCtrl");
			}
			else if (sort.equals("价格正序")) {
				itemListJson=glsc.getGLAll(1,false);
			}
			else if (sort.equals("价格倒序")) {
				itemListJson=glsc.getGLAll(1,true);
			}else {
				//好评
				itemListJson=glsc.getGLAll(2,false);
			}
		}else {
			if (sort.equals("默认")) {
				itemListJson=glsc.getGLByType(smallType, 0, false);
			}
			else if (sort.equals("价格正序")) {
				itemListJson=glsc.getGLByType(smallType, 1, false);
			}
			else if (sort.equals("价格倒序")) {
				itemListJson=glsc.getGLByType(smallType, 1, true);
			}else {
				//好评
				itemListJson=glsc.getGLByType(smallType, 2, false);
			}
		}
		out.println(itemListJson);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
