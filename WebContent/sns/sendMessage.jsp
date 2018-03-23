<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.*" %>

<% int sid=Integer.parseInt((session.getAttribute("userid")).toString());

dbConnection db = (dbConnection)session.getAttribute("db");
String message = request.getParameter("msg");
int rid = Integer.parseInt(request.getParameter("rid"));
db.sendMessage(sid, rid, message);
%>