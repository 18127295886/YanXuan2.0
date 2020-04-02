package com.yanxuan.controller.collection;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.CollectionService;

/**
 * Servlet implementation class ShowCollectionCtrl
 */
@WebServlet("/ShowCollectionCtrl")
public class ShowCollectionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		
		HttpSession session = request.getSession();
		UserInfo user=(UserInfo)session.getAttribute("user");
		CollectionService cService=new CollectionService();
		List<GoodSimpleItem> simpleItems=cService.showCollection(user.getUserId());
		//List<GoodSimpleItem> simpleItems=cService.showCollection(1000000);
		request.setAttribute("simpleItems", simpleItems);
		
		request.getRequestDispatcher("/pages/user/collection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
