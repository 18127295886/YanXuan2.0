package com.yanxuan.service;

import java.util.ArrayList;
import java.util.List;

import com.yanxuan.dao.SelectGoodsDao;
import com.yanxuan.entity.GoodInfo;

public class SelectGoodService {
	
	public static List<GoodInfo> selectGoods(GoodInfo goodById) {
		GoodInfo goodInfo = goodById;
		System.out.println(goodInfo.getGoodId());
		if (!(SelectGoodsDao.isExisByGoodId(goodInfo))) {
			System.out.println("此商品不存在");
			List<GoodInfo> goodInfos = new ArrayList<GoodInfo>();
		    return goodInfos;
		}	
		return SelectGoodsDao.selectGoodsById(goodInfo);
	}
}
