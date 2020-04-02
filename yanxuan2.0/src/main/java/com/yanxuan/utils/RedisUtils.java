package com.yanxuan.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author weiwu
 * @description 封装提供redis数据库的方法
 * @date 2018/9/1 22:29
 */
public class RedisUtils {

    private static Jedis jedis = null;

    /**
     * 从redis连接池中，返回redis连接
     *
     * @return
     */
    public static Jedis getJedis() {
        if ( jedis == null ) {
            jedis = initJedis();
        }
        return jedis;
    }

    /**
     * 获得redis的连接对象
     *
     * @return
     */
    private static Jedis initJedis() {

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

}
