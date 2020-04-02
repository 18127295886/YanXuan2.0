package com.yanxuan.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * @author weiwu
 * @date 2018年8月29日 上午10:43:59
 * @description
 */
public class SmsUtils {
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	/**
	 * 发送手机验证码
	 * 
	 * @param phoneNumber
	 *                手机号码
	 * @param activeCode
	 *                验证码
	 */
	public static void sendSms(String phoneNumber, int activeCode) {

		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=GBK");

		String content = new String("您的验证码是：" + activeCode + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = { new NameValuePair("account", "C21096387"), // 查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
				new NameValuePair("password", "cef6f723cb509239ddfa4669d01e50c3"), // 查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
				new NameValuePair("mobile", phoneNumber), // 要发送验证码的手机号
				new NameValuePair("content", content), };
		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();
			// System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);

			if ("2".equals(code)) {
				System.out.println("短信提交成功");
			}

		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
