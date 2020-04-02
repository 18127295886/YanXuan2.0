package com.yanxuan.dao;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Footprint;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.mapper.FootprintMapper;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.service.GoodListShowService;
import com.yanxuan.utils.SpringUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author lenovo
 *
 */
public class FootprintDao {
	ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
	GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
	GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);
	FootprintMapper footprintMapper=context.getBean(FootprintMapper.class);
	
	/**通过userId查询Footprint表中对应的goodId Map,以日期分类
	 * @param userId
	 * @return Map<String,List<Integer>>
	 */
	public Map<String,List<Integer>> getGoodId(Integer userId) {
		List<Footprint> footprints=null;
		footprints=footprintMapper.selectList
				(new EntityWrapper<Footprint>().eq("userId", userId));
		if(footprints.size()!=0) {
		Map<String,List<Integer>> goodIdArray=new HashMap<String,List<Integer>>();
		for(Footprint footprint:footprints) {
			String fpDate=footprint.getFpDate();
			Integer goodId=footprint.getGoodId();
			//判断是否存在该日期分类
			if(goodIdArray.containsKey(fpDate)) {
				//存在相同日期分类
					//把goodId加入到那一天的的商品Id的list中
				goodIdArray.get(fpDate).add(goodId);
			}else {
				//不存在该日期分类
					//新建一个日期
				ArrayList<Integer> list=new ArrayList<Integer>();
				list.add(goodId);
				goodIdArray.put(fpDate, list);
			}
		}
		return goodIdArray;
		}
		return null;
	}
	
	
	
	/**
	 * @param goodIdArray
	 * @return Map<String,List<GoodSimpleItem>>
	 */
	public Map<String,List<GoodSimpleItem>> getGoodSimpleItem(Map<String,List<Integer>> goodIdArray){
		if (goodIdArray!=null) {
		Map<String,List<GoodSimpleItem>> simpleItemMap=new HashMap<String,List<GoodSimpleItem>>();
		for(String date:goodIdArray.keySet()) {
			//获取对应日期的商品集合
			List<GoodInfo> goodInfos = goodInfoMapper.selectBatchIds(goodIdArray.get(date));
			//将商品集合转化为简单商品集合
			List<GoodSimpleItem> simpleItems=GoodInfoToGoodSimpleItem(goodInfos);
			simpleItemMap.put(date, simpleItems);
		}
		return simpleItemMap;
		}
		else {
			return null;
		}
	}
	
	/**获取List<GoodInfo>转化为简单商品信息集合List<GoodSimpleItem>
	 * @param goodInfos
	 * @return List<GoodSimpleItem>
	 */
	public List<GoodSimpleItem> GoodInfoToGoodSimpleItem( List<GoodInfo> goodInfos ) {
		GoodListShowService glss=new GoodListShowService();
		List<GoodSimpleItem> gsi=glss.GoodInfoToGoodSimpleItem(goodInfos);
		return gsi;
	}
	
	/**获取userId和goodId删除指定的Footprint表中的收藏
	 * @param userId
	 * @param goodId
	 */
	public void deleteFootprint(Integer userId,Integer goodId){
		footprintMapper.delete(new EntityWrapper<Footprint>().
				eq("goodId", goodId).eq("userId", userId));
	}
	
	
	/**添加Footprint到数据库
	 * @param Footprint
	 */
	public void addFootprint(Footprint footprint) {
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		String fpDate=sdf1.format(new Date());
		footprint.setFpDate(fpDate);
		footprintMapper.insert(footprint);
	}
	
	
	/**传入footprint更新数据库的时间
	 * @param footprint
	 */
	public void updateFootprintDate(Footprint footprint,Footprint dateBean) {
		footprintMapper.update(dateBean, new EntityWrapper<Footprint>().
				eq("goodId", footprint.getGoodId()).eq("userId", footprint.getUserId()));
	}
	
	
	/**检查是否存在该足迹数据数据存在则更新时间
	 * @param footprint
	 * @return
	 */
	public void checkFootprint(Footprint footprint) {
		
		List<Footprint> list=footprintMapper.selectList(new EntityWrapper<Footprint>().
				eq("goodId", footprint.getGoodId()).eq("userId", footprint.getUserId()));
		if(list.size()==0) {
			addFootprint(footprint);
		}else {
			SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
			String fpDate=sdf1.format(new Date());
			Footprint dateBean=new Footprint();
			dateBean.setFpDate(fpDate);
			updateFootprintDate(footprint,dateBean);
		}
	}
	
	
	
	
	
	
}
