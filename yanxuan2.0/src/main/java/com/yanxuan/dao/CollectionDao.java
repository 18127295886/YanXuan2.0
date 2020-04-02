package com.yanxuan.dao;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Collected;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.mapper.CollectedMapper;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.service.GoodListShowService;
import com.yanxuan.utils.SpringUtils;


public class CollectionDao {
	ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
	GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
	GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);
	CollectedMapper collectedMapper=context.getBean(CollectedMapper.class);
	
	/**通过userId查询collecion表中对应的goodId集合
	 * @param userId
	 * @return List<Integer>
	 */
	public List<Integer> getGoodId(Integer userId) {
		List<Collected> collecteds=null;
		collecteds=collectedMapper.selectList
				(new EntityWrapper<Collected>().eq("userId", userId));
		if(collecteds.size()!=0) {
		List<Integer> goodIdArray=new ArrayList<Integer>();
		for(Collected collected:collecteds) {
			goodIdArray.add(collected.getGoodId());
		}
		return goodIdArray;
		}
		return null;
	}
	
	/**获取商品goodId数组之后查询goodInfo中的商品集合
	 * @param goodIdArray
	 * @return List<GoodInfo>
	 */
	public List<GoodInfo> getGoodInfo(List<Integer> goodIdArray){
		List<GoodInfo> goodInfos = goodInfoMapper.selectBatchIds(goodIdArray);
		return goodInfos;
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
	
	
	/**获取userId和goodId删除指定的connected表中的收藏
	 * @param userId
	 * @param goodId
	 */
	public void deleteConnection(Integer userId,Integer goodId){
		collectedMapper.delete(new EntityWrapper<Collected>().
				eq("goodId", goodId).eq("userId", userId));
	}
	
	/**添加collected到数据库
	 * @param collected
	 */
	public void addCollection(Collected collected) {
		collectedMapper.insert(collected);
	}
	
	public boolean checkCollection(Collected collected) {
		List<Collected> list=collectedMapper.selectList(new EntityWrapper<Collected>().
				eq("goodId", collected.getGoodId()).eq("userId", collected.getUserId()));
		if(list.size()==0) {
			return true;
		}else {
			return false;
		}
	}
}
