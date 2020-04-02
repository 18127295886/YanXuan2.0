package com.yanxuan.dao;


import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.yanxuan.entity.Address;
import com.yanxuan.utils.DButils;

import net.sf.jsqlparser.statement.insert.Insert;

public class AddressDao {
	public  QueryRunner qRunner=null;
	public AddressDao(){
		 this.qRunner=DButils.getQueryRunner();
	}
	
	//查询全部地址
	public List<Address> selectAddress(Integer userId){
		String sql="select * from Address where userId=?";
		List<Address> userAddressList=null;
		try {
			userAddressList=qRunner.query(sql,new BeanListHandler<Address>(Address.class),userId );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userAddressList;
	}
	//删除指定addrId地址
	public void deleteAddressByAddrId(int addrId) {
		String sql="delete from Address where addrId=?";
		try {
			qRunner.update(sql,new Object[]{addrId});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void newAddress(Integer userId,String province,String city,String area,String address,String receiver,String mobile) {
		String sql="insert into Address(userId,province,city,area,addrDetail,receiver,mobile)values(?,?,?,?,?,?,?)";
		try {
			qRunner.update(sql, new Object[] {userId,province,city,area,address,receiver,mobile});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setDefaultAddress(Integer userId,Integer userAddress ) {
		String sql="update UserInfo set userAddress=? where userId=?";
		try {
			qRunner.update(sql,new Object[] {userAddress,userId});
		} catch (SQLException e) {
			// TODO: handle exception
		}
//		System.out.println("修改成功");
	}
}
