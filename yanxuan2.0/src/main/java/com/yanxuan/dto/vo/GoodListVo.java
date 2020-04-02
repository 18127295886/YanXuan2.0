package com.yanxuan.dto.vo;

import com.google.gson.Gson;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;

import java.util.*;

/**
 * @author weiwu
 * @description 商品商品展示的vo
 * @date 2018/8/30 11:37
 */
public class GoodListVo {
	//种类类表
    List<GoodTypeInfo> smallTypes = new LinkedList<>();
    //查询选项
    List<String> rankFuns = new LinkedList<>();
    //商品map
    HashMap<GoodTypeInfo, List<GoodSimpleItem>> simGoodList = new LinkedHashMap<>();

    /**
     * 在构造器的执行的时候，就初始化对象中的相关属性
     *
     * @param hashMap
     */
    public GoodListVo( HashMap<GoodTypeInfo, List<GoodInfo>> hashMap ) {
        this.init(hashMap);
    }

    /**
     * 全局初始化方法
     *
     * @param hashMap
     */
    private void init( HashMap<GoodTypeInfo, List<GoodInfo>> hashMap ) {
        initSmallTypes(hashMap);
        initRankFuns(hashMap);
        initSimGoodList(hashMap);
    }

    /**
     * 将数据库中获得的商品信息，转换为简单的信息，用于界面展示
     *
     * @param hashMap
     */
    private void initSimGoodList( HashMap<GoodTypeInfo, List<GoodInfo>> hashMap ) {
        Set<GoodTypeInfo> goodTypeInfos = hashMap.keySet();
        Iterator<GoodTypeInfo> iterator = goodTypeInfos.iterator();
        while ( iterator.hasNext() ) {
            GoodTypeInfo next = iterator.next();
            List<GoodInfo> goodInfos = hashMap.get(next);
            
            LinkedList<GoodSimpleItem> goodSimpleItems = new LinkedList<>();
            
            GoodInfoToGoodSimpleItem(goodInfos, goodSimpleItems);

            simGoodList.put(next, goodSimpleItems);
        }
    }

    /**
     * @param goodInfos
     * @param goodSimpleItems
     */
    public void GoodInfoToGoodSimpleItem( List<GoodInfo> goodInfos, LinkedList<GoodSimpleItem> goodSimpleItems ) {
        Iterator<GoodInfo> iterator = goodInfos.iterator();
        Gson gson = new Gson();
        while ( iterator.hasNext() ) {
            GoodInfo goodInfo = iterator.next();
            GoodSimpleItem gSI = new GoodSimpleItem();
            gSI.setGoodId(goodInfo.getGoodId());
            gSI.setGoodName(goodInfo.getGoodName());
            gSI.setGoodDesc(goodInfo.getGoodDesc());
            gSI.setGoodPrice(goodInfo.getGoodPrice());
            gSI.setGoodTag(goodInfo.getGoodTag());

            //            System.out.println(goodInfo.getGoodPic());
            String goodPic = goodInfo.getGoodPic();
            PicList picList = gson.fromJson(goodPic, PicList.class);

            String[] picList1 = picList.getPicList();
            //            for ( String s : picList1 ) {
            //                System.out.println(s);
            //            }

            String primaryImgUrl = picList1[0];
            gSI.setGoodPic(primaryImgUrl);

            //System.out.println("第一张图片的路径:" + primaryImgUrl);

            goodSimpleItems.add(gSI);
        }
    }

    /**
     * 初始化页面中的的排序选项
     *
     * @param hashMap
     */
    private void initRankFuns( HashMap<GoodTypeInfo, List<GoodInfo>> hashMap ) {
        List<String> list = Arrays.asList("价格", "销量");
        rankFuns.addAll(list);
    }

    /**
     * 初始化种类类表
     *
     * @param hashMap
     */
    private void initSmallTypes( HashMap<GoodTypeInfo, List<GoodInfo>> hashMap ) {
//        GoodTypeInfo goodTypeInfo = new GoodTypeInfo();
//        smallTypes.add(goodTypeInfo);
    	
        hashMap.forEach(( e, v ) -> {
            smallTypes.add(e);
        });
    }

    public List<GoodTypeInfo> getSmallTypes() {
        return smallTypes;
    }

    public void setSmallTypes( List<GoodTypeInfo> smallTypes ) {
        this.smallTypes = smallTypes;
    }

    public List<String> getRankFuns() {
        return rankFuns;
    }

    public void setRankFuns( List<String> rankFuns ) {
        this.rankFuns = rankFuns;
    }

    public HashMap<GoodTypeInfo, List<GoodSimpleItem>> getSimGoodList() {
        return simGoodList;
    }

    public void setSimGoodList( HashMap<GoodTypeInfo, List<GoodSimpleItem>> simGoodList ) {
        this.simGoodList = simGoodList;
    }
}

class PicList {
    String[] PicList;

    public String[] getPicList() {
        return PicList;
    }

    public void setPicList( String[] picList ) {
        PicList = picList;
    }
}
