package com.yanxuan.dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Footprint;
import com.yanxuan.service.FootprintService;

public class TestFootprintDao {
	@Test
	public void fn1() {//测试添加足迹
		Footprint footprint=new Footprint();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		footprint.setFpDate(sdf1.format(date));
		footprint.setGoodId(1043000);
		footprint.setUserId(1000000);
		FootprintDao footprintDao=new FootprintDao();
		footprintDao.addFootprint(footprint);
	}
	
	@Test
	public void fn3() {
		Footprint footprint=new Footprint();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		footprint.setFpDate(sdf1.format(date));
		footprint.setGoodId(1010003);
		footprint.setUserId(1000000);
		FootprintDao footprintDao=new FootprintDao();
		footprintDao.checkFootprint(footprint);
	}
	@Test
	public void fn4() {
		Footprint footprint=new Footprint();
		footprint.setGoodId(1010003);
		footprint.setUserId(1000001);
		FootprintService fs=new FootprintService();
		fs.addFootpring(footprint);
	}
	@Test
	public void testshowFootprint() {
		FootprintService fs=new FootprintService();
		Map<String,List<GoodSimpleItem>> simpleItemMap=fs.showFootprint(1000000);
		for(String date:simpleItemMap.keySet()) {
			System.out.println("--------------------");
			for(GoodSimpleItem gsi:simpleItemMap.get(date)) {
				System.out.println(gsi);
			}
			System.out.println("---------------------");
		}
	}
	@Test
	public void testdetailfootprint() {
		HotGoodDao hotGoodDao=new HotGoodDao();
		List<GoodSimpleItem> list=hotGoodDao.getDetailFootprint(4000073);
		for(GoodSimpleItem goodSimpleItem:list) {
			System.out.println(goodSimpleItem);
		}
	}
	@Test
	public void testHotgood() {
		HotGoodDao hotGoodDao=new HotGoodDao();
		List<GoodSimpleItem> list=hotGoodDao.getHotGood();
		for(GoodSimpleItem goodSimpleItem:list) {
			System.out.println(goodSimpleItem);
		}
	}
	@Test
	public void testRandom() {
		HotGoodDao hotGoodDao=new HotGoodDao();
		List<GoodSimpleItem> list=hotGoodDao.getRandom();
		for(GoodSimpleItem goodSimpleItem:list) {
			System.out.println(goodSimpleItem);
		}
	}
}
