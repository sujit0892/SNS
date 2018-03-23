<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.*, java.util.*" %>


<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
int pid = Integer.parseInt(request.getParameter("post"));
dbConnection db = new dbConnection();
UserInfo userinfo= db.getInformation(userid);
       ArrayList<Like> likes=new ArrayList(db.getLikes(pid));
   for(Like like:likes)
   {
	   UserInfo user = db.getInformation(like.getUserid());
		out.print("<style>#pic"+user.getUserid()+"{background-image: url('"+user.getPicurl()+"');}</style>");
		out.print("<div class='button_class'>"+
				"<a style='text-decoration:none'; href='profile.jsp?user="+user.getUserid()+"' class='link_class' ><img id='pic"+user.getUserid()+"'class='demo'>&nbsp&nbsp"+
	            user.getName()+"</a></div>");   
   }
   %>