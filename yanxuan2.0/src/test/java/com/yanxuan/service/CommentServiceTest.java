package com.yanxuan.service;

import com.yanxuan.entity.GoodInfo;
import org.junit.Test;

import java.util.Date;

public class CommentServiceTest {

    CommentService service = new CommentService();

    @Test
    public void getCommentAsJSON() {
        /*//data是一个json字符串，包含四个子json字符串
        JsonObject data = new JsonObject();

        JsonObject object = new JsonObject();
        object.addProperty("name", "weiwu");
        object.addProperty("name", "weiwu");
        object.addProperty("name", "weiwu");
        object.addProperty("name", "weiwu");

        JsonArray jsonArray = new JsonArray();
        jsonArray.add(object);
        jsonArray.add(object);
        jsonArray.add(object);
        jsonArray.add(object);

        data.add("data", jsonArray);

        String string = data.toString();
        System.out.println(string);*/

        String commentAsJSON = service.getCommentAsJSON(1672038, "全部", 2, 0);
        System.out.println(commentAsJSON);
    }

    @Test
    public void test01() {
        int a = 30;
        int b = 15;
        if ( a % b == 0 ) {
            System.out.println(a / b);
        } else {
            System.out.println(( a / b ) + 1);
        }
    }

    @Test
    public void test02() {
        GoodInfo goodInfo = new GoodInfo();
        goodInfo.setGoodId(1672038);

        GoodInfo goodInfo1 = goodInfo.selectById();
        System.out.println(goodInfo1);
    }

    @Test
    public void test03() {
        System.out.println((float)1 / 3 > 0.4 ? "真" : "假");
    }

    @Test
    public void test04() {
        String username = "威武会积极你最";
        String substring = username.substring(1, username.length() - 1);
        System.out.println(substring);
        String s = username.replaceAll(substring, "****");
        System.out.println(s);
        System.out.println(username);
    }

    @Test
    public void test05() {
        Date date = new Date();
        System.out.println(date.toLocaleString());
    }
}