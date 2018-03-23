<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.db.*, java.util.*" %>
<%
int friend=Integer.parseInt(request.getParameter("frnd"));
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
int action=Integer.parseInt(request.getParameter("action"));
dbConnection db=(dbConnection)session.getAttribute("db");

db.accept(userid, friend, action);
if(action==2)
{
	db.insetNotify(userid, 0, friend, "sent you friend Request");
}
if(action==1)
{
	db.insetNotify(userid, 0, friend, "accepted your friend Request");
}
response.sendRedirect("profile.jsp?user="+friend);


%>