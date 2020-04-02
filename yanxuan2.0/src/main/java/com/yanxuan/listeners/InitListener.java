package com.yanxuan.listeners;

import com.yanxuan.extFuns.Quartz;
import org.quartz.SchedulerException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author weiwu
 * @description ${DESCRIPTION}
 * @date 2018/9/9 8:17
 */
public class InitListener implements ServletContextListener {

    @Override
    public void contextInitialized( ServletContextEvent sce ) {
        Quartz quartz = new Quartz();
        try {
            quartz.checkbirthdayEmail();
        } catch ( SchedulerException e ) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed( ServletContextEvent sce ) {

    }
}
