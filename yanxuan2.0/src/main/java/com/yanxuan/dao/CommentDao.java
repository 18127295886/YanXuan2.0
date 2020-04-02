package com.yanxuan.dao;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yanxuan.entity.Comment;
import com.yanxuan.mapper.CommentMapper;
import com.yanxuan.utils.SpringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @author weiwu
 * @description 评论类的dao
 * @date 2018/9/5 17:00
 */
public class CommentDao {

    /*
     * tag=查询的标签
     * 默认为全部查询（可以有按照该有图，追评、好评）
     *
     * orderBy=（0、1）
     * 当为0的时候，就是默认的排序方式
     * 当为1的时候，就是按照时间降序排序
     * */
    //itemId=商品编号&tag=查询的标签&size=每页的数量&page=当前页数&orderBy=（0、1）

    private ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
    CommentMapper commentMapper = context.getBean(CommentMapper.class);
    Logger logger = Logger.getLogger(this.getClass());

    //每一组的分页，为15条记录
    Integer PAGESIZE = 15;

    /**
     * 获得商品的分页评论，以list的形式返回
     *
     * @param goodId  商品的id
     * @param tag     查询分类的标签（全部、好评、有图、回复）
     * @param page    查询的评论页数
     * @param orderBy 查询排序的条件（0代表默认排序、1代表按照时间倒序查询）
     * @return 返回的是查询结果，list的形式
     */
    public List<Comment> getCommentList( Integer goodId, String tag, int page, int orderBy ) {

        EntityWrapper<Comment> wrapper = new EntityWrapper<>();

        //配置映射器的商品id
        wrapper.eq("goodId", goodId);

        //配置映射器的分类标签
        switch ( tag ) {
            case "全部":
                break;
            case "有图":
                wrapper.isNotNull("comPic");
                break;
            case "好评":
                //对于好评的定义，就是评论等级为5颗星
                wrapper.gt("comStar", 4);
                break;
            case "回复":
                wrapper.isNotNull("ComReply");
                break;
            default:
                break;
        }

        //配置映射器的排序
        if ( orderBy == 0 ) {
            //表示默认排序，无需按照时间排序，映射器对象无需修改
        } else if ( orderBy == 1 ) {
            //表示按照时间降序排序
            wrapper.orderBy("comDate", false);
        } else {
            logger.info("排序的参数有误！必须为1或者0，但是传入的参数为:" + orderBy);
        }

        List<Comment> comments = commentMapper.selectPage(new Page<Comment>(page, PAGESIZE), wrapper);
        return comments;
    }

    /**
     * 返回对应的评论类型的记录条数（评论页中评论种类中括号的数量就是这个方法查询出来的）
     *
     * @param goodId 商品的ID
     * @param tag    评论类型（全部、好评、有图、回复）
     * @return 对应评论类型的记录条数
     */
    public Integer getCountBytag( Integer goodId, String tag ) {
        EntityWrapper<Comment> wrapper = new EntityWrapper<>();

        //配置映射器的商品id
        wrapper.eq("goodId", goodId);

        //配置映射器的分类标签
        switch ( tag ) {
            case "全部":
                break;
            case "有图":
                wrapper.isNotNull("comPic");
                break;
            case "好评":
                wrapper.gt("comStar", 4);
                break;
            case "回复":
                wrapper.isNotNull("ComReply");
                break;
            default:
                break;
        }
        Integer count = commentMapper.selectCount(wrapper);
        return count;
    }

    /**
     * 插叙单个商品的评论总数
     *
     * @param goodId 商品的id
     * @return 返回评论的记录条数
     */
    public Integer getTotalcountByGoodId( Integer goodId ) {
        Integer count = commentMapper.selectCount(
            new EntityWrapper<Comment>()
                .eq("goodId", goodId)
        );
        return count;
    }

}
