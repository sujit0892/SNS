<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.db.*,java.sql.*"

 %>
 <%
 String email=request.getParameter("email");
 String pass=request.getParameter("password");
 

dbConnection db = new dbConnection();
 int userid = db.checkUser(email, pass);
 
 
if(userid==0){	
%>
<jsp:include page='login.jsp'/>
		<% out.println("<center><font color='red'>Invalid Username Password</font></center>");
		}
		else{
		session.setAttribute("userid", userid);
		session.setAttribute("db", db);
		response.sendRedirect("home.jsp");
		}%>


</body>
</html>