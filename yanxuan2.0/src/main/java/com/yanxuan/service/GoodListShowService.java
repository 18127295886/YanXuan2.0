package com.yanxuan.service;

import com.google.gson.Gson;
import com.yanxuan.dao.GoodListShowDao;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodInfo;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class GoodListShowService {
	GoodListShowDao gDao=new GoodListShowDao();
	//smalltype商品种类（String）和排序方法（int）是否倒叙(boolean)  商品List返回json字符串
	public String getGLByType(String smallType,int rankFun,boolean flag) {
		List<GoodInfo> goodInfos=null;
		//将String的商品类型变成商品表的类型id
		int typeId=gDao.getGoodTypeIDBySmallType(smallType);
		//rankFun为0，  默认排序
		if(rankFun==0) {
			goodInfos=gDao.getGLByType(typeId);
		}
		//rankFun为1，价格排序
		else if (rankFun==1) {
			goodInfos=gDao.getGLByTypePrice(typeId, flag);
		}
		//rankFun为2，好评排序
		else if (rankFun==2) {
			goodInfos=gDao.getGLByTypeRate(typeId, flag);
		}	
		LinkedList<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
		return toJson(simpleItems);
	}
	//全部商品  排序
	public String getGLAll(int rankFun,boolean flag) {
		List<GoodInfo> goodInfos=null;
		//rankFun为1，价格排序
		if (rankFun==1) {
			goodInfos=gDao.getGLPrice(flag);
		}
		//rankFun为2，好评排序
		else if (rankFun==2) {
			goodInfos=gDao.getGLRate(flag);
		}
		LinkedList<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
		return toJson(simpleItems);
	}
	
	//将全部商品集合转化为json字符串
	public String  toJson(LinkedList<GoodSimpleItem> goodInfos) {
		Gson gson=new Gson();
		String jsonGSimpleList=null;
		GoodList goodList=new GoodList();
		goodList.setGoodInfos(goodInfos);
		jsonGSimpleList=gson.toJson(goodList);
		return jsonGSimpleList;
	}
	public LinkedList<GoodSimpleItem> toSimpleItems(String json){
		Gson gson=new Gson();
		GoodList goodList=gson.fromJson(json, GoodList.class);
		return goodList.getGoodInfos();
	}
	//将GoodInfo转化为GoodSimpleItem
	public LinkedList<GoodSimpleItem> GoodInfoToGoodSimpleItem( List<GoodInfo> goodInfos ) {
		LinkedList<GoodSimpleItem> goodSimpleItems =new LinkedList<GoodSimpleItem>();
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

          
            String goodPic = goodInfo.getGoodPic();
            PicList picList = gson.fromJson(goodPic, PicList.class);

            String[] picList1 = picList.getPicList();
  

            String primaryImgUrl = picList1[0];
            gSI.setGoodPic(primaryImgUrl);

            //System.out.println("第一张图片的路径:" + primaryImgUrl);

            goodSimpleItems.add(gSI);
//            System.out.println(gSI);
        }
        return goodSimpleItems;
    }
	
	
	
//内部类用户json转化
	class GoodList{
		LinkedList<GoodSimpleItem> goodInfos;

		public LinkedList<GoodSimpleItem> getGoodInfos() {
			return goodInfos;
		}

		public void setGoodInfos(LinkedList<GoodSimpleItem> goodInfos) {
			this.goodInfos = goodInfos;
		}
		
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
