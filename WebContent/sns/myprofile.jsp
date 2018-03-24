 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Friends</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


    <link rel="stylesheet" href="home.css">
    
    <link rel="stylesheet" href="profile.css">

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script type="text/javascript" src="home.js"></script>
 
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
<script>
$(document).ready(function(){
	
	$('#editprofile').click(function(){
		window.location.replace("upload2.jsp");
	});
	
	$('#signout').click(function(){
		window.location.replace("signout.jsp");
		
	});
	
	$('#waterfall-exp').keyup(function(e){
    if(e.keyCode == 13)
    { 
    
    	window.location.replace("search.jsp?search="+$('#waterfall-exp').val());
    }});
	
	setInterval(function(){
		$('#navbar').load('nav.jsp');
		}, 2000);

});


</script>
</head>
<%
if(session.getAttribute("userid")==null)
{%>
	<jsp:include page='login.jsp'/>
	<% out.println("<center><font color='red'>please login</font></center>");
	%>	
<%}else{
int userid=(int)session.getAttribute("userid");
dbConnection db = new dbConnection();
UserInfo userinfo= db.getInformation(userid);%>

<body>
<style>
<%out.print(".android-drawer-separator {"+"height: 1px;"+"background-color: #dcdcdc;"+"margin: 8px 0;"+"}"+".demo-avatar {"+" background-image: url('"+userinfo.getPicurl()+"');"+"background-position: center;"+"background-size: cover;"+"width: 100px;"+"height: 100px;"+"border-radius: 50px;"+"margin-left: 50px"+"}");%>
</style>
    <div class="demo-layout-waterfall mdl-layout mdl-js-layout">
        <header class="mdl-layout__header mdl-layout__header--waterfall">
          <!-- Top row, always visible -->
          <div class=" xxx mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Social Networking Site</span>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                        mdl-textfield--floating-label mdl-textfield--align-right">
              <label class="mdl-button mdl-js-button mdl-button--icon"
                     for="waterfall-exp">
                <i class="material-icons">search</i>
              </label>
              <div class="mdl-textfield__expandable-holder">
                <input style="border-radius:20px;background-color:white;color:black" class="mdl-textfield__input" type="text" name="sample" id="waterfall-exp">
              </div>
            </div>
              <!-- Right aligned menu below button -->
              <button id="demo-menu-lower-right"
               class="mdl-button mdl-js-button mdl-button--icon">
                <i class="material-icons">more_vert</i>
              </button>
      
              <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
              for="demo-menu-lower-right">
            <li id="editprofile" class="mdl-menu__item">Edit Profile</li>
              <li id="signout"class="mdl-menu__item">Sign Out</li>
        
        
              </ul>
          </div>
          
        </header>
        
        <!-- left card-->
            <div  class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
               <div class="mdl-layout__drawer" >
                  <img  class="demo-avatar" style="margin-top:5px" > 
                                <span class="mdl-layout-title"><%out.print(userinfo.getName());%>

                  </span>
                  <div class="android-drawer-separator"></div>   
          
          <nav id='navbar' class="mdl-navigation">
            <a class="mdl-navigation__link" href="home.jsp"> <i class="material-icons">home</i> Home</a>
            <a class="mdl-navigation__link" href="notification.jsp"> <i class="material-icons">public</i> Notification</a>
            <a class="mdl-navigation__link" href="msg.jsp"> <i class="material-icons">message</i> Message</a>
            <a class="mdl-navigation__link" href="myprofile.jsp"> <i class="material-icons">account_circle</i> My Profile</a>
            <div class="android-drawer-separator"></div>

           </nav>

        </div>
        
        
        <main id="a" class="mdl-layout__content" >
                        <style>
        .demo-layout-waterfall .mdl-layout__header-row .mdl-navigation__link:last-of-type  {
        padding-right: 0;
        }
        </style>

        <!-- Image card -->
        <style>
        .demo-card-image.mdl-card {
        
            
            width: 238px;
            height: 256px;
            <%out.print("background: url('"+userinfo.getPicurl()+"') center / cover;");
        %>
        }
                
        </style>

<div style="padding:10px">
<div  class="demo-card-image mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title mdl-card--expand"></div>
  <div class="mdl-card__actions">
    <span class="demo-card-image__filename"><%= userinfo.getName() %></span>
  </div>
</div>
<div style="padding:10px;margin-left:25%">
</div></div>
<div class = "mdl-tabs mdl-js-tabs">
               <div class = "mdl-tabs__tab-bar">
                  <a href = "#tab1-panel" class = "mdl-tabs__tab is-active">About</a>
                  <a href = "#tab2-panel" class = "mdl-tabs__tab">Timeline</a>
                  <a href = "#tab3-panel" class = "mdl-tabs__tab">Friends</a>
                  
                  
               </div>
            
               <div  class = "mdl-tabs__panel is-active" id = "tab1-panel">
               <div style="padding:5px" align="center" >
                  <table  class="mdl-data-table  ">
  <thead>
   
  </thead>
  <tbody>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Email id</td>
      <td><%= userinfo.getEmailid() %></td>
      
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Date of Birth</td>
      <td><%=userinfo.getDob() %></td>
      
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Gender</td>
      <td><%= userinfo.getGender() %></td>
     
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Interested in</td>
      <td></td>
     
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">About</td>
      <td><%= userinfo.getAbout() %></td>
     
    </tr>
    <%ArrayList<String> phones = new ArrayList(db.getPhone(userid));
    for(String phone:phones)
    {%>
     <tr>
    
      <td class="mdl-data-table__cell--non-numeric">Phone</td>
      <td></td>
      
    </tr>
    	
    <% }%>
     <%ArrayList<String> study = new ArrayList(db.getStudy(userid));
    for(String studies:study)
    {%>
     <tr>
    
      <td class="mdl-data-table__cell--non-numeric">Studies at</td>
      <td></td>
      
    </tr>
    	
    <% }%>
   
  </tbody>
</table>
          
</div>
               </div>
            
               <div class = "mdl-tabs__panel" id = "tab2-panel">
               <div style="margin-left:25%">
                  <%

	ArrayList<post> posts = new ArrayList();
	posts.addAll(db.getTimeline(userid));
	
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

</div>

               </div>
            
               <div style="padding:5px;" class = "mdl-tabs__panel" id = "tab3-panel">
                  <div style="margin-left:25%;" class=' demo-card-wide mdl-card mdl-shadow--2dp'>

<div>Requests<div>
<%

ArrayList<Integer> requestfrnd =new ArrayList(db.getRequest(userid));

for(int requestid:requestfrnd)
{   UserInfo user = db.getInformation(requestid);
	out.print("<style>#pic"+user.getUserid()+"{background-image: url('"+user.getPicurl()+"');}</style>");
	out.print("<div class='button_class'>"+
			"<a style='text-decoration:none'; href='profile.jsp?user="+user.getUserid()+"' class='link_class' ><img id='pic"+user.getUserid()+"'class='demo'>&nbsp&nbsp"+
            user.getName()+"</a><div>");
	
}



%>

<div class="android-drawer-separator"></div>
<div>Friends<div>
<%

ArrayList<Integer> friends =new ArrayList(db.getfrnds(userid));
for(int friend:friends)
{   UserInfo user = db.getInformation(friend);
	out.print("<style>#pic"+user.getUserid()+"{background-image: url('"+user.getPicurl()+"');}</style>");
	out.print("<div class='button_class'>"+
			"<a style='text-decoration:none'; href='profile.jsp?user="+user.getUserid()+"' class='link_class' ><img id='pic"+user.getUserid()+"'class='demo'>&nbsp&nbsp"+
            user.getName()+"</a><div>");
	
}



%>
                  



               </div>
               
               
               </div>
            </div>

   
                
               
      

                
               
                
             
             
             

        </main>
        
      
      
      </div>
         
      </div>


</body>
</html>
<%} %>