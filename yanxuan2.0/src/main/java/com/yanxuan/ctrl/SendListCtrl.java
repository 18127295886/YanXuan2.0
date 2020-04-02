package com.yanxuan.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.service.SearchService;

/**
 * Servlet implementation class SendListCtrl
 */
@WebServlet("/SendListCtrl")
public class SendListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendListCtrl() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		HttpSession session = request.getSession();
		LinkedList<GoodSimpleItem> list = (LinkedList<GoodSimpleItem>) session.getAttribute("list");
		int number = Integer.parseInt(request.getParameter("sendlist"));
		PrintWriter out = response.getWriter();
		JsonArray json = new JsonArray();
		if (number == 0) {
			//默认排序的时候执行以下内容
			Collections.sort(list, new Comparator<GoodSimpleItem>() {
				@Override
				public int compare(GoodSimpleItem o1, GoodSimpleItem o2) {
					// TODO Auto-generated method stub
					return o1.getGoodId() - o2.getGoodId();
				}
			});
			GoodSimpleItem[] simpleItems = new GoodSimpleItem[list.size()];
			list.toArray(simpleItems);
			for (int i = 0; i < simpleItems.length; i++) {
				JsonObject jo = new JsonObject();
				jo.addProperty("goodId",simpleItems[i].getGoodId());
				jo.addProperty("goodName",simpleItems[i].getGoodName());
				jo.addProperty("goodDesc",simpleItems[i].getGoodDesc());
				jo.addProperty("goodPrice",simpleItems[i].getGoodPrice());
				jo.addProperty("goodTag",simpleItems[i].getGoodTag());
				jo.addProperty("goodPic",simpleItems[i].getGoodPic());
				json.add(jo);
				}
			out.print(json.toString());
		}else if(number==1)

	{
		// 按照价格升序排序的时候执行
		Collections.sort(list, new Comparator<GoodSimpleItem>() {
			@Override
			public int compare(GoodSimpleItem o1, GoodSimpleItem o2) {
				// TODO Auto-generated method stub
				return o1.getGoodPrice() - o2.getGoodPrice();
			}
		});
		GoodSimpleItem[] simpleItems = new GoodSimpleItem[list.size()];
		list.toArray(simpleItems);
		for (int i = 0; i < simpleItems.length; i++) {
			JsonObject jo = new JsonObject();
			jo.addProperty("goodId", simpleItems[i].getGoodId());
			jo.addProperty("goodName", simpleItems[i].getGoodName());
			jo.addProperty("goodDesc", simpleItems[i].getGoodDesc());
			jo.addProperty("goodPrice", simpleItems[i].getGoodPrice());
			jo.addProperty("goodTag", simpleItems[i].getGoodTag());
			jo.addProperty("goodPic", simpleItems[i].getGoodPic());
			json.add(jo);
		}
		out.print(json.toString());

	}else if(number==2)
	{
		Collections.sort(list, new Comparator<GoodSimpleItem>() {
			@Override
			public int compare(GoodSimpleItem o1, GoodSimpleItem o2) {
				// TODO Auto-generated method stub
				return o2.getGoodPrice() - o1.getGoodPrice();
			}
		});
		GoodSimpleItem[] simpleItems = new GoodSimpleItem[list.size()];
		list.toArray(simpleItems);
		for (int i = 0; i < simpleItems.length; i++) {
			JsonObject jo = new JsonObject();
			jo.addProperty("goodId", simpleItems[i].getGoodId());
			jo.addProperty("goodName", simpleItems[i].getGoodName());
			jo.addProperty("goodDesc", simpleItems[i].getGoodDesc());
			jo.addProperty("goodPrice", simpleItems[i].getGoodPrice());
			jo.addProperty("goodTag", simpleItems[i].getGoodTag());
			jo.addProperty("goodPic", simpleItems[i].getGoodPic());
			json.add(jo);
		}
		out.print(json.toString());
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
