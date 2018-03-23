<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%

if(session.getAttribute("userid")==null)
{%>
	<jsp:include page='login.jsp'/>
	<% out.println("<center><font color='red'>please login</font></center>");
	%>	
<%}else{

int userid = (int)session.getAttribute("userid"); 


dbConnection db = (dbConnection)session.getAttribute("db");
//dbConnection db = new dbConnection();
db.OnlineStatus(userid);

UserInfo userinfo= db.getInformation(userid); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>
        Home
    </title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


    <link rel="stylesheet" href="home.css">

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script type="text/javascript" src="home.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.11.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyBeoO524u4a85k2JEeT44YcE4B2YGV9t_s",
    authDomain: "scoial-media.firebaseapp.com",
    databaseURL: "https://scoial-media.firebaseio.com",
    projectId: "scoial-media",
    storageBucket: "scoial-media.appspot.com",
    messagingSenderId: "946252458670"
  };
  firebase.initializeApp(config);
</script>
<script>
$(document).ready(function(){
	$('#signout').click(function(){
		window.location.replace("signout.jsp");
		
	});
	$('#editprofile').click(function(){
		window.location.replace("editprofile.jsp");
	});
			
	$("#TEXT_ID").hide();
	$("#viewpost").load("viewpost.jsp");
	
	$('#editprofile').click(function(){
		window.location.replace("upload2.jsp");
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
<script>
function load()
{ var elem = document.getElementById("description").value;    
var filetoUpload=document.getElementById("ID").files[0];
elem = elem.replace("\n"," ");

var downloadURL=null;


//Step 2 : Initializing the reference of database with the filename
if(filetoUpload!=null){
var storageRef = firebase.storage().ref(""+Math.random());
//Step 3 : Uploading file
 var task = storageRef.put(filetoUpload);


//Step 4 : sata_changed Event
 // state_changed events occures when file is getting uploaded 
 //(Note : when we want to show the progress what's the uploading status that time we will use this function.)
 task.on('state_changed',
    function progress(snapshot){
        var percentage = snapshot.bytesTransferred / snapshot.totalBytes * 100;
        //uploader.value = percentage;
         elem.style.width = parseInt(percentage) + '%'; 
         elem.innerHTML=parseInt(percentage)+'%';
    },
    function error(err){

    },
    function complete(){
       downloadURL = task.snapshot.downloadURL;
        
        window.location.replace("post.jsp?desc="+elem+"&url="+downloadURL);
    }
); }
else
	{
	window.location.replace("post.jsp?desc="+elem+"&url="+downloadURL);
	}

	}
</script>

<style>
<%out.print(".android-drawer-separator {"+"height: 1px;"+"background-color: #dcdcdc;"+"margin: 8px 0;"+"}"+".demo-avatar {"+" background-image: url('"+userinfo.getPicurl()+"');"+"background-position: center;"+"background-size: cover;"+"width: 100px;"+"height: 100px;"+"border-radius: 50px;"+"margin-left: 50px"+"}");%>
</style>

<script src = "home.js"></script>
</head>
<body >

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
              <li id="editprofile" class="mdl-menu__item">change Profile pic</li>
              <li id="signout"class="mdl-menu__item">Sign Out</li>
        
              </ul>
          </div>
          
        </header>
        
        <!-- left card-->
            <div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
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
        
                
                <!-- MDL Spinner Component -->


           <div id= "main" style="margin-left:25%;"class = "wide-card mdl-card mdl-shadow--2dp">
               <div class = "mdl-card__title">
                     <h2 class = "mdl-card__title-text">Write to share</h2>
                  </div>
                 
                   <textarea  style="border-radius:20px" id="description" name ="description" rows="4" cols="50" >

</textarea>
                  
               
                  <div  class = "mdl-card__actions mdl-card--border">
      <div style="margin-left:75%">            
<div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
  <input class="mdl-textfield__input" placeholder="No file chosen" type="text" id="TEXT_ID" readonly />
  <div class="mdl-button mdl-button--icon mdl-button--file">
    <i class="material-icons">add_a_photo</i>
    <input type="file" name="NAME"   accept="image/*" id="ID" onchange="document.getElementById('TEXT_ID').value=this.files[0].name;document.getElementById('TEXT_ID').style.display='block';"/>
  </div>
</div>
</div>
         <div style="margin-left:75%">
                     <button id ="post" class = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="load()">post
                  </button>
                  </div>
                  </div>
                  </div>
                  <div class='blue'style="margin-left:25%" id="viewpost">
                  </div>
                  

             

                
              
        </main>
        
      
      
      </div>
         
      </div>
      

</body>
</html>
<%} %>
