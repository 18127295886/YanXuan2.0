package com.yanxuan.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Footprint;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.HotGoodInfo;
import com.yanxuan.mapper.FootprintMapper;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.mapper.HotGoodInfoMapper;
import com.yanxuan.service.GoodListShowService;
import com.yanxuan.utils.DButils;
import com.yanxuan.utils.SpringUtils;

public class HotGoodDao {
	ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
	GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
	GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);
	FootprintMapper footprintMapper=context.getBean(FootprintMapper.class);
	HotGoodInfoMapper hotGoodInfoMapper=context.getBean(HotGoodInfoMapper.class);
	
	/**获取List<GoodInfo>转化为简单商品信息集合List<GoodSimpleItem>
	 * @param goodInfos
	 * @return List<GoodSimpleItem>
	 */
	public List<GoodSimpleItem> GoodInfoToGoodSimpleItem( List<GoodInfo> goodInfos ) {
		GoodListShowService glss=new GoodListShowService();
		List<GoodSimpleItem> gsi=glss.GoodInfoToGoodSimpleItem(goodInfos);
		return gsi;
	}
	
	/**获取userId，查询改用户足迹后商品后返回4个简单商品的集合
	 * @param userId
	 * @return
	 */
	public List<GoodSimpleItem>  getDetailFootprint(Integer userId){
		List<Footprint> footprints=footprintMapper.selectList(new EntityWrapper<Footprint>().eq("userId", userId).orderBy("fpDate"));
		List<Integer> goodIdList=new ArrayList<Integer>();
		Collections.reverse(footprints);
		int i=0;
		for(Footprint footprint:footprints) {
			goodIdList.add(footprint.getGoodId());
			if (i==3) {break;}
			i++;
		}
		List<GoodInfo> goodInfos = goodInfoMapper.selectBatchIds(goodIdList);
		List<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
		return simpleItems;
	}
	
	
	/**获取gotgood的商品中最新的四个简单商品的集合
	 * @return
	 */
	public List<GoodSimpleItem> getHotGood(){
		List<HotGoodInfo> hotGoodInfos = hotGoodInfoMapper.selectList(new EntityWrapper<HotGoodInfo>());
		List<Integer> goodIdList=new ArrayList<Integer>();
		Collections.reverse(hotGoodInfos);
		int i=0;
		for(HotGoodInfo hotGoodInfo:hotGoodInfos) {
			goodIdList.add(hotGoodInfo.getGoodId());
			if (i==3) {break;}
			i++;
		}
		List<GoodInfo> goodInfos = goodInfoMapper.selectBatchIds(goodIdList);
		List<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
		return simpleItems;
	}
	
	
	public List<GoodSimpleItem> getRandom(){
		QueryRunner qRunner=DButils.getQueryRunner();
		String sql="select goodId from GoodInfo";
		List<Integer> allgoodIdList=null;
		try {
			allgoodIdList=qRunner.query(sql, new ColumnListHandler<Integer>("goodId"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		List<Integer> goodIdList=new ArrayList<Integer>();
		int i=allgoodIdList.size();
		int[]random=randomCommon(0, i-1, 4);
		for(int a:random) {
			goodIdList.add(allgoodIdList.get(a));
		}
		List<GoodInfo> goodInfos = goodInfoMapper.selectBatchIds(goodIdList);
		List<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
		return simpleItems;
	}
	
	
	
	/**生成随机数
	 * @param min
	 * @param max
	 * @param n
	 * @return
	 */
	public static int[] randomCommon(int min, int max, int n){  
	    if (n > (max - min + 1) || max < min) {  
	           return null;  
	       }  
	    int[] result = new int[n];  
	    int count = 0;  
	    while(count < n) {  
	        int num = (int) (Math.random() * (max - min)) + min;  
	        boolean flag = true;  
	        for (int j = 0; j < n; j++) {  
	            if(num == result[j]){  
	                flag = false;  
	                break;  
	            }  
	        }  
	        if(flag){  
	            result[count] = num;  
	            count++;  
	        }  
	    }  
	    return result;  
	}
}
