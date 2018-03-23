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
	
	
	  public  Connection con;
	
	 ResultSet rs ;
	 public dbConnection()
	 { 
		 
	 }
	 
	 public void createCon()
	 {
		 
		 
		 
		 try {
			 Class.forName ("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection(  
						"jdbc:oracle:thin:@localhost:1521:xe","marine","7728");
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
					
	 }
	 
	 public void closeCon()
	 {
		 try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }

	 public UserInfo getInformation(int userid)
	 {  createCon();
	   
		 UserInfo info = null;
		 try {
			 PreparedStatement ps=con.prepareStatement("select * from users where userid=?");
			 ps.setString(1,""+userid);
		   rs=ps.executeQuery();  
			while(rs.next())  
			info = new UserInfo(rs.getInt(1),rs.getString(2),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
					,rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(4));
			
			
			
			//step5 close the connection object  
			  
			  
			}catch(Exception e){ System.out.println("abx");}
		 closeCon();
		 return info;
	 }
	 
	 public void insertIntoPost(int userid,String desc,String url)
	 {createCon();
	    
		 
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
		 closeCon();
	 }
	 
	 public ArrayList<post> getPost(int userid)
	 {createCon();
	    
		 ArrayList<Integer> friends = new ArrayList();
		 ArrayList<post> posts = new ArrayList();
		 try {
			PreparedStatement ps=con.prepareStatement("Select friend,status from friendlist where userid=?");
			ps.setInt(1, userid);
			 rs=ps.executeQuery(); 
			while(rs.next())
			{  if(rs.getInt(2)==1)
				friends.add(rs.getInt(1));
			}
			ps=con.prepareStatement("Select userid,status from friendlist where friend=?");
			ps.setInt(1, userid);
			rs=ps.executeQuery(); 
			while(rs.next())
			{    if(rs.getInt(2)==1)
				friends.add(rs.getInt(1));
			}
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
		 closeCon();
		return posts;
		 
	 }

	 public static void main(String[] args) {
	
	   
		
	}
	 
	 public TreeMap<Integer,Integer> getRecentMsg(int userid)
	 {    createCon(); 
		 TreeMap<Integer,Integer> map = new TreeMap(Collections.reverseOrder());
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
		}closeCon();
		 return map;
		 
	 }
	 
	public ArrayList<Message> getMsg(int userid,int msgid)
	{ createCon();
		ArrayList<Message> msgList = new ArrayList();
	Message msg=null;
			try {
				PreparedStatement ps = con.prepareStatement("Select sid,rid,message,status,mid from message where (rid=? or sid=? ) and (rid=? or sid=?)");
				ps.setInt(1, userid);
				ps.setInt(2, userid);
				ps.setInt(3, msgid);
				ps.setInt(4, msgid);
				rs= ps.executeQuery();
				while(rs.next())
				{
					msg = new Message(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5));
					msgList.add(msg);
				}
				
				Collections.sort(msgList,new Comparator<Message>()
				{

					@Override
					public int compare(Message o1, Message o2) {
						// TODO Auto-generated method stub
						return Integer.valueOf(o2.getMid()).compareTo(o1.getMid());
					}
			
				});			
			
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}closeCon();
			return msgList;


			
	}
	
	public ArrayList<Integer> getfrnds(int userid)
	{ createCon();
		ArrayList<Integer> friend = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select friend,status from friendlist where userid=?");
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{   if(rs.getInt(2)==1)
				friend.add(rs.getInt(1));
			}
			ps = con.prepareStatement("Select userid,status from friendlist where friend=?");
			ps.setInt(1,userid);
			rs = ps.executeQuery();
			while(rs.next())
			{   if(rs.getInt(2)==1)
				friend.add(rs.getInt(1));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		closeCon();
		return friend;
		
	}

	
	public ArrayList<notify> getNotify(int userid)
	{ createCon();
		ArrayList<notify> notify = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("select userid,notification,status,nid,pid from notification where userpost=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while(rs.next())
				notify.add(new notify(rs.getInt(4),rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(5)));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		closeCon();
		return notify;
		
	}
	
	public ArrayList<post> getTimeline(int userid)
	{ createCon();
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
		}closeCon();
		return posts;
	}
	
	public ArrayList<String> getPhone(int userid)
	{ createCon();
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
		}closeCon();
		return phone;
		
	}
	public ArrayList<String> getStudy(int userid)
	{ createCon();
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
		}closeCon();
		return study;
		
	}
	
	public ArrayList<Integer> search(String search)
	{ createCon();
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
		closeCon();
		return user;
		
	}
	
	public ArrayList<Comment> getComment(int pid)
	{ createCon();
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
		closeCon();
		return comments;
	
		
	}

	public ArrayList<Like> getLikes(int pid)
	{ createCon();
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
		closeCon();
		return likes;
	
		
	}
	
	public post getPostinfo(int pid)
	{  createCon();
		post post =null;
	
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
		}closeCon();
		return post;
	}
	 
	 
	public  void like(int pid,int userid)
	{ createCon();
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
		}closeCon();
	}
	
	public void comment(int pid, int userid,String comment)
	{ createCon();
		PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into comments values(seqcom.nextval,?,?,null,?)");
	 
	ps.setInt(1, pid);
	ps.setInt(2, userid);
	ps.setString(3, comment);
	int i=ps.executeUpdate();
	
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	closeCon();
	
	}
	
	public  boolean checkLike(int pid,int userid)
	{ createCon();
		boolean status =false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Select lid from likes where pid=? and userid=?");
			
			ps.setInt(1, pid);
			ps.setInt(2, userid);
			rs = ps.executeQuery();
			
			if(!rs.next())
			{ 
				status= false;
			   	
			}
			else
			{ 
				status= true;
				
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}closeCon();
		return status;
	}
	
	
	public void regUser(String email,String pass,String name,String dob,String gender)
	{ createCon();
		 java.sql.Date date = new java.sql.Date(0000-00-00);
		String insertTableSQL = "INSERT INTO USERS(USERID,EMAILID, PASSWORD, NAME, DOB, GENDER) VALUES"
				+ "(seq.nextval,?,?,?,?,?)";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(insertTableSQL);
		
		preparedStatement.setString(1,email);
		preparedStatement.setString(2,pass);
		preparedStatement.setString(3,name);
		preparedStatement.setDate(4,date.valueOf(dob));
		preparedStatement.setString(5,gender);
		//preparedStatement.setTimestamp(4, getCurrentTimeStamp());
		// execute insert SQL stetement
		preparedStatement .executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeCon();

	}
	
	public void sendMessage(int sid, int rid, String message)
	{ createCon();
		try {
			PreparedStatement ps=con.prepareStatement("Insert into message values(seqmsg.nextval,?,?,?,null,null,0)");
			ps.setInt(1, sid);
			ps.setInt(2, rid);
			ps.setString(3, message);
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		closeCon();
	}
	
	public void updateMessage(int mid)
	{ createCon();
		try {
			PreparedStatement ps=con.prepareStatement("update message set status=1 where mid=?");
			ps.setInt(1, mid);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeCon();
	}
	
	public int checkUser(String email, String pass)
	{createCon();
		int userid=0;
		String selectSQL = "SELECT userid FROM USERS WHERE emailid = ? and password= ?";
		
		 PreparedStatement preparedStatement;
		try {
			System.out.println(con);
			preparedStatement = con.prepareStatement(selectSQL);
		 
		 preparedStatement.setString(1,email);
		 preparedStatement.setString(2,pass);
		 ResultSet rs = preparedStatement.executeQuery();
		 if(!(rs.next()))
		 {
			userid=0; 
		 }
		 else
		 {
			 rs = preparedStatement.executeQuery(); 
			 while(rs.next())
			 {
				 userid=rs.getInt(1);
			 }
		 }
		 
	}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		closeCon();
		return userid;
	}
	
	public int checkFriend(int userid,int friend)
	{  int status=3;
	
	createCon();
		
		String selectSQL = "SELECT status FROM friendlist WHERE (userid=? and friend=?) or (userid=? and friend=?)";
		
		 PreparedStatement preparedStatement;
		try {
			System.out.println(con);
			preparedStatement = con.prepareStatement(selectSQL);
		 
		 preparedStatement.setInt(1,userid);
		 preparedStatement.setInt(2,friend);
		 preparedStatement.setInt(3,friend);
		 preparedStatement.setInt(4,userid);
		 ResultSet rs = preparedStatement.executeQuery();
		 if(!(rs.next()))
		 {
			status=3; 
		 }
		 else
		 {
			 rs = preparedStatement.executeQuery(); 
			 while(rs.next())
			 {
				 status=rs.getInt(1);
			 }
		 }
		 
	}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 selectSQL = "SELECT status FROM friendlist WHERE (userid=? and friend=?)";
		
	
		try {
			System.out.println(con);
			preparedStatement = con.prepareStatement(selectSQL);
		 
		 preparedStatement.setInt(1,friend);
		 preparedStatement.setInt(2,userid);
		 
		 
			 rs = preparedStatement.executeQuery(); 
			 while(rs.next())
			 {
				 status=4;
			 }
		 
		 
	}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		closeCon();
		return status;
	}
	
	public void accept(int userid,int frnd,int action)
	{createCon();
	PreparedStatement ps=null;
	try {
		if(action==0)
		{
			ps=con.prepareStatement("delete from friendlist where (userid=? and friend=?)or(userid=? and friend=?)");
			 ps.setInt(1,userid);
			 ps.setInt(2,frnd);
			 ps.setInt(3,frnd);
			 ps.setInt(4,userid);
			 ps.executeUpdate();
		}
		if(action==1)
		{
			ps=con.prepareStatement("update friendlist set status=1 where (userid=? and friend=?)or(userid=? and friend=?)");
			 ps.setInt(1,userid);
			 ps.setInt(2,frnd);
			 ps.setInt(3,frnd);
			 ps.setInt(4,userid);
			 ps.executeUpdate();
		}
		if(action==2)
		{
			ps=con.prepareStatement(" insert into friendlist values(seqfriend.nextval,?,?,0)");
			 ps.setInt(1,frnd);
			 ps.setInt(2,userid);
			
			 ps.executeUpdate();
		}
		
		
		
	}catch(Exception e)
	{
	e.printStackTrace();	
	}
	closeCon();
	
		
	}
	
	
	public ArrayList<Integer> getRequest(int userid)
	{
		createCon();
		ArrayList<Integer> friend = new ArrayList();
		try {
			PreparedStatement ps = con.prepareStatement("Select friend from friendlist where userid=? and status=0");
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
		
		closeCon();
		
		return friend;
		
	}
	
	public void  insetNotify(int userid,int pid,int userpost,String notify)
	{createCon();
	
	PreparedStatement ps;
		
		try {
		ps=con.prepareStatement("insert into notification values(seqnoti.nextval,?,?,0,null,?,?)");
	    ps.setInt(1,userid);
	    ps.setString(2, notify);
	    ps.setInt(4, pid);
	    ps.setInt(3, userpost);
	 ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public void updateNotify(int nid)
	{ createCon();
		try {
			PreparedStatement ps=con.prepareStatement("update notification set status=1 where nid=?");
			ps.setInt(1, nid);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeCon();
	}
		
	
}





