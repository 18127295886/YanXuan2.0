package com.yanxuan.service;

import java.util.List;
import java.util.Map;

import com.yanxuan.dao.FootprintDao;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Collected;
import com.yanxuan.entity.Footprint;
import com.yanxuan.entity.GoodInfo;

import net.sf.jsqlparser.statement.delete.Delete;

public class FootprintService {
	FootprintDao fDao=new FootprintDao();
	
	
	
	/**获取userId 返回对应的以 日期 分类的简单商品集合 的Map
	 * @param userId
	 * @return Map<String,List<GoodSimpleItem>>
	 */
	public Map<String,List<GoodSimpleItem>> showFootprint(Integer userId) {
		Map<String,List<Integer>> goodIdArray=fDao.getGoodId(userId);
		Map<String,List<GoodSimpleItem>> simpleItemMap=fDao.getGoodSimpleItem(goodIdArray);
		return simpleItemMap;
	}
	
	/**获取用户id和商品id“删除”指定足迹
	 * @param userId
	 * @param goodId
	 */
	public void deleteFootprint(Integer userId,Integer goodId){
		fDao.deleteFootprint(userId, goodId);
	}
	
	/**传入的footprint“只需要设置goodId和userId”  “添加”足迹
	 * @param collected
	 * @return boolean
	 */
	public void addFootpring(Footprint footprint) {
		fDao.checkFootprint(footprint);	
	}
}
