package com.yanxuan.extFuns;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class Quartz {

    public void checkbirthdayEmail() throws SchedulerException {
        JobDetail detail = JobBuilder
                               .newJob(SendBirthdayEmail.class)
                               .withIdentity("job1", "group1")
                               .build();

        CronTrigger cronTrigger = TriggerBuilder
                                      .newTrigger()
                                      .withIdentity("myTrigger", "group1")
                                      .withSchedule(
                                          CronScheduleBuilder
                                              .cronSchedule("24 10 8 * * ? ")
                                      )
                                      .build();

        StdSchedulerFactory schedulerFactory = new StdSchedulerFactory();
        Scheduler scheduler = schedulerFactory.getScheduler();
        scheduler.start();

        scheduler.scheduleJob(detail, cronTrigger);

    }

}