package com.db;

import java.sql.*;


public class dbConnection {
	
	 Statement stmt;
	 Connection con;
	
	 
	 public dbConnection()
	 { try {
		 Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
			//step2 create  the connection object  
			con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","marine","7728");  
			  
			//step3 create the statement object  
			stmt=con.createStatement();  
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
		 
	 }

	 public UserInfo getInformation(int userid)
	 {UserInfo info = null;
		 try {
		 ResultSet rs=stmt.executeQuery("select * from users where userid ="+userid);  
			while(rs.next())  
			info = new UserInfo(rs.getInt(1),rs.getString(2),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
					,rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(4));
			
			  
			//step5 close the connection object  
			  
			  
			}catch(Exception e){ System.out.println(e);} 
		 return info;
	 }
	

}





