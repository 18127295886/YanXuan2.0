package com.yanxuan.utils;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author weiwu
 * @description 管理spring容器的工具类
 * @date 2018/8/30 10:21
 */
public class SpringUtils {
    static ClassPathXmlApplicationContext context = null;

    public static ClassPathXmlApplicationContext getAppContext() {
        if ( context == null ) {
            context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        }
        return context;
    }
}
