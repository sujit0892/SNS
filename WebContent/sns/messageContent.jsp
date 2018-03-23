<%@ page language='java' contentType='text/html; charset=ISO-8859-1'
    pageEncoding='ISO-8859-1'%>
    <%@ page import="com.db.*" %>

<link rel='stylesheet' href='msg.css'>


<%int userid=Integer.parseInt((session.getAttribute("userid")).toString());
dbConnection db = (dbConnection)session.getAttribute("db");
int msgid=Integer.parseInt(request.getParameter("msgid"));
UserInfo user = db.getInformation(msgid);


%>
<style>
#style<%= msgid%>
{
overflow-y:auto;
display: flex;
flex-direction: column-reverse;

}
#style<%= msgid%>::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 2px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #FAFAFA;
}

#style<%= msgid%>::-webkit-scrollbar
{
	width: 7px;
	background-color: #FAFAFA;
}

#style<%= msgid%>::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #9E9E9E;
}
</style>
<script >

$(document).ready(function(){
	setInterval(function(){
		 <%out.print("$('#style"+msgid+"').load('loadmsg.jsp?msgid="+msgid+"');");%>
		}, 2000);
$('#sendbtn').click(function()
		{
	$.post('sendMessage.jsp',{rid:<%=msgid%>,msg:$('#sendmag').val()},function(data,status){});
	alert();
		});
		
	

});</script>

<%
out.print("<style>#user{background-image: url('"+user.getPicurl()+"');}</style>"+
		"<div >"+
    "<img id='user' class='demo' style='margin-top:5px;margin-left:5px;' ><span> "+user.getName()+"</span>"+
  "</div>"+
  "<div class='android-drawer-separator'></div>" +
"<div id='style"+msgid+"' style='height:63vh;'><div id='load'>"+
"</div>"+
"</div>"+
"<div class='android-drawer-separator'></div><div>"+
"<input type='text' id='sendmag' name='firstname' placeholder='send message'>"+
"<button id='sendbtn'><i class='material-icons'>send</i></button></div>");
%>