package com.yanxuan.extFuns;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.mapper.UserInfoMapper;
import com.yanxuan.utils.SpringUtils;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class QuartzTest {

    ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
    UserInfoMapper infoMapper = context.getBean(UserInfoMapper.class);

    @Test
    public void demo01() {
        List<UserInfo> infoList = infoMapper.selectList(
            new EntityWrapper<UserInfo>()
                .isNotNull("userBirthday")
        );

        //        System.out.println(infoList.size());
        SimpleDateFormat format = new SimpleDateFormat("MM-dd");

        infoList.forEach(e -> {
            //用户的生日
            Date birthday = e.getUserBirthday();
            //用户的生日的月份——日期字符串
            String birStr = format.format(birthday);

            //当天日期
            Date today = new Date();
            String todayStr = format.format(today);

            if(birStr.equals(todayStr)){
                System.out.println("是同一天");




            }else {
                System.out.println("不是同一天");
            }
        });

    }
}