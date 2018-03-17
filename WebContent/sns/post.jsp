<%@ page import="com.db.*" %>
<%
dbConnection db = new dbConnection();
String desc = request.getParameter("desc");
String url = request.getParameter("url");

System.out.println(url);
if(desc!=null||(desc==null&&url!=null)||(desc!=null&&url!=null))
{
    db.insertIntoPost(101, desc, url);	
}
String redirectURL = "home.jsp";
response.sendRedirect(redirectURL);
%>