package com.yanxuan.dao;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.utils.DButils;
import com.yanxuan.utils.SpringUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * @author weiwu
 * @description
 * @date 2018/8/30 10:20
 */
public class GoodListDao {
    ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
    GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
    GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);

    public HashMap<GoodTypeInfo, List<GoodInfo>> getGoodList( String columnValue) {
        LinkedHashMap<GoodTypeInfo, List<GoodInfo>> infoHashMap = new LinkedHashMap<>();
        List<GoodTypeInfo> typeList = getGoodTypeList(columnValue);
        for ( GoodTypeInfo goodTypeInfo : typeList ) {
        	
        		List<GoodInfo> goodTypeIdList = goodInfoMapper.selectList(
                        new EntityWrapper<GoodInfo>()
                            .eq("goodTypeId", goodTypeInfo.getGoodTypeId())
                    );
        		infoHashMap.put(goodTypeInfo, goodTypeIdList);
			
            
        }
        return infoHashMap;

    }

    public List<GoodTypeInfo> getGoodTypeList(String columnValue ) {
        List<GoodTypeInfo> typeInfos =null;
        if (columnValue.equals("电器")) {
        	typeInfos= goodTypeInfoMapper
        			.selectList(
        					new EntityWrapper<GoodTypeInfo>()
        					.like("typeName", columnValue)
        					);
		}
        else {
        	typeInfos= goodTypeInfoMapper
        			.selectList(
        					new EntityWrapper<GoodTypeInfo>()
        					.eq("smallType", columnValue)
        					);
        }

        return typeInfos;
    }
    
    //通过goodtypeID查询对应种类的商品List“默认”
    public List<GoodInfo> getGLByType(int goodTypeID){
    	List<GoodInfo> goodTypeIdList = goodInfoMapper.selectList(
                new EntityWrapper<GoodInfo>()
                    .eq("goodTypeId", goodTypeID)
            );
		return goodTypeIdList;
    }
   
}
