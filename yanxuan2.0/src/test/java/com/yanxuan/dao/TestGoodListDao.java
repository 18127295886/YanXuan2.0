package com.yanxuan.dao;

import com.yanxuan.dto.vo.GoodListVo;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;

/**
 * @author weiwu
 * @description 用于测试goodlistdao的所有方法
 * @date 2018/8/30 10:32
 */
public class TestGoodListDao {
    GoodListDao goodListDao = new GoodListDao();

    @Test
    public void testGetTypeList() {
        List<GoodTypeInfo> list = goodListDao.getGoodTypeList("电器");
        list.forEach(System.out::println);
    }

    @Test
    public void testGetGoodList() {
        HashMap<GoodTypeInfo, List<GoodInfo>> goodList = goodListDao.getGoodList("电器");
        goodList.forEach(( k, v ) -> {
            System.out.println(k);
            v.forEach(e -> System.out.println("\t\t\t\t" + e.getGoodName()));
        });
    }

    @Test
    public void testGoodListVo() {
        HashMap<GoodTypeInfo, List<GoodInfo>> goodList = goodListDao.getGoodList("电器");
        GoodListVo goodListVo = new GoodListVo(goodList);

        List<String> rankFuns = goodListVo.getRankFuns();
        rankFuns.forEach(System.out::println);

        HashMap<GoodTypeInfo, List<GoodSimpleItem>> simGoodList = goodListVo.getSimGoodList();
        simGoodList.forEach(( k, v ) -> {
            System.out.println(k);
            if ( simGoodList.get(k) == null ) {
                System.out.println("++++++++");
            } else {
                v.forEach(System.out::println);
            }
        });
    }
}
