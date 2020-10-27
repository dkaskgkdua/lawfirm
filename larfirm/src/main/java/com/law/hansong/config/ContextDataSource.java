package com.law.hansong.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

// 데이터베이스 설정

@Configuration

// 어노테이션 기반 트랜잭션 관리를 사용합니다.
// <tx:annotation-driven>

@EnableTransactionManagement

public class ContextDataSource {

/**
 * 
 *  데이터 소스 등록
 *  @return
 *   
 */	
	
	   @Bean(destroyMethod = "close")

	   public DataSource dataSource() {

	      BasicDataSource dataSource = new BasicDataSource();

	      dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");

	      dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");

	      //dataSource.setUsername("scott");
	      dataSource.setUsername("mybatis");
	      //dataSource.setPassword("tiger");
	      dataSource.setPassword("mybatis");
	      dataSource.setDefaultAutoCommit(false);

	      return dataSource;

	   }

	   /**
	    * 
	    * 트랜잭션 매니저 등록
	    * 
	    * @return
	    * 
	    */

	   @Bean

	   public DataSourceTransactionManager transactionManager() {

	      return new DataSourceTransactionManager(dataSource());

	   }
 
	
	

}
