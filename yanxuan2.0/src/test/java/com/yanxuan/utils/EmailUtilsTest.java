package com.yanxuan.utils;

import org.junit.Test;

import javax.mail.MessagingException;

public class EmailUtilsTest {

    @Test
    public void sendEmail() throws MessagingException {
        int activeCode = EmailUtils.getActiveCode();
        EmailUtils.sendEmail("979989013@qq.com", activeCode);
    }
}