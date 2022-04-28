package com.nakwon.cs;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String DRIVER="com.mysql.cj.jdbc.Driver"; //6.0ÀÌÇÏ¹öÀüÀº cj»©°í
	private static final String URL="jdbc:mysql://54.180.108.229:3306/nakwonDB?"
			+"serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER="user";
	private static final String PW="Nakwon2022!";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL,USER,PW)){
			System.out.println(con);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}