<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
    pageEncoding='ISO-8859-1'%>
    <%@ page import="com.db.*" %>

<link rel='stylesheet' href='msg.css'>
<%int userid=Integer.parseInt((session.getAttribute("userid")).toString());
dbConnection db = new dbConnection();
int msgid=Integer.parseInt(request.getParameter("msgid"));
UserInfo user = db.getInformation(msgid);


%>
<script >

$(document).ready(function(){
	setInterval(function(){
		 <%out.print("$('#style-1').load('loadmsg.jsp?msgid="+msgid+"&userid="+userid+"');");%>
		}, 2000)
$('#sendbtn').click(function()
		{
	alert();
		});
	

});</script>

<%
out.print("<style>#user{background-image: url('"+user.getPicurl()+"');}</style>"+
		"<div >"+
    "<img id='user' class='demo' style='margin-top:5px;margin-left:5px;' ><span> "+user.getName()+"</span>"+
  "</div>"+
  "<div class='android-drawer-separator'></div>" +
"<div id='style-1' style='height:63vh;'><div id='load'>"+
"</div>"+
"</div>"+
"<div class='android-drawer-separator'></div><div>"+
"<input type='text' id='sendmag' name='firstname' placeholder='send message'>"+
"<button id='sendbtn'><i class='material-icons'>send</i></button></div>");
%>