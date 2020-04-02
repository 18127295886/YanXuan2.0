package com.yanxuan.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.yanxuan.entity.OrderInfo;
import com.yanxuan.entity.OrderList;
import com.yanxuan.utils.DButils;

public class MyListDao {
	public static List<OrderList> getMyList(Integer userId) throws SQLException {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select * from MyList where userId = ?";
		List<OrderList> list = queryRunner.query(sql, new BeanListHandler<OrderList>(OrderList.class),userId);
		return list;
	}
	
	public static void getStautsMyList(String orderId) throws SQLException{
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "update OrderInfo set orderStatus = 3 where orderId = ?  ";
		queryRunner.update(sql,orderId);
	}
	
}
