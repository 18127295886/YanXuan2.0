package com.yanxuan.dao;

import java.io.UnsupportedEncodingException;

import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;


import com.yanxuan.entity.UserInfo;
import com.yanxuan.utils.DButils;

public class UserDao {

	// 用户注册方法
	public static boolean isRegister( String userPwd, String userMail) {
		QueryRunner queryRunner = DButils.getQueryRunner();
		boolean isRegister = false;
		String sql = "select * from UserInfo where userMail = ?";
		List<Object[]> rSet;
		try {
			rSet = queryRunner.query(sql, new ArrayListHandler(), userMail);
			if(rSet.isEmpty()) {
				String sql1 = "insert into UserInfo(userMail,userPwd) values(?,?)";
				String asB64;
				try {
					asB64 = Base64.getEncoder().encodeToString(userPwd.getBytes("utf-8"));
					queryRunner.update(sql1,userMail, asB64);
					System.out.println("asB64:" + asB64);
					isRegister = true;
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isRegister;
	}

	// 用户登陆方法
	public static boolean isLoading(String userMail, String userPwd) {
		boolean isLoading = false;
		QueryRunner queryRunner = DButils.getQueryRunner();
		// 先验证该用户是否存在
		String sql = "select * from UserInfo where userMail = ?";
		try {
			List<Object[]> rSet = queryRunner.query(sql, new ArrayListHandler(), userMail);
			if (!(rSet.isEmpty())) {
				String sql1 = "select userPwd from UserInfo where userMail = ?";
				UserInfo resultSet = queryRunner.query(sql1, new BeanHandler<UserInfo>(UserInfo.class), userMail);
				String userPwd1 = resultSet.getUserPwd();
				// System.out.println(userPwd1+"userPwd1");
				byte[] asBytes = Base64.getDecoder().decode(userPwd1);

				String pString = new String(asBytes, "utf-8");
				// System.out.println(pString);

				if (pString.equals(userPwd)) {
					// System.out.println("登陆成功");
					isLoading = true;
				} else {
					// System.out.println("密码错误");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isLoading;
	}
	
	public static UserInfo getUser(String userMail) {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql ="select * from UserInfo where userMail = ?";
		UserInfo user = null;
		try {
			user = queryRunner.query(sql,new BeanHandler<UserInfo>(UserInfo.class),userMail );
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;			
	}
}
