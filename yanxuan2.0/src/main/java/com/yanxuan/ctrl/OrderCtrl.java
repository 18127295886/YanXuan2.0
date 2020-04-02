package com.yanxuan.ctrl;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.OrderInfo;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.ConfirmService;

public class OrderCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderCtrl() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int count=Integer.parseInt(request.getParameter("count"));
		 HttpSession session = request.getSession();
		 LinkedList<ShopCartIGoodtem> goodSimpleItems = (LinkedList<ShopCartIGoodtem>) session.getAttribute("orderList");
		 UserInfo user = (UserInfo) session.getAttribute("user");
		 LinkedList<OrderInfo> orderInfos = new LinkedList<OrderInfo>();
		 Iterator<ShopCartIGoodtem> iterator = goodSimpleItems.iterator();
		 
		 //获得当前订单的orderid
		 String orderId = getUUID();
		 while(iterator.hasNext()) {
			 ShopCartIGoodtem goodSimpleItem = iterator.next();
			 OrderInfo info = new OrderInfo();
			 info.setAddrId(user.getUserAddress());
			 info.setGoodId(goodSimpleItem.getGoodId());
			 info.setGoodSpec(goodSimpleItem.getGoodDesc());
			 info.setOrderDate(new Date());
			 if(goodSimpleItems.size()==1) {
				 info.setOrderGoodNum(1);
			 }else {
				 info.setOrderGoodNum(goodSimpleItem.getCount());
			 }
			 info.setOrderId(orderId);
			 info.setOrderPay(goodSimpleItem.getGoodPrice());
			 info.setOrderStatus(1);
			 info.setUserId(user.getUserId());
			 orderInfos.add(info);
		 }
		 ConfirmService confirmService = new ConfirmService();
		 confirmService.dealMessage(orderInfos);
		 request.setAttribute("count", count);
		 request.setAttribute("orderId",orderId);
		 session.removeAttribute("orderList");
		 request.getRequestDispatcher("pages/order/topy.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
		
	private String getUUID() {
		UUID randomUUID = UUID.randomUUID();
		String orderId = randomUUID.toString().replaceAll("-", "");
		return orderId;
		
	}
}
