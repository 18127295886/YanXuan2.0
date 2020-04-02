package com.yanxuan.dao;

import java.util.ArrayList;

import org.junit.Test;

import com.google.gson.Gson;
import com.yanxuan.entity.GoodAttrs;
import com.yanxuan.entity.GoodAttrs1;
import com.yanxuan.entity.GoodAttrs2;
import com.yanxuan.entity.GoodDetail;
import com.yanxuan.entity.GoodDetail2;
import com.yanxuan.entity.GoodImgUrls;

public class TestGetGoodsDetailDao {

	@Test
	public void TestGetGoodsDetailDao() {
		String gooddetails = GetGoodsDetailDao.getGoodsDetail(1010003);
		//System.out.println("gooddetails" + gooddetails);
		String goodDetailPics = GetGoodsDetailDao.getGoodsDetailPic(1010003);
		Gson gson = new Gson();

		GoodAttrs1 gd = gson.fromJson(gooddetails, GoodAttrs1.class);
		ArrayList<GoodAttrs> gd1 = gd.getGoodAttrs();
		//System.out.println("gd1" + gd1);

		ArrayList<GoodAttrs2> goodAttrs = new ArrayList<>();
		for (GoodAttrs ad : gd1) {

//			ad.getAttrName();
//			ad.getAttrValue();
			//System.out.println(ad.getAttrName());

			GoodAttrs2 ga2 = new GoodAttrs2();
			ga2.setName(ad.getAttrName());
			ga2.setValue(ad.getAttrValue());
			goodAttrs.add(ga2);
		}

		// System.out.println(gd.getAttrName()+gd.getAttrValue());

		GoodImgUrls gdp = gson.fromJson(goodDetailPics, GoodImgUrls.class);

		ArrayList<GoodImgUrls> goodImgUrls = new ArrayList<>();
		goodImgUrls.add(gdp);

		GoodDetail goodDetail = new GoodDetail();
		goodDetail.setGoodAttrs(goodAttrs);
		goodDetail.setGoodImgUrls(goodImgUrls);

		GoodDetail2 goodDetail2 = new GoodDetail2();
		goodDetail2.setGoodDetail(goodDetail);
		String jsonStr = gson.toJson(goodDetail2);

		System.out.println(jsonStr);

	}

}
