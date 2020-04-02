package com.yanxuan.service;

import java.util.List;

import com.yanxuan.dao.CollectionDao;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Collected;
import com.yanxuan.entity.GoodInfo;

/**
 * @author lenovo
 *
 */
public class CollectionService {
	CollectionDao cDao=new CollectionDao();
	
	/**获取userId并返回对应的收藏商品的goodsimpleitem集合
	 * @param userId
	 * @return List<GoodSimpleItem>
	 */
	public List<GoodSimpleItem> showCollection(Integer userId) {
		List<GoodSimpleItem> goodSimpleItems=null;
		List<Integer> goodId=cDao.getGoodId(userId);
		if (goodId!=null) {
			List<GoodInfo> goodInfos=cDao.getGoodInfo(goodId);
			goodSimpleItems=cDao.GoodInfoToGoodSimpleItem(goodInfos);
		}	
		return goodSimpleItems;
	}
	
	/**获取用户id和商品id删除指定收藏
	 * @param userId
	 * @param goodId
	 */
	public void deleteCollection(Integer userId,Integer goodId){
		cDao.deleteConnection(userId, goodId);
	}
	
	
	/**通过collected的userId和goodId判断是否已经存在该收藏，不存在就添加
	 * @param collected
	 * @return boolean
	 */
	public boolean addCollection(Collected collected) {
		if(cDao.checkCollection(collected)) {
			cDao.addCollection(collected);
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean checkCollection(Collected collected) {
		return cDao.checkCollection(collected);
	}
}
