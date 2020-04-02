package com.yanxuan.service;


import java.util.List;

import com.yanxuan.dao.AddressDao;
import com.yanxuan.entity.Address;

public class AddressService {
	public  AddressDao ad=null;
	
	public AddressService(){
		this.ad=new AddressDao();
	}
	
	//查询所有地址
	public List<Address> selectAddress(Integer userId){
		return ad.selectAddress(userId);
	}
	
	//根据addrId删除地址
	public void deleteAddressByAddrId(int addrId) {
		 ad.deleteAddressByAddrId(addrId);
	}
	public void newAddress(Integer usrId,String province,String city,String area,String address,String receiver,String mobile) {
		ad.newAddress(usrId,province, city, area, address, receiver, mobile);
	}
	//根据userID改变数据库中userAddress
	public void setDefaultAddress(Integer userId,Integer userAddress ) {
		ad.setDefaultAddress(userId, userAddress);
	}
}
