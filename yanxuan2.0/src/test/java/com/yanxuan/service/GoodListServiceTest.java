package com.yanxuan.service;

import com.yanxuan.dto.vo.GoodListVo;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.GoodTypeInfo;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;

public class GoodListServiceTest {

    @Test
    public void getGoodListByTypeName() {

        GoodListService goodListService = new GoodListService();
        GoodListVo goodListVo = goodListService.getGoodListByTypeName("电器");
        goodListVo.getRankFuns().forEach(System.out::print);
        System.out.println();
        goodListVo.getSmallTypes().forEach(System.out::println);
        System.out.println();
        HashMap<GoodTypeInfo, List<GoodSimpleItem>> simGoodList = goodListVo.getSimGoodList();
        simGoodList.forEach(( k, v ) -> {
            System.out.println(k);
            v.forEach(System.out::println);
        });

    }
}