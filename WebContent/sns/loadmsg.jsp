<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.db.*,java.util.*" %>


<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
//9dbConnection db = (dbConnection)session.getAttribute("db");
dbConnection db = new dbConnection();
int msgid=Integer.parseInt(request.getParameter("msgid"));
ArrayList<Message> msgs = db.getMsg(userid, msgid);
for(Message msg:msgs)
{
	if(msg.getSid()==userid)
	{
		out.print("<div id='sid' ><p class='send'>"+msg.getMsg()+"</p></div><br><br>");
		
	}
	else{
		out.print("<div id='rid'><p class='rec'>"+msg.getMsg()+"</p></div><br><br>");
	}
}
%>