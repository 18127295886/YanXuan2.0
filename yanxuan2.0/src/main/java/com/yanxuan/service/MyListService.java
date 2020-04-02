package com.yanxuan.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.Gson;
import com.yanxuan.dao.MyListDao;
import com.yanxuan.entity.OrderList;

public class MyListService {
	public LinkedList<OrderList> getOrderList(Integer userId) throws SQLException {
		List<OrderList> list = MyListDao.getMyList(userId);
		LinkedList<OrderList> linkedList = new LinkedList<OrderList>();
		Iterator<OrderList> iterator = list.iterator();
		Gson gson = new Gson();
		while(iterator.hasNext()) {
			OrderList orderList = iterator.next();
			OrderList list2 = new OrderList();
			list2.setGoodName(orderList.getGoodName());
			list2.setOrderDate(orderList.getOrderDate());
			list2.setOrderGoodNum(orderList.getOrderGoodNum());
			list2.setOrderId(orderList.getOrderId());
			list2.setOrderPay(orderList.getOrderPay());
			list2.setOrderStatus(orderList.getOrderStatus());
			list2.setGoodId(orderList.getGoodId());
			String pic = orderList.getGoodPic();
			PicList picList = gson.fromJson(pic, PicList.class);
			String[] picList1 = picList.getPicList();
			String pic1 = picList1[0];
			list2.setGoodPic(pic1);
			linkedList.add(list2);
		}
		return linkedList;
	}
	class PicList{
		private String[] PicList;

		public String[] getPicList() {
			return PicList;
		}

		public void setPicList(String[] picList) {
			PicList = picList;
		}
	}
}
