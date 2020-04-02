package com.yanxuan.dao;

import java.util.List;

import org.junit.Test;

import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;

public class TestSelectGoodSDao {
	@Test
	public void testIsGoodExis() {
		GoodInfo goodById = new GoodInfo();
		goodById.setGoodId(3396001);
		boolean isExis = SelectGoodsDao.isExisByGoodId(goodById);
		System.out.println(isExis);
	}
	
	@Test
	public void testSelectGoodsById() {
		GoodInfo goodById = new GoodInfo();
		goodById.setGoodId(1110002);
		List<GoodInfo> selectList = SelectGoodsDao.selectGoodsById(goodById);
		selectList.forEach(System.out::println);
	}
	
	@Test
	public void testselectGoodsTypeById() {
		GoodInfo goodById = new GoodInfo();
		goodById.setGoodId(1110002);
		List<GoodTypeInfo> selectList = SelectGoodsDao.selectGoodsTypeById();
		selectList.forEach(System.out::println);
	}
}
