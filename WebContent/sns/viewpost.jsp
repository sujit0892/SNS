<%@ page import="com.db.*,java.util.*"%>

<style>
.black
{
	color:black;
}
.blue
{
	color:#2196F3;
}
</style>
<%
	int userid = Integer.parseInt((session.getAttribute("userid")).toString());
	dbConnection db = new dbConnection();
	ArrayList<post> posts = new ArrayList();
	posts.addAll(db.getPost(userid));
	
	for(post post:posts)
	{UserInfo info=db.getInformation(post.getUserid());
	out.println("<script>$(document).ready(function(){ $('#pic"+post.getPid()+"').css('cursor','pointer'); $('#pic"+post.getPid()+"').click(function(){ window.location.replace('postinfo.jsp?post="+post.getPid()+"'); }); ");
	
	if(db.checkLike(post.getPid(), userid))
	{
		out.print("$('#likeicon"+post.getPid()+"').addClass('blue');");
	}
	else
	{
		out.print("$('#likeicon"+post.getPid()+"').addClass('black');");
	}
	
	out.print(""+
	"$('#likebutton"+post.getPid()+"').click(function() { $('#likeicon"+post.getPid()+"').toggleClass('black blue');$.post('like.jsp',{"+
	 "   	     post:"+post.getPid()+
	  "  	    },"+
	   " 	    function(data, status){"+
	    	        
	    "	    });});});</script>");
	
	
	if(post.getPosturl().equals("null"))
	{out.print("<style>#pic"+post.getUserid()+
			"{"+
			"background-image: url('"+info.getPicurl()+"');"+
			"}"+
"</style>");
	

		out.print("<div id='div"+post.getPid()+"' style='padding-top:5px'><div class='demo-card-wide mdl-card mdl-shadow--2dp'>"+
				""+
				"<div id='pic"+post.getPid()+"' class='mdl-card__supporting-text'>"+
				"	<img id='pic"+post.getUserid()+"' class='demo' style='margin-top: 5px'><span> "+info.getName()+
				"</span>"+
				"</div>"+
				"<span style='margin-left:5px;color:black'>"+ post.getDesc() +"<span>"+
				"		<div class='mdl-card__actions mdl-card--border'>"+
				"			<button id='likebutton"+post.getPid()+"'"+
				"				class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
				"				<i id='likeicon"+post.getPid()+"' class='material-icons'>thumb_up</i>"+
"			</button> <button  class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
"								"+
"								<i   class='material-icons black'>chat_bubble_outline</i>"+
"							</button>"+
"						</div>"+
"			</div></div>");

		
	}
	else{
	out.print("<style>#pic"+post.getPid()+"{"+
			" background: url('"+post.getPosturl()+"') center / cover;"+
			"}"+
			"#pic"+post.getUserid()+
			"{"+
			"background-image: url('"+info.getPicurl()+"');"+
			"}"+
"</style>");
		out.print("<div style='padding-top:5px'><div  class='demo-card-wide mdl-card mdl-shadow--2dp'>"+
				"<div class='mdl-card__title' id='pic"+post.getPid()+"'></div>"+
				"<div class='mdl-card__supporting-text'>"+
				"	<img id='pic"+post.getUserid()+"' class='demo' style='margin-top: 5px'><span> "+info.getName()+
				"</span>"+
				"</div>"+
				"<span style='margin-left: 5px;color:black'>"+ post.getDesc() +"<span>"+
				"		<div class='mdl-card__actions mdl-card--border'>"+
				"			<button id='likebutton"+post.getPid()+"'"+
				"				class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
				"				<i id='likeicon"+post.getPid()+"' class='material-icons'>thumb_up</i>"+
"			</button> <button"+
"								class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
"								<i  class='material-icons black'>chat_bubble_outline</i>"+
"							</button>"+
"						</div>"+
"			</div></div>");
	}
	}
%>


