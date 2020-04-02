package com.yanxuan.utils;

import java.sql.Connection;

import org.junit.Test;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class TestC3P0Utils {

	@Test
	public void testGetConnection() {
		ComboPooledDataSource dataSource = C3P0Utils.getDataSource();
		System.out.println(dataSource.toString());
		Connection connection = C3P0Utils.getConnection();
		System.out.println(connection.toString());
		C3P0Utils.close(connection, null, null);
	}

}
