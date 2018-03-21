<%@ page import="com.db.*,java.util.*"%>
<%
	int userid = Integer.parseInt((session.getAttribute("userid")).toString());
	dbConnection db = new dbConnection();
	ArrayList<post> posts = new ArrayList();
	posts.addAll(db.getPost(userid));
	
	for(post post:posts)
	{UserInfo info=db.getInformation(post.getUserid());
	
	if(post.getPosturl().equals("null"))
	{out.print("<style>#pic"+post.getUserid()+
			"{"+
			"background-image: url('"+info.getPicurl()+"');1"+
			"}"+
"</style>");
		out.print("<div style='padding-top:5px'><div class='demo-card-wide mdl-card mdl-shadow--2dp'>"+
				""+
				"<div class='mdl-card__supporting-text'>"+
				"	<img id='pic"+post.getUserid()+"' class='demo' style='margin-top: 5px'><span> "+info.getName()+
				"</span>"+
				"</div>"+
				"<span style='margin-left: 5px'>"+ post.getDesc() +"<span>"+
				"		<div class='mdl-card__actions mdl-card--border'>"+
				"			<button"+
				"				class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
				"				<i style='color: black;' class='material-icons'>thumb_up</i>"+
"			</button> <button"+
"								class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
"								<i style='color: black;' class='material-icons'>chat_bubble_outline</i>"+
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
			"background-image: url('"+info.getPicurl()+"');1"+
			"}"+
"</style>");
		out.print("<div style='padding-top:5px'><div  class='demo-card-wide mdl-card mdl-shadow--2dp'>"+
				"<div class='mdl-card__title' id='pic"+post.getPid()+"'></div>"+
				"<div class='mdl-card__supporting-text'>"+
				"	<img id='pic"+post.getUserid()+"' class='demo' style='margin-top: 5px'><span> "+info.getName()+
				"</span>"+
				"</div>"+
				"<span style='margin-left: 5px'>"+ post.getDesc() +"<span>"+
				"		<div class='mdl-card__actions mdl-card--border'>"+
				"			<button"+
				"				class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
				"				<i style='color: black;' class='material-icons'>thumb_up</i>"+
"			</button> <button"+
"								class='mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect'>"+
"								<i style='color: black;' class='material-icons'>chat_bubble_outline</i>"+
"							</button>"+
"						</div>"+
"			</div></div>");
	}
	}
%>


