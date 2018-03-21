<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){
	alert()%>);
})</script>

<%@ page import=" java.sql.Connection,
java.sql.DriverManager,
java.sql.PreparedStatement,
java.sql.ResultSet,
java.sql.SQLException,
java.sql.Statement"
 %>
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
 java.sql.Date date = new java.sql.Date(0000-00-00);
 
 try{Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection connection  = DriverManager.getConnection("jdbc:oracle:thin:@172.29.8.248:1521:xe","marine","7728");
 String insertTableSQL = "INSERT INTO USERS(USERID,EMAILID, PASSWORD, NAME, DOB, GENDER) VALUES"
			+ "(seq.nextval,?,?,?,?,?)";
	PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
	preparedStatement.setString(1,email);
	preparedStatement.setString(2,pass);
	preparedStatement.setString(3,name);
	preparedStatement.setDate(4,date.valueOf(dob));
	preparedStatement.setString(5,gender);
	//preparedStatement.setTimestamp(4, getCurrentTimeStamp());
	// execute insert SQL stetement
	preparedStatement .executeUpdate();
	
 }
 catch (Exception e) {

	System.out.println(e.getMessage());

}
%>
<jsp:include page='login.jsp'/>
		<% out.println("<center><font color='red'>SUCCESSFULLY REGISTERED</font></center>");
		%>	 
</body>
</html>