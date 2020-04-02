package com.yanxuan.dao;

import com.yanxuan.entity.Comment;
import org.junit.Test;

import java.util.List;

public class CommentDaoTest {

    CommentDao commentDao = new CommentDao();

    @Test
    public void getCommentList() {
        List<Comment> list = commentDao.getCommentList(1672038, "好评", 1, 0);
        list.forEach(System.out::println);
    }

    @Test
    public void testSwitch() {

        String test = "回复";
        switch ( test ) {
            case "全部":
                System.out.println("这里是全部");
                break;
            case "无图":
                System.out.println("无图");
                break;
            case "有图":
                System.out.println("有图");
                break;
            default:
                System.out.println("默认的出口");
                break;
        }

    }

    @Test
    public void getCountBytag() {
        String tag = "回复";
        Integer countBytag = commentDao.getCountBytag(1672038, tag);
        System.out.println(tag + "数量:" + countBytag);
    }

    @Test
    public void getTotalcountByGoodId() {
        Integer totalcount = commentDao.getTotalcountByGoodId(1672038);
        System.out.println(totalcount);
    }
}