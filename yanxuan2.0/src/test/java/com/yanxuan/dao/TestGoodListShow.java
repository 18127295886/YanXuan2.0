package com.yanxuan.dao;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.apache.velocity.runtime.directive.Foreach;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.google.gson.Gson;
import com.yanxuan.ctrl.GoodListShowCtrl;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.service.GoodListShowService;
import com.yanxuan.utils.SpringUtils;

public class TestGoodListShow {
	@Test
	public void fn1() {
//		GoodListShowDao goodListDao = new GoodListShowDao();
//		System.out.println(goodListDao.getGoodTypeIDBySmallType("数码"));

		// 使用mybatisplus的步骤：(环境:spring+mybatis)
		// 常规操作

		 //第一步：获得spring容器
		ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
		// 第二部：通过spring容器获得指定的mybatisplus映射对象
		GoodTypeInfoMapper mapper = appContext.getBean(GoodTypeInfoMapper.class);
		// 第三部：调用mybatisplus映射对象的特定方法（可能需要自己构建条件适配器），得到结果
		List<GoodTypeInfo> selectList = mapper.selectList(new EntityWrapper<GoodTypeInfo>().eq("smallType", "生活电器"));
		System.out.println(selectList.get(0));
	}
		
	@Test
	public void testDemo01() {
		ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
		// 第二部：通过spring容器获得指定的mybatisplus映射对象
		GoodInfoMapper mapper = appContext.getBean(GoodInfoMapper.class);
		List<GoodInfo> selectList=mapper.selectList(new EntityWrapper<GoodInfo>().eq("goodTypeId",5).orderBy("goodPrice"));
		for(GoodInfo se:selectList) {
			System.out.println(se);
		}
		Collections.reverse(selectList);
		for(GoodInfo se:selectList) {
			System.out.println(se);
		}
	}
	
	@Test
	public void testTojson() {
		GoodListShowService goodListShowService=new GoodListShowService();
		String q=null;
		q=goodListShowService.getGLByType("生活电器", 1, false);
//		System.out.println(q);
		Gson gson=new Gson();
		LinkedList<GoodSimpleItem> l=goodListShowService.toSimpleItems(q);
		for(GoodSimpleItem se:l) {
			System.out.println(se);
		}
	}
}
