package com.yanxuan.service;


import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.Gson;
import com.yanxuan.dao.OrderDao;
import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.OrderInfo;

public class ConfirmService {
	public void dealMessage(LinkedList<OrderInfo> orderInfos) {
		ShopCartService shopCartService =  new  ShopCartService();
		for(int i = 0;i<orderInfos.size();i++) {
		//删除购物车内容
		shopCartService.delGoodFromShopCart(orderInfos.get(i).getUserId(), orderInfos.get(i).getGoodId());
		//减少库存
		OrderDao.updateGoodStock(orderInfos.get(i).getGoodId(), orderInfos.get(i).getOrderGoodNum());
		//加入订单到数据库
		OrderDao.insertOrder(orderInfos.get(i));
		}
	}
	
	public LinkedList<ShopCartIGoodtem> GoodInfoToGoodSimpleItem(LinkedList<GoodInfo> goodInfos ) {
		LinkedList<ShopCartIGoodtem> goodSimpleItems = new LinkedList<ShopCartIGoodtem>();
        Iterator<GoodInfo> iterator = goodInfos.iterator();
        Gson gson = new Gson();
        while ( iterator.hasNext() ) {
            GoodInfo goodInfo = iterator.next();
            ShopCartIGoodtem gSI = new ShopCartIGoodtem();
            gSI.setGoodId(goodInfo.getGoodId());
            gSI.setGoodName(goodInfo.getGoodName());
            gSI.setGoodDesc(goodInfo.getGoodDesc());
            gSI.setGoodPrice(goodInfo.getGoodPrice());
            gSI.setGoodTag(goodInfo.getGoodTag());
            gSI.setGoodSpec(goodInfo.getGoodSpec());
            gSI.setCount(1);

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
