package com.yanxuan.controller.footprint;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.FootprintService;

/**
 * Servlet implementation class FootprintServlet
 */
@WebServlet("/footprint")
public class FootprintServlet extends HttpServlet {
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
		FootprintService fService=new FootprintService();
		//
		Map<String,List<GoodSimpleItem>> simpleItemMap=fService.showFootprint(user.getUserId());
		request.setAttribute("simpleItemMap", simpleItemMap);
		request.getRequestDispatcher("/pages/user/foot.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
