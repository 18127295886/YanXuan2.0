package com.yanxuan.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.yanxuan.dao.GoodSearch;
import com.yanxuan.entity.GoodInfo;

/**
 * Servlet implementation class SearchCtrl
 */
@WebServlet("/SearchCtrl")
public class SearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCtrl() {
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
		
		 String message=request.getParameter("search");
		 JsonArray array = new JsonArray();
		 try {
			List<GoodInfo> arrayList = GoodSearch.search(message);
			JsonObject jsonObject =null;
			GoodInfo goodInfo =null;
			for (int i=0;i<arrayList.size();i++) {
				goodInfo = arrayList.get(i);
				jsonObject = new JsonObject();
				jsonObject.addProperty("id", goodInfo.getGoodId());
				jsonObject.addProperty("keyword", goodInfo.getGoodName());
				array.add(jsonObject);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(array);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
