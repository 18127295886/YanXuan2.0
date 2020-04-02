package com.yanxuan.dao;

import com.google.gson.Gson;

/**
 * @author weiwu
 * @description 用于测试gson
 * @date 2018/8/30 13:21
 */
public class TestGson {

    public static void main( String[] args ) {
        String jsonStr = "{'PicList':['http://yanxuan" +
                             ".nosdn.127.net/4480c25b6d22f2eedb2db0bff9c8f7a4.png'," +
                             "'http://yanxuan.nosdn.127.net/375db2797db92b446d45b3003ca84660.jpg','http://yanxuan.nosdn.127.net/9d2c517b9da985b9c997f6d9cb597ac0.jpg','http://yanxuan.nosdn.127.net/6eb39c3ee3db8d9a6a2cbf3d2d2f581c.jpg','http://yanxuan.nosdn.127.net/5e230a93445d2791719f9421a66113e3.jpg']}";
        //List<String> strings = new LinkedList<>();
        //picLis picLis = gson.fromJson(jsonStr, picLis.class);
        //System.out.println(picLis.getPicList().length);

        String[] strings = {"wiwi", "dede", "heihei", "wuwu"};
        picLis picLis = new picLis();
        picLis.setPicList(strings);

        String s = new Gson().toJson(picLis);
        System.out.println(s);

        com.yanxuan.dao.picLis picLis1 = new Gson().fromJson(s, com.yanxuan.dao.picLis.class);
        int length = picLis1.getPicList().length;
        System.out.println(length);

        com.yanxuan.dao.picLis picLis2 = new Gson().fromJson(jsonStr, com.yanxuan.dao.picLis.class);
        System.out.println(picLis2.getPicList().length);
        for ( int i = 0; i < picLis2.getPicList().length; i++ ) {
            System.out.println(picLis2.getPicList()[i]);
        }

    }

}

class picLis {
    String[] PicList;

    public String[] getPicList() {
        return PicList;
    }

    public void setPicList( String[] picList ) {
        PicList = picList;
    }
}
