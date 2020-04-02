package com.yanxuan.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.Gson;
import com.yanxuan.dao.GoodSearch;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodInfo;

public class SearchService {

	public LinkedList<GoodSimpleItem> GoodInfoToGoodSimpleItem(String goodName ) throws SQLException {
			List<GoodInfo> goodInfos = GoodSearch.nameSearch(goodName);
			LinkedList<GoodSimpleItem> goodSimpleItems = new LinkedList<GoodSimpleItem>();
        	Iterator<GoodInfo> iterator = goodInfos.iterator();
        	Gson gson = new Gson();
        	while ( iterator.hasNext() ) {
            GoodInfo goodInfo = iterator.next();
            GoodSimpleItem gSI = new GoodSimpleItem();
            gSI.setGoodId(goodInfo.getGoodId());
            gSI.setGoodName(goodInfo.getGoodName());
            gSI.setGoodDesc(goodInfo.getGoodDesc());
            gSI.setGoodPrice(goodInfo.getGoodPrice());
            gSI.setGoodTag(goodInfo.getGoodTag());

            //            System.out.println(goodInfo.getGoodPic());
            String goodPic = goodInfo.getGoodPic();
            
            PicList picList = gson.fromJson(goodPic, PicList.class);

            String[] picList1 = picList.getPicList();
            //            for ( String s : picList1 ) {
            //                System.out.println(s);
            //            }

            String primaryImgUrl = picList1[0];
            gSI.setGoodPic(primaryImgUrl);

            //System.out.println("第一张图片的路径:" + primaryImgUrl);

            goodSimpleItems.add(gSI);
            
        }
			return goodSimpleItems;
    }
	class PicList {
	    String[] PicList;

	    public String[] getPicList() {
	        return PicList;
	    }

	    public void setPicList( String[] picList ) {
	        PicList = picList;
	    }
	}
}
