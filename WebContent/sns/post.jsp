<%@ page import="com.db.*" %>
<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
dbConnection db = new dbConnection();
String desc = request.getParameter("desc");
String url = request.getParameter("url");
System.out.print(desc);

System.out.println(url);
if(desc!=null||(desc==null&&url!=null)||(desc!=null&&url!=null))
{
	
    db.insertIntoPost(userid, desc, url);	
}
String redirectURL = "home.jsp";
response.sendRedirect(redirectURL);
%>