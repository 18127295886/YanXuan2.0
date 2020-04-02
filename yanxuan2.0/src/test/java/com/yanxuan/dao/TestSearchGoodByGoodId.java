package com.yanxuan.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.utils.SpringUtils;

public class TestSearchGoodByGoodId {
	@Test
	public void test() {
//		GoodInfoMapper goodInfoMapper = appContext.getBean(GoodInfoMapper.class);
		
		GoodInfo goodInfo = new GoodInfo();
		goodInfo.setGoodId(1110002);
		
		
		GoodInfo goodInfo2 = goodInfo.selectById();
		
		System.out.println(goodInfo2.toString());
		
		
		
	}
	
	@Test
	public void testDeno01() throws Exception {
		ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
		GoodInfoMapper goodInfoMapper = appContext.getBean(GoodInfoMapper.class);
		
		List<GoodInfo> selectList = goodInfoMapper.selectList(
				new EntityWrapper<GoodInfo>()
				.like("goodName", "易")
				);
		
		//selectList.forEach(System.out::println);
		
		for(GoodInfo goods:selectList) {
			
			
			
			goods.getGoodId();
		}
	}
	
}
