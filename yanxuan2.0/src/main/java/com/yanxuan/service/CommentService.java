package com.yanxuan.service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yanxuan.dao.CommentDao;
import com.yanxuan.entity.Comment;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.UserInfo;

import java.util.Date;
import java.util.List;

/**
 * @author weiwu
 * @description 用于处理评论信息的service
 * @date 2018/9/5 20:47
 */
public class CommentService {

    CommentDao commentDao = new CommentDao();

    /**
     * 用于处理每一个商品的评论的ajax请求的业务逻辑，返回结果是以json封装的字符串信息，具体包含的信息如下:
     * "data": {
     * "pagaInfo": {
     * "page": 1,                      当前页数
     * "size": 15,                     每页的记录数（Dao层写成常量）
     * "totalPage": 14,                总的页数
     * "total": 274                    总记录条数
     * },
     * "goodInfos": {
     * "goodRate": "98.6%",
     * "star": 5,
     * "defGoodCmtCnt": 391
     * }
     * "tagInfos": [
     * {
     * "name": "全部",
     * "strCount": "记录条数"
     * }
     * ]
     * "commentInfos": [                        评论给详情列表（15条记录）
     * {
     * "userName": "x****4",  用户名
     * "userAvatar": null,    用户头像地址
     * "content": "评论给内容",
     * "createDate": 评论时间,
     * "comPic": [
     * "https://yanxuan.nosdn.127.net/d91eb831514f911359aedb8ed803350b.jpg"
     * ],
     * "comReply": "回复内容",
     * "comStar": 5                  评分等级
     * }
     * *******
     * ]
     * }
     *
     * @param goodId  商品的id
     * @param tag     查询分类的标签（全部、好评、有图、回复）
     * @param page    查询的评论页数
     * @param orderBy 查询排序的条件（0代表默认排序、1代表按照时间倒序查询）
     * @return 返回的是查询结果，list的形式
     */
    public String getCommentAsJSON( Integer goodId, String tag, int page, int orderBy ) {
        //data是一个json字符串，包含四个子json字符串
        JsonObject data = new JsonObject();

        //设置分页的记录条数(固定，15条)
        Integer size = 15;
        JsonObject pagaInfo = new JsonObject();
        //获得当前分类种类所有记录数
        Integer totalcountByTag = commentDao.getCountBytag(goodId, tag);
        Integer totalPage = null;
        if ( totalcountByTag % size == 0 ) {
            totalPage = totalcountByTag / size + 1;
        } else {
            totalPage = totalcountByTag / size + 2;

        }
        //当前商品的所有评论数
        Integer total = commentDao.getTotalcountByGoodId(goodId);
        pagaInfo.addProperty("curpage", page);
        pagaInfo.addProperty("size", 15);
        pagaInfo.addProperty("totalPage", totalPage);
        pagaInfo.addProperty("total", total);

        data.add("pagaInfo", pagaInfo);

        JsonObject goodInfos = new JsonObject();

        GoodInfo goodInfoTem = new GoodInfo();
        goodInfoTem.setGoodId(goodId);
        GoodInfo goodInfo = goodInfoTem.selectById();
        String goodRate = goodInfo.getGoodRate();       //获得好评率
        //获得该商品的好评数量
        Integer goodCom = commentDao.getCountBytag(goodId, "好评");

        //计算获得星星等级，好评率(0.9~1为5星,0.75~0.9为4星,0.6~0.75为3星,0.3~6为2星,0~0.3为1星)
        Integer star = null;
        float rate = (float)goodCom / total;
        if ( rate >= 0.8 ) {
            star = 5;
        } else if ( rate >= 0.75 ) {
            star = 4;
        } else if ( rate >= 0.6 ) {
            star = 3;
        } else if ( rate >= 0.3 ) {
            star = 2;
        } else {
            star = 4;
        }
        //        System.out.println("rate:"+rate);

        goodInfos.addProperty("goodRate", goodRate);          //设置好评率(固定)
        goodInfos.addProperty("star", star);                  //设置星星等级
        goodInfos.addProperty("goodCom", goodCom);            //设置好评数量

        data.add("goodInfos", goodInfos);

        JsonArray tagInfos = new JsonArray();
        JsonObject jsonObject1 = new JsonObject();
        String tag1 = "全部";
        Integer countBytag1 = commentDao.getCountBytag(goodId, tag1);
        jsonObject1.addProperty("name", tag1);
        jsonObject1.addProperty("count", countBytag1);
        tagInfos.add(jsonObject1);

        JsonObject jsonObject2 = new JsonObject();
        String tag2 = "好评";
        Integer countBytag2 = commentDao.getCountBytag(goodId, tag2);
        jsonObject2.addProperty("name", tag2);
        jsonObject2.addProperty("count", countBytag2);
        tagInfos.add(jsonObject2);

        JsonObject jsonObject3 = new JsonObject();
        String tag3 = "有图";
        Integer countBytag3 = commentDao.getCountBytag(goodId, tag3);
        jsonObject3.addProperty("name", tag3);
        jsonObject3.addProperty("count", countBytag3);
        tagInfos.add(jsonObject3);

        JsonObject jsonObject4 = new JsonObject();
        String tag4 = "回复";
        Integer countBytag4 = commentDao.getCountBytag(goodId, tag4);
        jsonObject4.addProperty("name", tag4);
        jsonObject4.addProperty("count", countBytag4);
        tagInfos.add(jsonObject4);

        data.add("tagInfos", tagInfos);

        JsonArray commentInfos = new JsonArray();
        List<Comment> commentList = commentDao.getCommentList(goodId, tag, page, orderBy);
        for ( Comment comment : commentList ) {
            /*
            "userName": "x****4",
            "userAvatar": null,
            "content": "评论给内容",
            "createDate": 评论时间,
            "comPic": [
                "https://yanxuan.n
            ],
            "comReply": "回复内容",
            "comStar": 5
            */

            UserInfo userInfoTem = new UserInfo();
            UserInfo userInfo = userInfoTem.selectById(comment.getUserId());

            //获得用户名(用户名不会为null)
            String userNameTem = userInfo.getUserName();
            String substring = userNameTem.substring(1, userNameTem.length() - 1);
            //            String userName = userNameTem.replaceAll(substring, "******");
            String userName = userNameTem;

            //获得用户头像（用户头像可能为null或者为空字符串）
            String userAvatar = userInfo.getUserAvatar();
            if ( userAvatar == null || userAvatar.trim().length() == 0 ) {
                //当用户的头像为null或者为空字符串的时候，就采用网易严选的官方默认的头像
                userAvatar = "http://yanxuan.nosdn.127.net/485ff1be6912be6ae696b6d360d1b101.png";
            }
            //获得评论内容
            String content = comment.getContent();
            //获得评论时间
            Date comDate = comment.getComDate();

            //获得评论图片
            String comPic = comment.getComPic();
            Gson gson = new Gson();
            JsonArray jsonArray = new JsonArray();
            if ( comPic != null && comPic.trim().length() > 0 ) {
                ComPicS comPicS = gson.fromJson(comPic, ComPicS.class);
                String[] picList = comPicS.getPicList();
                //                System.out.println(picList.length);
                //                String s = gson.toJson(comPicS);
                //                System.out.println(s);
                for ( String s : picList ) {
                    jsonArray.add(s);

                }
            }

            //获得回复(可能为null、或者为空字符串)
            String comReply = comment.getComReply();
            if ( comReply == null || comReply.trim().length() == 0 ) {
                //【统一，当为空字符串的时候，转换为null】
                comReply = null;
            }

            //评论星星等级
            Integer comStar = comment.getComStar();

            JsonObject commentJSON = new JsonObject();
            commentJSON.addProperty("userName", userName);
            commentJSON.addProperty("userAvatar", userAvatar);
            commentJSON.addProperty("content", content);
            commentJSON.addProperty("comDate", comDate.toLocaleString());
            //            commentJSON.addProperty("comPic", comPic);
            if ( comPic != null ) {
                commentJSON.add("comPic", jsonArray);
            }
            commentJSON.addProperty("comReply", comReply);
            commentJSON.addProperty("comStar", comStar);

            commentInfos.add(commentJSON);

        }

        data.add("commentInfos", commentInfos);

        return data.toString();
    }

}

class ComPicS {
    String[] picList;

    public String[] getPicList() {
        return picList;
    }

    public void setPicList( String[] picList ) {
        this.picList = picList;
    }
}
