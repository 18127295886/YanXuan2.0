package com.yanxuan.dao;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.utils.DButils;
import com.yanxuan.utils.SpringUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.SQLException;
import java.util.List;

public class SelectGoodsDao {
	
	static Integer goodTypeId =null;//商品类型ID
	
	//查询是否存在商品
	public static boolean isExisByGoodId(GoodInfo goodById) {
		System.out.println("执行到了isExisByGoodId");
		QueryRunner queryRunner = DButils.getQueryRunner();
		boolean isExisByGoodId = true;
		int goodId = goodById.getGoodId();
		String sql="select * from GoodInfo where goodId=?";
		try {
			List<Object[]> rSet = queryRunner.query(sql, new ArrayListHandler(), goodId);
			if (rSet.isEmpty()) {
				isExisByGoodId = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isExisByGoodId;		
	}
	
	
	//查询商品的具体详情
	public static List<GoodInfo> selectGoodsById(GoodInfo goodById) {
		//System.out.println("执行到了selectGoodsById");
		
		ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
		GoodInfoMapper goodInfoMapper = appContext.getBean(GoodInfoMapper.class);
		List<GoodInfo> selectList = goodInfoMapper.selectList(
				new EntityWrapper<GoodInfo>()
				.eq("goodId", goodById.getGoodId())
				);	
		//取得商品的类型ID
		goodTypeId = selectList.get(0).getGoodTypeId();
		return selectList;		
	}
	
	//查询商品类型表
	public static List<GoodTypeInfo> selectGoodsTypeById(){
		
		ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
		GoodTypeInfoMapper goodInfoMapper1 = appContext.getBean(GoodTypeInfoMapper.class);
		List<GoodTypeInfo> selectList1 = goodInfoMapper1.selectList(
				new EntityWrapper<GoodTypeInfo>()
				.eq("goodTypeId", goodTypeId)
				);		
		
		return selectList1;
		
	}
	
	
	
	
}
