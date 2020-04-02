package com.yanxuan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.yanxuan.utils.DButils;

public class GetGoodsDetailDao {

	
		
		public static String getGoodsDetail(int goodId) {
			int goodid = goodId;
			String rSet = "";
			
			QueryRunner queryRunner = DButils.getQueryRunner();
			String sql = "select goodDetail from GoodInfo where goodId = ?";
		
			try {
				rSet = queryRunner.query(sql,new ScalarHandler<String>(),goodId);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rSet;
		}
		public static String getGoodsDetailPic(int goodId) {
			int goodid = goodId;
			
			String rSet1 = "";
			QueryRunner queryRunner = DButils.getQueryRunner();
			
			String sql1 = "select goodDetailPic from GoodInfo where goodId = ?";
			try {
				
				rSet1 = queryRunner.query(sql1,new ScalarHandler<String>(),goodId);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rSet1;
		}
		
}
