<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*,java.util.*"%>
    <% 
    int userid=Integer.parseInt((session.getAttribute("userid")).toString());
    int pid = Integer.parseInt(request.getParameter("post"));
    dbConnection db = new dbConnection();
    UserInfo userinfo= db.getInformation(userid);
    
    ArrayList<Comment> comments=new ArrayList(db.getComment(pid));
    for(Comment comment:comments)
    {
 	   UserInfo user = db.getInformation(comment.getUserid());
 		out.print("<style>#pic"+user.getUserid()+"{background-image: url('"+user.getPicurl()+"');}</style>");
 		out.print("<div  class='button_class'>"+
 				"<img id='pic"+user.getUserid()+"'class='demo'><div style='color:#9E9E9E'>"+user.getName()+"</div>&nbsp&nbsp"+
 	            comment.getComments()+"<div class='android-drawer-separator'></div></div>");   
    }
    %>