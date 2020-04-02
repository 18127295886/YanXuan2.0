package com.yanxuan.service;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;

import org.junit.Test;

import com.yanxuan.dto.vo.GoodSimpleItem;

public class TestSearchService {
	@Test
	public void test() throws SQLException {
		LinkedList<GoodSimpleItem> list = new SearchService().GoodInfoToGoodSimpleItem("网易");
		Collections.sort(list, new Comparator<GoodSimpleItem>() {

			@Override
			public int compare(GoodSimpleItem o1, GoodSimpleItem o2) {
				// TODO Auto-generated method stub
				return o1.getGoodPrice()-o2.getGoodPrice();
			}
			
		});
		//String[] test = list.toArray(new String[0]);
		
		//System.out.println(test);
//		list.forEach(e->{
//			System.out.println(e);
//		});
		
		GoodSimpleItem[] simpleItems = new GoodSimpleItem[list.size()] ;
		list.toArray(simpleItems);
		for (int i = 0; i < simpleItems.length; i++) {
			GoodSimpleItem goodSimpleItem = simpleItems[i];
			System.out.println(goodSimpleItem);
		}
	}
}
