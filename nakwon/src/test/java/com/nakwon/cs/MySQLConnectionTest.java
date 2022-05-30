package com.nakwon.cs;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String DRIVER="com.mysql.cj.jdbc.Driver"; //6.0ÀÌÇÏ¹öÀüÀº cj»©°í
	private static final String URL="jdbc:mysql://database-1.c99zbejrrplz.ap-northeast-2.rds.amazonaws.com:3306/nakwonDB?"
			+"serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER="admin";
	private static final String PW="Nakwon2022!";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL,USER,PW)){
			System.out.println("연결성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}