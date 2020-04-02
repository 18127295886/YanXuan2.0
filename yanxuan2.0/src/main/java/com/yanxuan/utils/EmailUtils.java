package com.yanxuan.utils;

import com.yanxuan.entity.UserInfo;
import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Date;
import java.util.Properties;

public class EmailUtils {

    private static Logger logger = Logger.getLogger(EmailUtils.class);

    public static void sendEmail( String receiver, int activeCode )
        throws AddressException, MessagingException {
        // 发送者
        String from = "1163698309@qq.com";

        // 接收者
        String to = receiver;

        // 标题
        String subject = "网易严选官方";

        // 邮件主体内容
        // String body = "<a href='https://www.baidu.com' >你敢不敢点击一下我呀！</a>";
        String body = "<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n"
                          + "	<meta charset=\"UTF-8\">\r\n" + "	<style>\r\n"
                          + "	.main {\r\n" + "\r\n" + "		width: 800px;\r\n"
                          + "		height: 600px;\r\n" + "		margin: 10px auto;\r\n"
                          + "\r\n"
                          + "		background: #fdf0e8 url(\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535130579723&di=8018ba32f518822e0d35f0b4f158fc3e&imgtype=0&src=http%3A%2F%2Fxqimg.imedao.com%2F15d666a0606fc2c3fc073f60.jpg%2521custom.jpg\") no-repeat right bottom; \r\n"
                          + "		background-size: 35%;\r\n"
                          + "		text-align: center;\r\n" + "		padding: 10px;\r\n"
                          + "	}\r\n" + "	.code{\r\n" + "		font-size: 28px;\r\n"
                          + "		color: red;\r\n" + "\r\n" + "	}\r\n" + "</style>\r\n"
                          + "</head>\r\n" + "<body>\r\n" + "	<div class=\"main\">\r\n"
                          + "		<h1>欢迎你注册网易严选账号</h1>\r\n"
                          + "		<h4>你的注册码:&lt;10分钟有效&gt;</h4>\r\n"
                          + "		<span class=\"code\">" + activeCode + "</span>\r\n" + "\r\n"
                          + "	</div>\r\n" + "</body>\r\n" + "</html>";

        // 邮件服务器的类型
        String smtpHost = "smtp.qq.com";// smtp.qq.com/smtp.sohu.com

        // 设置相关的属性
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", smtpHost); // 发件人的邮箱的 SMTP服务器地址
        props.setProperty("mail.smtp.auth", "true"); // 请求认证，参数名称与具体实现有关

        // 创建Session实例对象
        Session session = Session.getDefaultInstance(props);

        // 创建MimeMessage实例对象
        MimeMessage message = new MimeMessage(session);

        // 设置发件人
        message.setFrom(new InternetAddress(from));

        // 设置收件人
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

        // 设置发送日期
        message.setSentDate(new Date());

        // 设置邮件主题
        message.setSubject(subject);

        // 设置纯文本内容的邮件正文
        // message.setText(body);

        // 设置发送的邮件的内容为html的格式
        Multipart multipart = new MimeMultipart();
        BodyPart html = new MimeBodyPart();
        html.setContent(body, "text/html;charset=utf-8");
        multipart.addBodyPart(html);
        message.setContent(multipart);

        // 保存并生成最终的邮件内容
        message.saveChanges();
        // 设置为debug模式, 可以查看详细的发送 log
        session.setDebug(true);
        // 获取Transport对象
        Transport transport = session.getTransport("smtp");
        // 第2个参数需要填写的是QQ邮箱的SMTP的授权码，什么是授权码，它又是如何设置？
        transport.connect(from, "osotlyzlohonifib");
        // 发送，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }

    public static void sendBirthdayEmail( UserInfo userInfo ) {
        try {

            System.out.println("即将发送邮件的地址:" + userInfo.getUserMail());
            // 发送者
            String from = "1163698309@qq.com";

            // 接收者
            String to = userInfo.getUserMail();

            // 标题
            String subject = "网易严选官方";

            // 邮件主体内容
            String body = "<!DOCTYPE html>\n" +
                              "<html>\n" +
                              "\t<head>\n" +
                              "\t\t<meta charset=\"utf-8\" />\n" +
                              "\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
                              "\t\t<title></title>\n" +
                              "\t</head>\n" +
                              "\t<body style=\"background-color: beige;width: 1024px;margin:45px auto;\">\n" +
                              "\t\t<h1 >" + userInfo.getUserName() + ":</h1>\n" +
                              "\t\t<h3 style=\"color: firebrick;\">网易严选祝你:生日快乐！！！</h3>\n" +
                              "\t\t<hr >\n" +
                              "\t\t<div id=\"main\"  style=\"margin: 10px auto;width: 1024px;\">\n" +
                              "\t\t\t<img src=\"https://i.loli.net/2018/09/09/5b94b67cb9694.jpg\" >\n" +
                              "\t\t</div>\n" +
                              "\t\t\n" +
                              "\t</body>\n" +
                              "</html>";

            // 邮件服务器的类型
            String smtpHost = "smtp.qq.com";

            // 设置相关的属性
            Properties props = new Properties();
            props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
            props.setProperty("mail.smtp.host", smtpHost); // 发件人的邮箱的 SMTP服务器地址
            props.setProperty("mail.smtp.auth", "true"); // 请求认证，参数名称与具体实现有关

            // 创建Session实例对象
            Session session = Session.getDefaultInstance(props);

            // 创建MimeMessage实例对象
            MimeMessage message = new MimeMessage(session);

            // 设置发件人
            message.setFrom(new InternetAddress(from));

            // 设置收件人
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // 设置发送日期
            message.setSentDate(new Date());

            // 设置邮件主题
            message.setSubject(subject);

            // 设置发送的邮件的内容为html的格式
            Multipart multipart = new MimeMultipart();
            BodyPart html = new MimeBodyPart();
            html.setContent(body, "text/html;charset=utf-8");
            multipart.addBodyPart(html);
            message.setContent(multipart);

            // 保存并生成最终的邮件内容
            message.saveChanges();
            // 设置为debug模式, 可以查看详细的发送 log
            session.setDebug(true);
            // 获取Transport对象
            Transport transport = session.getTransport("smtp");
            // 第2个参数需要填写的是QQ邮箱的SMTP的授权码，什么是授权码，它又是如何设置？
            transport.connect(from, "osotlyzlohonifib");
            // 发送，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            logger.info("向" + userInfo.getUserName() + "发送了一份生日邮件！");
        } catch ( Exception e ) {
            System.out.println("发送邮件出错了！！！");
        }
    }

    // 获得随机的验证码（6位数字）
    public static int getActiveCode() {
        int activeCode = (int)( ( Math.random() * 9 + 1 ) * 100000 ); // 随机数生成验证码
        return activeCode;
    }
}
