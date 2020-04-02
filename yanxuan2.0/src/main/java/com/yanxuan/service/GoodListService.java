package com.yanxuan.service;

import com.yanxuan.dao.GoodListDao;
import com.yanxuan.dto.vo.GoodListVo;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;

import java.util.HashMap;
import java.util.List;

/**
 * @author weiwu
 * @description 处理商品列表的业务业务逻辑
 * @date 2018/8/30 11:15
 */
public class GoodListService {

    GoodListDao goodListDao = new GoodListDao();

    /**
     * 根据传递过来的商品种类，获得该种类的所有子类下的所有商品
     *
     * @param columnValue
     * @return
     */
    public GoodListVo getGoodListByTypeName( String columnValue ) {
        HashMap<GoodTypeInfo, List<GoodInfo>> goodList = goodListDao.getGoodList(columnValue);
        GoodListVo goodListVo = new GoodListVo(goodList);
        return goodListVo;

    }

}
