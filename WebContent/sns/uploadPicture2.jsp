<%@ page import="com.db.*" %>
<%
int userid=(int)session.getAttribute("userid");
dbConnection db = new dbConnection();

String url = request.getParameter("url");

UserInfo info=db.getInformation(userid);

	
    db.uploadPicture(info.getEmailid(),url);
    
%>
    <jsp:include page='home.jsp'/>
	
		 
