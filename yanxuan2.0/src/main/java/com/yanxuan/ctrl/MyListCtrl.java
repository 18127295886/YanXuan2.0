package com.yanxuan.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yanxuan.dao.MyListDao;
import com.yanxuan.dao.OrderDao;
import com.yanxuan.entity.OrderInfo;
import com.yanxuan.entity.OrderList;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.MyListService;

/**
 * Servlet implementation class MyListCtrl
 */
public class MyListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			UserInfo info1 =(UserInfo)session.getAttribute("user");
			PrintWriter out = response.getWriter();
			LinkedList<OrderList> myList = new MyListService().getOrderList(info1.getUserId());
			Iterator<OrderList> iterator = myList.iterator();
			JsonArray json = new JsonArray();
			while(iterator.hasNext()) {
				OrderList info = iterator.next();
				JsonObject jo = new JsonObject();
				jo.addProperty("orderId", info.getOrderId());
				jo.addProperty("goodPic", info.getGoodPic());	
				jo.addProperty("orderGoodNum", info.getOrderGoodNum());
				jo.addProperty("orderPay", info.getOrderPay()*info.getOrderGoodNum());
				jo.addProperty("orderStatus", info.getOrderStatus());
				jo.addProperty("orderDate", info.getOrderDate().toLocaleString());
				jo.addProperty("goodName", info.getGoodName());
				jo.addProperty("goodId", info.getGoodId());
				json.add(jo);
			}
			out.print(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
