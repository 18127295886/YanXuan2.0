package com.yanxuan.dao;

import java.awt.List;
import java.sql.Date;
import java.sql.SQLException;
import java.util.LinkedList;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.yanxuan.entity.Address;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.OrderInfo;
import com.yanxuan.utils.DButils;

public class OrderDao {
	
	//获取默认地址
	public static  Address getAddress(Integer addressId) {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select * from Address where addrId=?";
		Address address = null;
		try {
			address = queryRunner.query(sql,new BeanHandler<Address>(Address.class),addressId);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}
	
	//更新商品库存
	public static void updateGoodStock(Integer goodId,Integer count) {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select goodStock from GoodInfo where goodId = ?";
		try {
			GoodInfo goodInfo = queryRunner.query(sql, new BeanHandler<GoodInfo>(GoodInfo.class),goodId);
			Integer goodStock = goodInfo.getGoodStock();
			Integer goodStock1 = goodStock - count ;
			String sql1 = "update GoodInfo set goodStock = ? where goodId = ?";
			queryRunner.update(sql1, goodStock1,goodId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	

	//加入订单到数据库
	public static void insertOrder(OrderInfo orderInfo) {
		String orderId = orderInfo.getOrderId();
		Integer userId = orderInfo.getUserId();
		Integer goodId = orderInfo.getGoodId();
		Integer addrId = orderInfo.getAddrId();
		Date orderDate =  new java.sql.Date( orderInfo.getOrderDate().getTime());
		Integer orderGoodNum = orderInfo.getOrderGoodNum();
		Integer orderStatus = orderInfo.getOrderStatus();
		Integer orderPay = orderInfo.getOrderPay();
		String goodSpec = orderInfo.getGoodSpec();
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "insert into OrderInfo (orderId,userId,goodId,addrId,orderDate,orderGoodNum,orderStatus,orderPay,goodSpec) values(?,?,?,?,?,?,?,?,?)";
		try {
			queryRunner.update(sql,orderId,userId,goodId,addrId,orderDate,orderGoodNum,orderStatus,orderPay,goodSpec);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询商品信息
	public static LinkedList<GoodInfo> findInfo(String[] goodId) throws SQLException {
		QueryRunner queryRunner = DButils.getQueryRunner();
		String sql = "select * from GoodInfo where goodId = ?";
		LinkedList<GoodInfo> list =new LinkedList<GoodInfo>();
		for(int i = 0;i<goodId.length;i++) {
			GoodInfo goodInfo = queryRunner.query(sql, new BeanHandler<GoodInfo>(GoodInfo.class),goodId[i]);
			list.add(goodInfo);
		}
		return list;
	}
}
