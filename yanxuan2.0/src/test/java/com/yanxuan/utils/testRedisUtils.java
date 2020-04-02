package com.yanxuan.utils;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import org.junit.Test;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * @author weiwu
 * @description 用于测试redis
 * @date 2018/8/31 21:07
 */
public class testRedisUtils {

    /**
     * 获得redis的连接对象
     *
     * @return
     */
    private Jedis getJedis() {
        JedisPoolConfig config = new JedisPoolConfig();
        //控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
        //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
        config.setMaxTotal(50);
        //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
        config.setMaxIdle(5);
        //表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；单位毫秒
        //小于零:阻塞不确定的时间,  默认-1
        config.setMaxWaitMillis(1000 * 100);
        //在borrow(引入)一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
        config.setTestOnBorrow(true);
        //return 一个jedis实例给pool时，是否检查连接可用性（ping()）
        config.setTestOnReturn(true);
        //connectionTimeout 连接超时（默认2000ms）
        //soTimeout 响应超时（默认2000ms）

        JedisPool jedisPool = new JedisPool(config, "39.108.220.221", 6379, 2000, "Aa066323");
        Jedis jedis = jedisPool.getResource();
        return jedis;

    }

    /**
     * 测试redis的连接
     */
    @Test
    public void testDemo01() {

        //        if ( jedisPool == null ) {
        //            System.out.println("jedispool为空");
        //        } else {
        //            System.out.println("jedispool不为空");
        //        }

        Jedis jedis = getJedis();
        Long db = jedis.getDB();
        System.out.println(db);

        Set<String> keys = jedis.keys("*");
        keys.forEach(System.out::println);

        Long name = jedis.del("name");
        Set<String> keys2 = jedis.keys("*");
        keys2.forEach(System.out::println);

    }

    /**
     * 用于测试java的pojo保存在redis
     *
     * @throws UnsupportedEncodingException
     */
    @Test
    public void tersDemo02() throws UnsupportedEncodingException {
        Jedis jedis = getJedis();

        List<user> users = new ArrayList<>();
        users.add(new user("weiwu", 23, 1));
        users.add(new user("weiwu1", 23, 1));
        users.add(new user("weiwu2", 23, 1));
        users.add(new user("weiwu3", 23, 1));

        RuntimeSchema<user> from = RuntimeSchema.createFrom(user.class);

        user weiwu = new user("weiwu", 12, 2);
        byte[] bytes = ProtostuffIOUtil.toByteArray(weiwu, from, LinkedBuffer.allocate(LinkedBuffer
                                                                                           .DEFAULT_BUFFER_SIZE));

        jedis.set("users".getBytes(), bytes);

        byte[] bytes2 = jedis.get("users".getBytes());

        user user = from.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes2, user, from);
        System.out.println(user);

    }

    /**
     * 用于测试保存集合
     */
    @Test
    public void testDemo03() {
        Jedis jedis = getJedis();

        LinkedList<user> users = new LinkedList<>();
        users.add(new user("weiwu", 23, 1));
        users.add(new user("weiwu1", 23, 1));
        users.add(new user("weiwu2", 23, 1));
        users.add(new user("weiwu3", 23, 1));

        jh jh = new jh();
        jh.setUsers(users);

        RuntimeSchema<com.yanxuan.utils.jh> from = RuntimeSchema.createFrom(com.yanxuan.utils.jh.class);

        byte[] bytes = ProtostuffIOUtil.toByteArray(jh, from, LinkedBuffer.allocate(LinkedBuffer
                                                                                        .DEFAULT_BUFFER_SIZE));

        jedis.set("users".getBytes(), bytes);

        byte[] bytes2 = jedis.get("users".getBytes());

        com.yanxuan.utils.jh jh1 = from.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes2, jh1, from);

        int size = jh.getUsers().size();
        System.out.println(size);
        jh.getUsers().forEach(System.out::println);

        LinkedList<user> users1 = jh.getUsers();
        users1.get(1).setAge(40);
        com.yanxuan.utils.jh jh2 = new jh();
        jh2.setUsers(users1);

        byte[] bytes11 = ProtostuffIOUtil.toByteArray(jh2, from, LinkedBuffer.allocate(LinkedBuffer
                                                                                           .DEFAULT_BUFFER_SIZE));
        jedis.del("users".getBytes());
        jedis.set("users".getBytes(), bytes11);

        byte[] bytes21 = jedis.get("users".getBytes());

        jh2 = from.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes2, jh2, from);

        System.out.println();
        System.out.println();
        System.out.println();
        jh2.getUsers().forEach(System.out::println);

    }

    /**
     * 测试set命令
     */
    @Test
    public void testDemo04() {
        Jedis jedis = getJedis();

        //        jedis.set("weiwu", "weiwu");
        //        String s = jedis.get("weiwu");
        //        System.out.println("修改之前");
        //        System.out.println(s);
        //        jedis.set("weiwu", "wengweiwu");
        //        String s1 = jedis.get("weiwu");
        //        System.out.println("修改之后");
        //        System.out.println(s1);

        RuntimeSchema<user> schema = RuntimeSchema.createFrom(user.class);
        user user = new user("weibin", 122, 2);
        byte[] bytes = ProtostuffIOUtil.toByteArray(user, schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));

        jedis.set("user".getBytes(), bytes);

        byte[] bytes1 = jedis.get("user".getBytes());
        com.yanxuan.utils.user user2 = schema.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes1, user2, schema);
        System.out.print("从redis中获得对象:");
        System.out.println(user2);

        System.out.println("修改redis中获得的对象");
        user2.setAge(22);

        byte[] bytes2 = ProtostuffIOUtil.toByteArray(user2, schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
        jedis.set("user".getBytes(), bytes2);

        byte[] bytes3 = jedis.get("user".getBytes());
        com.yanxuan.utils.user user1 = schema.newMessage();
        ProtostuffIOUtil.mergeFrom(bytes3, user1, schema);
        System.out.println("从redis中获得修改之后的值:" + user1);
    }

    /**
     * 测试购物车
     */
    @Test
    public void getDemo05() {

        Jedis jedis = getJedis();

        //如果redis中没有保存的key（byte数组），返回的就是null
        byte[] bytes = jedis.get("cart".getBytes());
        String s = Arrays.toString(bytes);
        //        System.out.println(s);

        /*
         * 设置转换二进制字符串的模式（关键:购物车类gc的字节码）
         * 不同的转换模式主要就是参数类型不容
         * */
        RuntimeSchema<gc> schema = RuntimeSchema.createFrom(gc.class);

        if ( !s.equals("null") ) {
            //当前用户id在redsi中保存购物车的时候
            System.out.println("存在购物车对象！");
            /*
             * 如果redis存在指定的key的话，就获得对应的value值（购物车对象的二进制序列）
             * 将对应的value值（二进制数组）反序列化为对应的购物车对象
             * */
            byte[] gcBytes = jedis.get("cart".getBytes());


            //获得模式对应的对象引用，然后将二进制反序列为这个对象
            gc gc = schema.newMessage();
            ProtostuffIOUtil.mergeFrom(gcBytes, gc, schema);



            //获得购物车中的linkedHashMap对象,打印对象中内容
            LinkedHashMap<String, user> hashMap = gc.getHashMap();
            hashMap.forEach(( k, v ) -> {
                System.out.println(k);
                System.out.println(v);
            });


            /*当执行添加（减少）数量的时候，对map中的value进行修改，同时保存在原来的redis中*/

            user user = hashMap.get("weiwu");
            user.setCount(user.count + 1);

            //修改之后的hashMap对象（购物车对象中的属性）
            hashMap.put("weiwu", user);

            //将购物车对象中的hashMap对象赋值为修改（增、删）之后的hashMap对象
            gc.setHashMap(hashMap);

            //将修改过后的购物车对象进行序列化(赋值给原本的二进制数组)
            gcBytes = ProtostuffIOUtil.toByteArray(gc, schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));

            jedis.set("cart".getBytes(), gcBytes);
            System.out.println("购物车weiwu对应的数量增加了1！！！");

        } else {
            //当前用户id在redis中没有保存购物车的时候
            //System.out.println("不存在购物车！！！");
            gc gc = new gc();

            LinkedHashMap<String, user> gcMap = new LinkedHashMap<>();


            user user = new user("weiwu", 12, 2);


            gcMap.put(user.getName(), user);

            gc.setHashMap(gcMap);


            byte[] gcBytes = ProtostuffIOUtil.toByteArray(gc, schema, LinkedBuffer.allocate
                                                                                       (LinkedBuffer.DEFAULT_BUFFER_SIZE));

            jedis.set("cart".getBytes(), gcBytes);




            byte[] bytes1 = jedis.get("cart".getBytes());

            com.yanxuan.utils.gc message = schema.newMessage();
            ProtostuffIOUtil.mergeFrom(bytes1, message, schema);

            LinkedHashMap<String, com.yanxuan.utils.user> hashMap = message.getHashMap();

            hashMap.forEach(( k, v ) -> {
                System.out.print(k + "=====");
                System.out.println(v);
            });

        }
    }

    @Test
    public void testMap() {
        HashMap<String, String> map = new HashMap<>();
        String s = map.get("weiwu");
        if (s==null){
            System.out.println("为空");
        }else{
            System.out.println("不为空！！！");
        }
    }
}

class user {
    String name;
    int age;
    int count;

    public user() {
    }

    public user( String name, int age, int count ) {
        this.name = name;
        this.age = age;
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName( String name ) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge( int age ) {
        this.age = age;
    }

    public int getCount() {
        return count;
    }

    public void setCount( int count ) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "user{" +
                   "name='" + name + '\'' +
                   ", age=" + age +
                   ", count=" + count +
                   '}';
    }
}

class jh {
    LinkedList<user> users = new LinkedList<>();

    public LinkedList<user> getUsers() {
        return users;
    }

    public void setUsers( LinkedList<user> users ) {
        this.users = users;
    }
}

/**
 * 模拟购物车的类，里面是一个linkekHashmap的对象
 */
class gc {
    LinkedHashMap<String, user> hashMap = new LinkedHashMap<>();

    public LinkedHashMap<String, user> getHashMap() {
        return hashMap;
    }

    public void setHashMap( LinkedHashMap<String, user> hashMap ) {
        this.hashMap = hashMap;
    }
}


