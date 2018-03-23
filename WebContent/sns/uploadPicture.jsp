<%@ page import="com.db.*" %>
<%
String userid=session.getAttribute("emailid").toString();
dbConnection db = new dbConnection();

String url = request.getParameter("url");




	
    db.uploadPicture(userid,url);
    
%>
    <jsp:include page='login.jsp'/>
	<% out.println("<center><font color='red'>please login</font></center>");
	%>	 
