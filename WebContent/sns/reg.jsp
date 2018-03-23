<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@ page import="com.db.*"%>
 <%
 String email=request.getParameter("email");
 String name=request.getParameter("fname")+" "+request.getParameter("sname");
 String dob=request.getParameter("dob");
 String gender=request.getParameter("gender");
 String pass=request.getParameter("password");
 String cpass=request.getParameter("cpassword");
 
 if(!pass.equals(cpass)){
%>
<jsp:include page='login.jsp'/>
		<% out.println("<center><font color='red'>PASSWORD DIDN'T MATCH</font></center>");
		}%>	 
 <%
 
 
 dbConnection db = new dbConnection();
 if(!db.checkEmail(email))
 {
 db.regUser(email, pass, name, dob, gender);
session.setAttribute("emailid", email);
response.sendRedirect("upload.jsp");
 }
 else
 {%>
	<jsp:include page='login.jsp'/>
		<% out.println("<center><font color='red'>Already signup</font></center>");
		}%>	 
 

 
</body>
</html>