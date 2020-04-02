package com.yanxuan.dao;

import java.util.UUID;

import org.junit.Test;

import com.yanxuan.entity.Address;

public class TestOrderDao {
	@Test
	public void test() {
		Address address = OrderDao.getAddress(59);
		System.out.println(address);
	}
	
	@Test
	public void update() {
		OrderDao.updateGoodStock(1498021, 5);
	}
	
	
	@Test
	public void testUUID() {
		UUID randomUUID = UUID.randomUUID();
		System.out.println(randomUUID);
		String string = randomUUID.toString();
		System.out.println(string.length());
		
		String replaceAll = string.replaceAll("-", "");
		System.out.println(replaceAll.length());
		System.out.println(replaceAll);
	}
}
