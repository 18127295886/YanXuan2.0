package com.yanxuan.extFuns;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.mapper.UserInfoMapper;
import com.yanxuan.utils.EmailUtils;
import com.yanxuan.utils.SpringUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author weiwu
 * @description 在用于生日当天发送祝福短信
 * @date 2018/9/9 14:17
 */
public class SendBirthdayEmail implements Job {

    ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
    UserInfoMapper infoMapper = context.getBean(UserInfoMapper.class);

    @Override
    public void execute( JobExecutionContext jobExecutionContext ) throws JobExecutionException {
        TimeEmail();
    }

    /*定时任务就是:遍历一次数据库，*/
    private void TimeEmail() {
        List<UserInfo> infoList = infoMapper.selectList(
            new EntityWrapper<UserInfo>()
                .isNotNull("userBirthday")
        );

        //设置时间转换器
        SimpleDateFormat format = new SimpleDateFormat("MM-dd");

        infoList.forEach(e -> {
            //用户的生日
            Date birthday = e.getUserBirthday();
            //用户的生日的  月份-日期  字符串
            String birStr = format.format(birthday);

            //当天日期
            Date today = new Date();
            String todayStr = format.format(today);

            if ( birStr.equals(todayStr) ) {
                //当前遍历到的用户的生日和当天的日期一样的话
                EmailUtils.sendBirthdayEmail(e);
            } else {

            }
        });
    }
}
