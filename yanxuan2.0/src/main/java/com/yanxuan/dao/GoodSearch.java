package com.yanxuan.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.yanxuan.entity.GoodInfo;
import com.yanxuan.utils.DButils;

public class GoodSearch {
	public  static List<GoodInfo> search(String goodName) throws SQLException {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select goodId,goodName from GoodInfo where goodName like ?";
		List<GoodInfo> result = queryRunner.query(sql, new BeanListHandler<GoodInfo>(GoodInfo.class),"%"+goodName+"%");	
		return result;	
	}
	
	public  static List<GoodInfo> nameSearch(String goodName) throws SQLException {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select * from GoodInfo where goodName like ?";
		List<GoodInfo> result = queryRunner.query(sql, new BeanListHandler<GoodInfo>(GoodInfo.class),"%"+goodName+"%");	
		return result;	
	}
}
