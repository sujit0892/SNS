package com.db;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Comparator;

public class dbConnection {
	
	
	 Connection con;
	
	 ResultSet rs ;
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
		   rs=ps.executeQuery();  
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
			 rs=ps.executeQuery(); 
			while(rs.next())
				friends.add(rs.getInt(1));
			ps=con.prepareStatement("Select userid from friendlist where friend=?");
			ps.setInt(1, userid);
			rs=ps.executeQuery(); 
			while(rs.next())
				friends.add(rs.getInt(1));
			friends.add(userid);
			
			
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
							return Integer.valueOf(o2.getPid()).compareTo(o1.getPid());
						}
				
					});
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return posts;
		 
	 }

	 public static void main(String[] args) {
		dbConnection db = new dbConnection();
		
	   
		
	}
	 
	 public TreeMap<Integer,Integer> getRecentMsg(int userid)
	 {    TreeMap<Integer,Integer> map = new TreeMap(Collections.reverseOrder());
		ArrayList<Integer> set = new ArrayList();
		 try {
			PreparedStatement ps=con.prepareStatement("Select distinct(rid) from message  where sid=?");
			ps.setInt(1, userid);
			rs= ps.executeQuery();
			while(rs.next())
				set.add(rs.getInt(1));
			
			ps=con.prepareStatement("Select distinct(sid) from message where rid=? ");
			ps.setInt(1, userid);
			rs= ps.executeQuery();
			while(rs.next())
				set.add(rs.getInt(1));
		   
		   TreeSet<Integer> set1 = new TreeSet(set);
		   for(int id:set1)
		   {
			   ps=con.prepareStatement("Select max(mid) from message where rid=? or sid =? ");
				ps.setInt(1, id);
				ps.setInt(2,id);
				rs= ps.executeQuery();
				while(rs.next())
					map.put(rs.getInt(1),id);
		   }
		   
 				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return map;
		 
	 }
	 
	public ArrayList<Message> getMsg(int userid,int msgid)
	{ArrayList<Message> msgList = new ArrayList();
	Message msg=null;
			try {
				PreparedStatement ps = con.prepareStatement("Select sid,rid,message,status from message where (rid=? or sid=? ) and (rid=? or sid=?)");
				ps.setInt(1, userid);
				ps.setInt(2, userid);
				ps.setInt(3, msgid);
				ps.setInt(4, msgid);
				rs= ps.executeQuery();
				while(rs.next())
				{
					msg = new Message(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
					msgList.add(msg);
				}
				    			
			
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return msgList;


			
	}
	
	public ArrayList<Integer> getfrnds(int userid)
	{
		ArrayList<Integer> friend = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select friend from friendlist where userid=?");
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				friend.add(rs.getInt(1));
			}
			ps = con.prepareStatement("Select userid from friendlist where friend=?");
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				friend.add(rs.getInt(1));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return friend;
		
	}

	
	public ArrayList<notify> getNotify(int userid)
	{
		ArrayList<notify> notify = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("select userid,notification,status from notification where userpost=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next())
				notify.add(new notify(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return notify;
		
	}
	
	public ArrayList<post> getTimeline(int userid)
	{
		ArrayList<post> posts = new ArrayList();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Select pid,userid,description,posturl from posts where userid=?");
		
		ps.setInt(1, userid);
		rs = ps.executeQuery();
		while(rs.next())
		{
		  post post =new post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
		  posts.add(post);
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts;
	}
	
	public ArrayList<String> getPhone(int userid)
	{
		ArrayList<String> phone = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select phone from phoneno where userid=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next())
				phone.add(rs.getString(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return phone;
		
	}
	public ArrayList<String> getStudy(int userid)
	{
		ArrayList<String> study = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select name from study where userid=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next())
				study.add(rs.getString(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return study;
		
	}
	
	public ArrayList<Integer> search(String search)
	{
		ArrayList<Integer> user = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select userid from users where name like ?");
			ps.setString(1,"%"+search+"%");
			rs = ps.executeQuery();
			while(rs.next())
			{
				user.add(rs.getInt(1));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return user;
		
	}
	
	public ArrayList<Comment> getComment(int pid)
	{
		ArrayList<Comment> comments = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select cid,pid,userid,comments from comments where pid=?");
			ps.setInt(1,pid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				comments.add(new Comment(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4)));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return comments;
	
		
	}

	public ArrayList<Like> getLikes(int pid)
	{
		ArrayList<Like> likes = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select userid,lid,pid from likes where pid=?");
			ps.setInt(1,pid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				likes.add(new Like(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return likes;
	
		
	}
	
	public post getPostinfo(int pid)
	{ post post =null;
	
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Select pid,userid,description,posturl from posts where pid=?");
		
		ps.setInt(1, pid);
		rs = ps.executeQuery();
		while(rs.next())
		{
		  post =new post(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
		  
		}
		}
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return post;
	}
	 
	 
	public  void like(int pid,int userid)
	{
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Select lid from likes where pid=? and userid=?");
			
			ps.setInt(1, pid);
			ps.setInt(2, userid);
			rs = ps.executeQuery();
			
			if(!rs.next())
			{ 
				ps = con.prepareStatement("Insert into likes values(seqlike.nextval,?,?,null)");
				ps.setInt(1, pid);
				ps.setInt(2, userid);
				int i=ps.executeUpdate();
				System.out.println("inserted");
			   	
			}
			else
			{ rs = ps.executeQuery();
				while(rs.next())
				{ System.out.println("bkjb");
					ps = con.prepareStatement("delete from likes where lid=?");
					ps.setInt(1, rs.getInt(1));
					ResultSet r1=ps.executeQuery();
					System.out.println("deleted");
					
				}
				
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public void comment(int pid, int userid,String comment)
	{ PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into likes values(seqcom.nextval,?,?,null,?)");
	 
	ps.setInt(1, pid);
	ps.setInt(2, userid);
	ps.setString(3, comment);
	int i=ps.executeUpdate();
	System.out.println("comment");
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	
	}
}





