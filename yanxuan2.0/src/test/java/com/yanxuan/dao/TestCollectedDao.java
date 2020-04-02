package com.yanxuan.dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Collected;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.service.CollectionService;

public class TestCollectedDao {
	@Test
	public void fn1() {
		CollectionDao collectionDao=new CollectionDao();
		List<Integer> integers=new ArrayList<Integer>();
		integers.add(1010003);
		integers.add(1043000);
		System.out.println(666);
		List<GoodInfo> list=collectionDao.getGoodInfo(integers);
		for(GoodInfo sInfo:list) {
			System.out.println(sInfo.getGoodName());
		}
		System.out.println(666);
	}
	@Test
	public void fn2() {
		CollectionDao collectionDao=new CollectionDao();
		List<Integer> list=collectionDao.getGoodId(4000073);
		for(Integer sInfo:list) {
			System.out.println(sInfo);
		}
	}
	@Test
	public void fn3() {
		CollectionService collectionService=new CollectionService();
		List<GoodSimpleItem> iSimpleItems=collectionService.showCollection(1);
		if (iSimpleItems==null) {
			System.out.println(666);
		}
//		for(GoodSimpleItem gs:iSimpleItems) {
//			System.out.println(gs);
//		}
	}
	@Test
	public void fun4() {
		CollectionDao collectionDao=new CollectionDao();
		List<Integer> list=collectionDao.getGoodId(1000000);
		for(Integer integer:list) {
			System.out.println(list);
			
		}
	}
	@Test
	public void tesdelete() {//测试删除
		CollectionDao collectionDao=new CollectionDao();
		collectionDao.deleteConnection(4000073, 1010003);
	}
	
	@Test
	public void testadd() {//测试添加 ，没问题
		Collected collected=new Collected();
		collected.setGoodId(1010003);
		collected.setUserId(1000000);
		CollectionDao collectionDao=new CollectionDao();
		collectionDao.addCollection(collected);
	}
	@Test
	public void testcheck() {
		Collected collected=new Collected();
		collected.setGoodId(1010003);
		collected.setUserId(1000000);
		CollectionDao collectionDao=new CollectionDao();
		System.out.println(collectionDao.checkCollection(collected));
	}
}
