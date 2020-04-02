package com.yanxuan.dao;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.google.gson.Gson;
import com.yanxuan.dto.po.ShopCartIGoodtem;
import com.yanxuan.dto.po.ShoppingCart;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.utils.RedisUtils;
import com.yanxuan.utils.SpringUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedList;

/**
 * @author weiwu
 * @description 用于操作购物车的dao
 * @date 2018/9/1 22:37
 */
public class ShoppingCartDao {

    //获得redis的数据库连接
    private Jedis jedis = RedisUtils.getJedis();

    ClassPathXmlApplicationContext context = SpringUtils.getAppContext();
    GoodInfoMapper mapper = context.getBean(GoodInfoMapper.class);

    //初始化购物车对象
    ShoppingCart shoppingCart = null;

    /**
     * 设置转换二进制字符串的模式（关键:购物车类的字节码）
     * 不同的转换模式主要就是参数类型不同
     * <p>
     * 作用：用于pojo的序列化和反序列化
     */
    RuntimeSchema<ShoppingCart> schema = RuntimeSchema.createFrom(ShoppingCart.class);

    /**
     * 根据用户的id，判断redis数据库中是否已经保存该用户的购物车对象
     *
     * @param userId
     * @return
     */
    public boolean ifShoppingCartExits( Integer userId ) {
        //参数：用户的id，作为redis数据库中的key值（不同用户的购物车对象的key值各不一样，因为用户id是惟一的）
        String jedisKey = userId + "";
        //从redis数据库中获得对应用户的购物车（序列化数组）
        byte[] bytes = jedis.get(jedisKey.getBytes());

        /*
         * 将获得的序列化数组对象转为字符串
         * 1、如果用户的用户的购物车对象不存在，该字符串为"null"
         * 2、如果用户的用户购物车对象存在，该字符串就不是"null"
         * */
        String s = Arrays.toString(bytes);

        if ( s.equals("null") ) {
            return false;
        } else {
            return true;

        }
    }

    /**
     * 只有用户的购物车不存在的时候，才进行初始化购物车（也就是用户第一次将商品加入到购物车的时候执行）
     * 同时将购物车对象保存在redis数据库中
     *
     * @param userId
     * @return
     */
    public void initShopCart( Integer userId ) {
        //获得购物车对象
        shoppingCart = new ShoppingCart();
        //（用于测试:）获得购物车中的map集合对象，对象不为空，但是并没有保存数据
        LinkedHashMap<String, ShopCartIGoodtem> map = shoppingCart.getMap();

        //将购物车对象序列化为二进制数组，用于保存在redis中
        byte[] shoppingCartBytes = ProtostuffIOUtil.toByteArray(shoppingCart, schema,
            LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));

        //用户id也需要转化为二进制数组
        String jedisKey = userId + "";
        byte[] jedisKeyBytes = jedisKey.getBytes();

        //在redis数据中保存初始化的用户购物车对象
        jedis.set(jedisKeyBytes, shoppingCartBytes);
    }

    /**
     * 根据用户的id,获得对应的购物车
     *
     * @param userId
     * @return
     */
    public ShoppingCart getShopCart( Integer userId ) {

        //首先判断用户的购物车是否存在
        boolean isExits = ifShoppingCartExits(userId);

        if ( isExits == false ) {
            //用户购物车不存在的时候，先初始化该购物车（同时保存在redis中）
            initShopCart(userId);
        }

        //userId对应的redis数据库中的key
        byte[] jedisKeyBytes = ( userId + "" ).getBytes();

        //获得用户购物车的序列化数组
        byte[] bytes = jedis.get(jedisKeyBytes);

        ShoppingCart shoppingCart = schema.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes, shoppingCart, schema);
        return shoppingCart;
    }

    /**
     * 用于更新用户在数据库中的购物车对象
     *
     * @param userId
     * @param shoppingCart
     */
    private void updataShopCart( Integer userId, ShoppingCart shoppingCart ) {

        if ( shoppingCart == null ) {
            System.out.println("shoppingCart为空！！！");
        }

        byte[] value = ProtostuffIOUtil.toByteArray(shoppingCart, schema, LinkedBuffer.allocate
                                                                                           (LinkedBuffer.DEFAULT_BUFFER_SIZE));
        byte[] key = ( userId + "" ).getBytes();

        /*
         * 将修改过后的购物车对象更新在redis数据库中
         * */
        jedis.set(key, value);
    }

    /**
     * 添加商品到购物车中
     *
     * @param userId   用户的id
     * @param goodId   商品的id
     * @param count    加入购物车的数量
     * @param goodSpec 加入购物车的商品规格
     */
    public void addGoodToShopCart( Integer userId, Integer goodId, int count, String goodSpec ) {
        //获得用户特定的购物车对象
        ShoppingCart shopCart = this.getShopCart(userId);

        //获得购物车中的map集合（key为商品id,value商品封装类ShopCartIGoodtem）
        LinkedHashMap<String, ShopCartIGoodtem> map = shopCart.getMap();

        ShopCartIGoodtem shopCartIGoodtem = map.get(goodId + "");
        if ( shopCartIGoodtem == null ) {
            //说明商品不存在，创建商品，同时设置数量为1，
            /*
             * 添加没有存在的商品进入购物车的步骤:
             * 1、通过商品id查询指定的商品，
             * 2、将商品对象转化购物车中的封装对象
             * 3、将获得的购物车封装对象加入到购物车的集合中，
             * 4、修改过后的购物车对象那个保存在redis中
             * */
            //1、获得对应的商品信息
            GoodInfo goodInfo = mapper.selectById(goodId);
            //2、将商品对象转化购物车中的封装对象
            ShopCartIGoodtem cartIGoodtem = new ShopCartIGoodtem();
            goodInfoTOShopCartIGoodtem(goodInfo, cartIGoodtem);
            cartIGoodtem.setCount(count);
            cartIGoodtem.setGoodSpec(goodSpec);

            //3、将获得的购物车封装对象加入到购物车的集合中
            shopCart.getMap().put(goodId + "", cartIGoodtem);

            //4、修改过后的购物车对象那个保存在redis中
            updataShopCart(userId, shopCart);
            System.out.println("购物车中添加了新的商品");
        } else {
            //说明商品存在的时候，直接修改商品的数量
            /*
             * 步骤：
             * 1、获得购物车中的集合，以及对应的商品键值对
             * 2、修改这一个商品的数量
             * 3、将更新之后的购物车保存在redis中
             * */
            //1、获得购物车中的集合，以及对应的商品键值对
            ShopCartIGoodtem cartIGoodtem = shopCart.getMap().get(goodId + "");
            //2、修改这个商品的数量
            cartIGoodtem.setCount(count);
            //3、更新购物车、保存在数据库中
            shopCart.getMap().put(goodId + "", cartIGoodtem);
            updataShopCart(userId, shopCart);
            System.out.println("购物车修改了商品的数量:" + count);
        }
    }

    private void goodInfoTOShopCartIGoodtem( GoodInfo goodInfo, ShopCartIGoodtem cartIGoodtem ) {
        cartIGoodtem.setGoodId(goodInfo.getGoodId());
        cartIGoodtem.setGoodName(goodInfo.getGoodName());
        cartIGoodtem.setGoodDesc(goodInfo.getGoodDesc());
        cartIGoodtem.setGoodPrice(goodInfo.getGoodPrice());
        cartIGoodtem.setGoodTag(goodInfo.getGoodTag());
        //        cartIGoodtem.setGoodSpec(goodInfo.getGoodSpec());

        String goodPic = goodInfo.getGoodPic();

        PicList1 picList11 = new Gson().fromJson(goodPic, PicList1.class);

        String[] picList1 = picList11.getPicList();
        //            for ( String s : picList1 ) {
        //                System.out.println(s);
        //            }

        String primaryImgUrl = picList1[0];

        cartIGoodtem.setGoodPic(primaryImgUrl);
    }

    public void delGoodFromShopCart( Integer userId, Integer... goodIds ) {
        ShoppingCart shopCart = getShopCart(userId);
        LinkedHashMap<String, ShopCartIGoodtem> map = shopCart.getMap();

        for ( Integer goodId : goodIds ) {
            map.remove(goodId + "");
        }
        shopCart.setMap(map);

        updataShopCart(userId, shopCart);

    }

    public LinkedList<ShopCartIGoodtem> getShoppingCartAsList( Integer userId ) {
        ShoppingCart shopCart = getShopCart(userId);
        LinkedHashMap<String, ShopCartIGoodtem> map = shopCart.getMap();
        LinkedList<ShopCartIGoodtem> list = new LinkedList<ShopCartIGoodtem>();
        map.forEach(( k, v ) -> {
            list.add(v);
        });

        return list;
    }
}

class PicList1 {
    String[] PicList;

    public String[] getPicList() {
        return PicList;
    }

    public void setPicList( String[] picList ) {
        PicList = picList;
    }
}
