package com.yanxuan.controller.ModifyUserInfo;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.dao.ModifyUserInfoDao;
import com.yanxuan.entity.UserInfo;

import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class LogginView
 */
@WebServlet("/ModifyUserInfoServlet")
public class ModifyUserInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("user");
		
		int userId = Integer.valueOf(request.getParameter("userId")) ;
		String userName = (String) request.getParameter("nickname");
		Integer userSex =  Integer.valueOf(request.getParameter("sex"));
		String userMobile =  (String) request.getParameter("userMobile");
		String userBirthday1 = request.getParameter("birthday");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date userBirthday = null;
		try {
			userBirthday = format.parse(userBirthday1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		UserInfo info = new UserInfo();
		info.setUserName(userName);
		info.setUserSex(userSex);
		info.setUserMobile(userMobile);
		info.setUserBirthday(userBirthday);
		info.setUserId(userId);
		
		user.setUserName(userName);
		user.setUserSex(userSex);
		user.setUserMobile(userMobile);
		user.setUserBirthday(userBirthday);
		user.setUserId(userId);
		
		session.setAttribute("user", user);
		
		boolean isModifyUserInfo = ModifyUserInfoDao.modifyUserInfo(info);
		System.out.println(isModifyUserInfo);
//		if (isModifyUserInfo) {
//			request.getRequestDispatcher("/index.jsp").forward(request, response);
//		}else {
//			System.out.println("更新失败");
//		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}