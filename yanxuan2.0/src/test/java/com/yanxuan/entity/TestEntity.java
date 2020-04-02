package com.yanxuan.entity;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.mapper.GoodTypeInfoMapper;
import com.yanxuan.mapper.UserInfoMapper;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class TestEntity {

    ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

    @Test
    public void testDemo01() throws UnsupportedEncodingException {

        GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);
        List<GoodInfo> list = goodInfoMapper.selectList(null);
        //        list.forEach(System.out::println);
        System.out.println(list.size());
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        List<GoodInfo> list1 = goodInfoMapper.selectList(
            new EntityWrapper<GoodInfo>()
                .like("goodName", "易"));
        System.out.println(list1.size());

        GoodTypeInfoMapper goodTypeInfoMapper = context.getBean(GoodTypeInfoMapper.class);

        List<Integer> intlist = new ArrayList<Integer>();
        intlist.add(1);
        intlist.add(2);
        intlist.add(3);
        List<GoodTypeInfo> goodInfos = goodTypeInfoMapper.selectBatchIds(intlist);
        System.out.println(goodInfos.size());
        goodInfos.forEach(System.out::println);

        Integer count = goodTypeInfoMapper.selectCount(null);
        System.out.println(count);

        List<GoodTypeInfo> midTypeName = goodTypeInfoMapper.selectList(
            new EntityWrapper<GoodTypeInfo>().like("midTypeName", "3C")
        );
        midTypeName.forEach(System.out::println);

        UserInfoMapper userInfoMapper = context.getBean(UserInfoMapper.class);
        List<UserInfo> userInfos = userInfoMapper.selectPage(new Page<UserInfo>(2, 10), null);
        System.out.println(userInfos.size());
        userInfos.forEach(e -> {
            System.out.println(e.getUserName());
        });

        List<UserInfo> userInfos1 = userInfoMapper.selectList(
            new EntityWrapper<UserInfo>()
        );
        userInfos1.forEach(System.out::println);

        List<GoodInfo> goodTypeId = goodInfoMapper.selectList(new EntityWrapper<GoodInfo>().eq("goodTypeId", 1));
        System.out.println(goodTypeId.size());
    }

    @Test
    public void testDemo02() {
        GoodInfoMapper goodInfoMapper = context.getBean(GoodInfoMapper.class);

        List<GoodInfo> goodInfos = goodInfoMapper.selectList(
            new EntityWrapper<GoodInfo>().like("goodName", "易"));

        goodInfos.forEach(System.out::println);

        List<GoodInfo> goodInfos1 = goodInfoMapper.selectList(new EntityWrapper<GoodInfo>().like("goodName", "3D"));
        goodInfos1.forEach(System.out::println);

    }
}
