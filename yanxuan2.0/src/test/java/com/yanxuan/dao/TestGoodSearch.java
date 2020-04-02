package com.yanxuan.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.yanxuan.entity.GoodInfo;

public class TestGoodSearch {
	@Test
	public void test() throws SQLException {
		List<GoodInfo> arrayList = GoodSearch.search("网易");
		for (GoodInfo goodInfo : arrayList) {
			System.out.println(goodInfo);
		}
	}
}
