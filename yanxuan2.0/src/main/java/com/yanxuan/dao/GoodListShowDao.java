package com.yanxuan.dao;

import java.util.Collections;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.utils.SpringUtils;

public class GoodListShowDao {
	ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
	GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
	GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);

	public List<GoodTypeInfo> getGoodTypeList(String columnValue) {
		List<GoodTypeInfo> typeInfos = goodTypeInfoMapper
				.selectList(new EntityWrapper<GoodTypeInfo>().like("typeName", columnValue));

		return typeInfos;
	}

	// 查询所有商品并以"价格排序"
	public List<GoodInfo> getGLPrice(boolean flag) {
		List<GoodInfo> goodIdList = goodInfoMapper.selectList(new EntityWrapper<GoodInfo>().orderBy("goodPrice"));
		if (flag) {
			Collections.reverse(goodIdList);
		}
		return goodIdList;
	}

	// 查询所有商品并以"好评排序"
	public List<GoodInfo> getGLRate(boolean flag) {
		List<GoodInfo> goodIdList = goodInfoMapper.selectList(new EntityWrapper<GoodInfo>().orderBy("goodRate"));
		if (flag) {
			Collections.reverse(goodIdList);
		}
		return goodIdList;
	}

	// 通过goodtypeID查询对应种类的商品List“默认”
	public List<GoodInfo> getGLByType(int goodTypeID) {
		List<GoodInfo> goodTypeIdList = goodInfoMapper
				.selectList(new EntityWrapper<GoodInfo>().eq("goodTypeId", goodTypeID));
		return goodTypeIdList;
	}

	// 通过goodtypeID查询对应种类的商品List并以“价格排序” true为倒叙
	public List<GoodInfo> getGLByTypePrice(int goodTypeID, boolean flag) {
		List<GoodInfo> goodIdList = goodInfoMapper
				.selectList(new EntityWrapper<GoodInfo>().eq("goodTypeId", goodTypeID).orderBy("goodPrice"));
		if (flag) {
			Collections.reverse(goodIdList);
		}
//		for(GoodInfo se:goodIdList) {
//			System.out.println(se);
//		}
		return goodIdList;
	}

	// 通过goodtypeId查询对应种类的商品List并以“好评排序” true为倒叙
	public List<GoodInfo> getGLByTypeRate(int goodTypeID, boolean flag) {
		List<GoodInfo> goodIdList = goodInfoMapper
				.selectList(new EntityWrapper<GoodInfo>().eq("goodTypeId", goodTypeID).orderBy("goodRate"));
		if (flag) {
			Collections.reverse(goodIdList);
		}
		return goodIdList;
	}

	// 通过smallType获取对应的goodtypeId
	public int getGoodTypeIDBySmallType(String smallType) {
		List<GoodTypeInfo> gTypeInfo = null;
		gTypeInfo = goodTypeInfoMapper.selectList(new EntityWrapper<GoodTypeInfo>().eq("smallType", smallType));
		return gTypeInfo.get(0).getGoodTypeId();
	}
}
