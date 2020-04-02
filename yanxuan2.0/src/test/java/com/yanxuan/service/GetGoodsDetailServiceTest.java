package com.yanxuan.service;

import org.junit.Test;

public class GetGoodsDetailServiceTest {

    @Test
    public void getGoodsDetail() {
        String goodsDetail = GetGoodsDetailService.getGoodsDetail(1672038);
        System.out.println(goodsDetail);
    }
}