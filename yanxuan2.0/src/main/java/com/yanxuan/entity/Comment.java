package com.yanxuan.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author weiwu
 * @since 2018-08-28
 */
@TableName ( "Comment" )
public class Comment extends Model<Comment> {

    private static final long serialVersionUID = 1L;

    @TableId ( value = "comId", type = IdType.AUTO )
    private Integer comId;
    private Integer userId;
    private Integer goodId;
    private Integer comStar;
    private String content;
    private String comPic;
    private Date comDate;
    private String ComReply;

    public Integer getComId() {
        return comId;
    }

    public void setComId( Integer comId ) {
        this.comId = comId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId( Integer userId ) {
        this.userId = userId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId( Integer goodId ) {
        this.goodId = goodId;
    }

    public Integer getComStar() {
        return comStar;
    }

    public void setComStar( Integer comStar ) {
        this.comStar = comStar;
    }

    public String getContent() {
        return content;
    }

    public void setContent( String content ) {
        this.content = content;
    }

    public String getComPic() {
        return comPic;
    }

    public void setComPic( String comPic ) {
        this.comPic = comPic;
    }

    public Date getComDate() {
        return comDate;
    }

    public void setComDate( Date comDate ) {
        this.comDate = comDate;
    }

    public String getComReply() {
        return ComReply;
    }

    public void setComReply( String ComReply ) {
        this.ComReply = ComReply;
    }

    @Override
    protected Serializable pkVal() {
        return this.comId;
    }

    @Override
    public String toString() {
        return "Comment{" +
                   ", comId=" + comId +
                   ", userId=" + userId +
                   ", goodId=" + goodId +
                   ", comStar=" + comStar +
                   ", content=" + content +
                   ", comPic=" + comPic +
                   ", comDate=" + comDate +
                   ", ComReply=" + ComReply +
                   "}";
    }
}
