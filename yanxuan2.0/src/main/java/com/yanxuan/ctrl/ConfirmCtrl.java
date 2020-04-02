package com.yanxuan.ctrl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.dao.OrderDao;
import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Address;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.OrderInfo;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.ConfirmService;
import com.yanxuan.service.ShopCartService;

/**
 * Servlet implementation class ConfirmCtrl
 */
@WebServlet("/ConfirmCtrl")
public class ConfirmCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfirmCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("single".equals(action)) {
			try {
				this.handleSingle(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if ("even".equals(action)) {
			this.handleEven(request, response);
		}
		request.getRequestDispatcher("/pages/order/confirm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void handleSingle(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		String[] goodId = request.getParameterValues("goodId");
		LinkedList<GoodInfo>  list= OrderDao.findInfo(goodId);
		LinkedList<ShopCartIGoodtem> goodSimpleItems = new ConfirmService().GoodInfoToGoodSimpleItem(list);
		session.setAttribute("orderList", goodSimpleItems);
	}

	private void handleEven(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserInfo user = (UserInfo)session.getAttribute("user");
		String[] goodId = request.getParameterValues("goodId");
		LinkedList<ShopCartIGoodtem> shoppingCartList = new ShopCartService().getShoppingCartAsList(user.getUserId());
		LinkedList<ShopCartIGoodtem> cartIGoodtems = new LinkedList<ShopCartIGoodtem>();
		Iterator<ShopCartIGoodtem> iterator = shoppingCartList.iterator();
		while(iterator.hasNext()) {
			ShopCartIGoodtem shopCartIGoodtem = iterator.next();
			for(int i=0;i<goodId.length;i++) {
				if(String.valueOf(shopCartIGoodtem.getGoodId()).equals(goodId[i])) {
					cartIGoodtems.add(shopCartIGoodtem);
				}
			}
		}
		session.setAttribute("orderList", cartIGoodtems);
	}

}
