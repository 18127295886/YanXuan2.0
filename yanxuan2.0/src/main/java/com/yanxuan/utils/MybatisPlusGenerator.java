package com.yanxuan.utils;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class MybatisPlusGenerator {

	public static void main(String[] args) {
		// 1、全局配置
		GlobalConfig config = new GlobalConfig();
		config.setActiveRecord(true) // 是否开启AR模式
				.setAuthor("weiwu") // 设置作者
				.setOutputDir("F:/JavaWorkSpace/yanxuan/strict_selection_of_netease/Yanxuan/src/main/java") // 设置生成路径
				.setFileOverride(true) // 开启文件覆盖
				.setIdType(IdType.AUTO);// 主键策略

		// 2、数据源配置
		DataSourceConfig dsConfig = new DataSourceConfig();
		dsConfig.setDbType(DbType.MYSQL)
				.setUrl("jdbc:mysql://39.108.220.221:3306/yanxuan?useSSL=false")
				.setDriverName("com.mysql.jdbc.Driver").setUsername("root")
				.setPassword("Aa066323"); 

		String[] tabs = { "Address", "Collected", "Comment", "Footprint", "GoodInfo", "GoodTypeInfo",
				"HotGoodInfo", "OrderInfo", "UserInfo" };

		// 3、策略配置
		StrategyConfig stConfig = new StrategyConfig();
		stConfig.setCapitalMode(true)// 全局大写命名
				// .setDbColumnUnderline(true)// 表名 字段名 是否使用下划线命名
				.setNaming(NamingStrategy.underline_to_camel)// 数据库表映射到实体的命名策略
				.setInclude(tabs); // 需要生成的表
		// .setTablePrefix("tbl_"); // 表的前缀

		// 4、包名配置
		PackageConfig packageConfig = new PackageConfig();
		packageConfig.setParent("com.yanxuan")
				// .setController("controller")
				.setEntity("entity").setMapper("mapper");
		// .setService("service")
		// .setServiceImpl("service.impl");

		new AutoGenerator().setGlobalConfig(config).setDataSource(dsConfig).setStrategy(stConfig)
				.setPackageInfo(packageConfig).execute();

	}

}
