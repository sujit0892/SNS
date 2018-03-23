<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.*, java.util.*" %>
<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
int pid = Integer.parseInt(request.getParameter("post"));
String comment= request.getParameter("comment");
dbConnection db = new dbConnection();
UserInfo userinfo= db.getInformation(userid);
db.comment(pid, userid,comment);
post post=db.getPostinfo(pid);
db.insetNotify(userid, pid,post.getUserid() ,"commented your photo");


%>