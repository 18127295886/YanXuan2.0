package com.yanxuan.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.log4j.Logger;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {
	// 创建日志记录对象
	static Logger logger = Logger.getLogger(C3P0Utils.class);

	public static ComboPooledDataSource getDataSource() {
		return dataSource;
	}

	// c3p0数据源
	static private ComboPooledDataSource dataSource = new ComboPooledDataSource();

	// 从数据源中获得一个连接
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			logger.error("Exception in C3p0Utils!", e);
			throw new RuntimeException("数据库连接出错!", e);
		}
	}

	// 回收相关的资源
	public static void close(Connection conn, PreparedStatement pst, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			logger.error("关闭资源的时候出现异常！！！" + e);
			throw new RuntimeException("关闭数据库连接资源的时候出现异常！！！", e);
		}
	}


}
