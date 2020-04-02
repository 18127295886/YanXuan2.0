package com.yanxuan.service;

import java.util.ArrayList;
import java.util.List;

import com.yanxuan.dao.SelectGoodsDao;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;

public class SelectGoodTypeService {

		public static List<GoodTypeInfo> selectGoodTypeByID(GoodInfo goodById) {
			GoodInfo goodInfo = goodById;
			if (!(SelectGoodsDao.isExisByGoodId(goodInfo))) {
				//System.out.println("此商品不存在");
				List<GoodTypeInfo> goodInfos = new ArrayList<GoodTypeInfo>();
			   return goodInfos;
			}				
			return SelectGoodsDao.selectGoodsTypeById();
					
		}
}
