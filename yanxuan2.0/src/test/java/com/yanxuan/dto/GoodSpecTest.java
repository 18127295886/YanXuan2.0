package com.yanxuan.dto;

import com.google.gson.Gson;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.utils.SpringUtils;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GoodSpecTest {

    @Test
    public void TestDemo01() {

        ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
        GoodInfoMapper goodInfoMapper = appContext.getBean(GoodInfoMapper.class);
        GoodInfo goodInfo = goodInfoMapper.selectById(1672038);

        Gson gson = new Gson();
        GoodSpec goodSpec = gson.fromJson(goodInfo.getGoodSpec(), GoodSpec.class);
    }
}