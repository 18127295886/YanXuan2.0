package com.yanxuan.impl;

import com.yanxuan.dao.UserDao;

public class UserImpl {
	
	private static UserImpl UserImpl;
	
	public static UserImpl getUserServiceImpl() {
		if(UserImpl == null) {
			UserImpl = new UserImpl();
		}
		return UserImpl;
		
	}
	public boolean registerUser(String userPwd, String userMail) {
		boolean result =UserDao.isRegister(userPwd, userMail);
		return result;
	}	
	
	public boolean loginUser(String userMail, String userPwd) {
		boolean result = UserDao.isLoading(userMail, userPwd);
		return result;
	}
}
