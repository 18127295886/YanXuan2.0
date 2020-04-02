package com.yanxuan.dao;

import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;

import com.yanxuan.entity.UserInfo;
import com.yanxuan.utils.DButils;

public class ModifyUserInfoDao {

	
	public  static boolean modifyUserInfo(UserInfo user) {
		int userId = user.getUserId();
		String userName = user.getUserName();
		int userSex =  user.getUserSex();
		String userMobile =  user.getUserMobile();
		Date userBirthday = user.getUserBirthday();
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "update UserInfo set userName=?,userSex=?,userMobile=?,userBirthday=? where userId=?";
		try {
			int rSet = queryRunner.update(sql,userName,userSex,userMobile,userBirthday,userId);
			System.out.println("rSet:"+rSet);
			if (rSet!=0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
		
	}
}
