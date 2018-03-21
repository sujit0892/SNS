<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*, java.util.*" %>
<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
int pid = Integer.parseInt(request.getParameter("post"));
dbConnection db = new dbConnection();
UserInfo userinfo= db.getInformation(userid);
db.like(pid, userid);

%>