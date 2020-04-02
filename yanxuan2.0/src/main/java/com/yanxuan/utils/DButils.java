package com.yanxuan.utils;

import org.apache.commons.dbutils.QueryRunner;

public class DButils {
	
	//获取数据库查询对象QueryRunner
	public static QueryRunner getQueryRunner() {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		return queryRunner;
	}
}
