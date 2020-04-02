package com.yanxuan.controller.collection;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.yanxuan.entity.Collected;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.CollectionService;

/**
 * Servlet implementation class UpdateCollectionCtrl
 */
@WebServlet("/UpdateCollectionCtrl")
public class UpdateCollectionCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCollectionCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("user");
		Integer goodId = Integer.parseInt(request.getParameter("goodId"));
		CollectionService cService = new CollectionService();

		String action = request.getParameter("action");
		if (action.equals("删除")) {
			// 测试1000000
			cService.deleteCollection(user.getUserId(), goodId);
		} else if (action.equals("检查")) {
			
			Collected collected = new Collected();
			collected.setGoodId(goodId);
			collected.setUserId(user.getUserId());
			
			boolean flag = cService.checkCollection(collected);
			
			JsonObject jsonObject = new JsonObject();
			
			if (flag==true) {
				//還沒有添加到收中
				jsonObject.addProperty("code", 200);
				jsonObject.addProperty("msg", "可以被收藏");
			} else {
				//已经被收藏，不能在被收藏
				jsonObject.addProperty("code", 400);
				jsonObject.addProperty("msg", "已经存在，不能重复收藏！！！");

			}
			
			PrintWriter writer = response.getWriter();
			writer.println(jsonObject);
			
		} else {
			Collected collected = new Collected();
			collected.setGoodId(goodId);
			collected.setUserId(user.getUserId());
			boolean ifseccess = cService.addCollection(collected);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
