<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*,java.util.*" %>
    <div width:100% style="background-color:#3D5AFE;padding:22px;color:#fff;font-size:20px">Recent Message</div>
<% int userid=Integer.parseInt((session.getAttribute("userid")).toString());
dbConnection db = (dbConnection)session.getAttribute("db");
TreeMap<Integer,Integer> map = new TreeMap(db.getRecentMsg(userid));
                for(int key:map.keySet())
                {   UserInfo user = db.getInformation(map.get(key));
                	
                	
                	out.print("<style>#pic"+user.getUserid()+"{background-image: url('"+user.getPicurl()+"');}</style>");
                	out.print("<div id='div"+user.getUserid()+"' class='anchor'><img id='pic"+user.getUserid()+"'class='demo'>&nbsp&nbsp"+user.getName()+"</div>");
                	out.print("<script>$(document).ready(function(){"+
                    	"$('#div"+user.getUserid()+"').click(function(){"+
                    	"	$('#load').load('messageContent.jsp?msgid="+user.getUserid()+"');"+
                    		"});"+
                    "});</script>");
                	
                }%>