package com.db;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Comparator;

public class dbConnection {
	
	
	 Connection con;
	
	 
	 public dbConnection()
	 { try {
		 Class.forName("oracle.jdbc.driver.OracleDriver");  
		  
			//step2 create  the connection object  
			con=DriverManager.getConnection(  
			"jdbc:oracle:thin:@localhost:1521:xe","marine","7728");  
			  
			//step3 create the statement object  
			
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
		 
	 }

	 public UserInfo getInformation(int userid)
	 {UserInfo info = null;
		 try {
			 PreparedStatement ps=con.prepareStatement("select * from users where userid=?");
			 ps.setString(1,""+userid);
		     ResultSet rs=ps.executeQuery();  
			while(rs.next())  
			info = new UserInfo(rs.getInt(1),rs.getString(2),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
					,rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(4));
			
			
			
			//step5 close the connection object  
			  
			  
			}catch(Exception e){ System.out.println("abx");} 
		 return info;
	 }
	 
	 public void insertIntoPost(int userid,String desc,String url)
	 {
		 
		 try {
			PreparedStatement ps=con.prepareStatement("insert into posts values(seqposts.nextval,?,?,?,?,CURRENT_TIMESTAMP)");
			ps.setInt(1, userid);
			ps.setString(2, desc);
			ps.setString(3, url);
			ps.setString(4, null);
			
			int i=ps.executeUpdate();  
			System.out.println(i+" records inserted"); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.print(e);
		}
	 }
	 
	 public ArrayList<post> getPost(int userid)
	 {
		 ArrayList<Integer> friends = new ArrayList();
		 ArrayList<post> posts = new ArrayList();
		 try {
			PreparedStatement ps=con.prepareStatement("Select friend from friendlist where userid=?");
			ps.setInt(1, userid);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next())
				friends.add(rs.getInt(1));
			ps=con.prepareStatement("Select userid from friendlist where friend=?");
			ps.setInt(1, userid);
			rs=ps.executeQuery(); 
			while(rs.next())
				friends.add(rs.getInt(1));
			friends.add(userid);
			System.out.println(friends);
			
			for(int friend:friends)
			{
				ps=con.prepareStatement("Select pid,userid,description,posturl from posts where userid=?");
				ps.setInt(1, friend);
				rs = ps.executeQuery();
				while(rs.next())
				{
				  post post =new post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
				  posts.add(post);
				}
			}
			
			Collections.sort(posts,new Comparator<post>()
					{

						@Override
						public int compare(post o1, post o2) {
							// TODO Auto-generated method stub
							return Integer.valueOf(o1.getPid()).compareTo(o2.getPid());
						}
				
					});
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return null;
		 
	 }

	 
	 
	 public static void main(String[] args) {
		dbConnection db = new dbConnection();
		
	}
	

}





