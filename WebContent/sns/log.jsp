<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import=" java.sql.Connection,
java.sql.DriverManager,
java.sql.PreparedStatement,
java.sql.ResultSet,
java.sql.SQLException,
java.sql.Statement"
 %>
 <%
 String email=request.getParameter("email");
 String pass=request.getParameter("password");
 String selectSQL = "SELECT userid FROM USERS WHERE emailid = '"+email+"' and password='"+pass+"'";
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection connection  = DriverManager.getConnection("jdbc:oracle:thin:@172.29.8.248:1521:xe","marine","7728");
 PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
 ResultSet rs = preparedStatement.executeQuery();
 if(rs==null){
%>
<jsp:include page='login.jsp'/>
		<% out.println("<center><font color='red'>Invalid Username Password</font></center>");
		}else{	
		while(rs.next())
		{
String redirectURL = "home.jsp";
response.sendRedirect(redirectURL+"?user="+rs.getInt(1));
}  %>
 <%
 }
%>

</body>
</html>