<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="editprofile.css">

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script type="text/javascript" src="home.js"></script>

<script>
$(document).ready(function(){
	
	$('#editprofile').click(function(){
		window.location.replace("editprofile.jsp");
	});
	$('#signout').click(function(){
		window.location.replace("signout.jsp");
		
	});
	
	
	$('#waterfall-exp').keyup(function(e){
    if(e.keyCode == 13)
    { 
    
    	window.location.replace("search.jsp?search="+$('#waterfall-exp').val());
    }});
	
	$("#gender").hide();
	$("#interestedin").hide();
	$("#dob").hide();
	$("#about").hide();
	
	$("#igender").click(function(){
		$("#gender").show();
	});
	$("#iinterest").click(function(){
		$("#interestedin").show();
	});
	$("#idob").click(function(){
		$("#dob").show();
	});
	$("#iabout").click(function(){
		$("#about").show();
	});
	
	$("#cgender").click(function(){
		$("#gender").hide();
	});
	$("#cinterest").click(function(){
		$("#interestedin").hide();
	});
	$("#cdob").click(function(){
		$("#dob").hide();
	});
	$("#cabout").click(function(){
		$("#about").hide();
	});
	
	

});


</script>	

</head>
<%
int userid=Integer.parseInt((session.getAttribute("userid")).toString());
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
          
          <nav class="mdl-navigation">
           <a class="mdl-navigation__link" href="home.jsp"> <i class="material-icons">home</i> Home</a>
            <a class="mdl-navigation__link" href="notification.jsp"> <i class="material-icons">public</i> Notification</a>
            <a class="mdl-navigation__link" href="msg.jsp"> <i class="material-icons">message</i> Message</a>
            <a class="mdl-navigation__link" href="myprofile.jsp"> <i class="material-icons">account_circle</i> My Profile</a>
            <div class="android-drawer-separator"></div>
           </nav>

        </div>
        
        
        <main id="a" class="mdl-layout__content" >
                
               
      
<div style="margin-left:10%;margin-top:10%;" class=' demo-card-wide mdl-card mdl-shadow--2dp'>
            <div style="padding:5px" align="center" >
                  <table  class="mdl-data-table  ">
  <thead>
   
  </thead>
  <tbody>
    
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Date of Birth</td>
      <td><%String date[]=userinfo.getDob().split(" ");
      out.print(date[0]); %></td>
      <td><div style="cursor: pointer;" id="idob"><i  class="material-icons">border_color</i></div></td>
    </tr>
    <tr id="dob">
    <form action="xyz.jsp" method="get">
    <td class="mdl-data-table__cell--non-numeric"><input type="date" name="dob"></td>
    <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
  Edit
</button></td>
<td><div style="cursor: pointer;" id="cdob"><i class="material-icons">close</i></div></td></form>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Gender</td>
      <td><%= userinfo.getGender() %></td>
      <td><div style="cursor: pointer;" id="igender"><i  class="material-icons">border_color</i></div></td>
     
    </tr>
    
    <tr id="gender">
    <form action="xyz.jsp" method="get">
    <td class="mdl-data-table__cell--non-numeric"><input value="male" type="radio" name="g2" checked/>
      <label for="male"><span style="font-size: 20px ">Male</span></label><input value="female" type="radio" name="g2" checked/>
      <label for="male"><span style="font-size: 20px ">Female</span></label></td>
    <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
  Edit
</button></td>
<td><div style="cursor: pointer;" id="cgender"><i class="material-icons">close</i></div></td></form>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Interested in</td>
      <td><%= userinfo.getInterestedIn() %></td>
       <td><div style="cursor: pointer;" id="iinterest"><i class="material-icons">border_color</i></div></td>
     
    </tr>
    <tr id="interestedin">
    <form action="xyz.jsp" method="get">
    <td class="mdl-data-table__cell--non-numeric"><input type="text" name="interestedin"></td>
    <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
 Edit
</button></td>
<td><div style="cursor: pointer;" id="cinterest"><i  class="material-icons">close</i></div></td></form>
    </tr>
    
    <tr>
      <td class="mdl-data-table__cell--non-numeric">About</td>
      <td><%= userinfo.getAbout() %></td>
       <td><div style="cursor: pointer;" id="iabout"><i id="iabout" class="material-icons">border_color</i></div></td>
     
    </tr>
    <tr id="about">
    <form action="xyz.jsp" method="get">
    <td class="mdl-data-table__cell--non-numeric"><input type="text" name="about"></td>
    <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
 Edit
</button></td><td><div style="cursor: pointer;"><i id='cabout' class="material-icons">close</i></div></td></form>
    </tr>
    <%ArrayList<String> phones = new ArrayList(db.getPhone(userid));
    for(String phone:phones)
    {%>
     <tr>
    
      <td class="mdl-data-table__cell--non-numeric">Phone</td>
      <td><%= phone %></td>
      
  <td><div style="cursor: pointer;"><i class="material-icons">delete</i></div></td>
    	
    <% }%>
     <%ArrayList<String> study = new ArrayList(db.getStudy(userid));
    for(String studies:study)
    {%>
     <tr>
    
      <td class="mdl-data-table__cell--non-numeric">Studies at</td>
      <td><%= studies %></td>
      <td><div style="cursor: pointer;"><i class="material-icons">delete</i></div></td>
      
    </tr>
    	
    <% }%>
   <tr>
      <td class="mdl-data-table__cell--non-numeric">Add phone</td>
      <td><input type="number" name="phone"></td>
      <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
 Add
</button></td>
     
    </tr>
 <tr>
      <td class="mdl-data-table__cell--non-numeric">Add study</td>
      <td><input type="text" name="study"></td>
      <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
 Add
</button></td>
     
    </tr>
     <tr>
      <td class="mdl-data-table__cell--non-numeric">Add work</td>
      <td><input type="text" name="work"></td>
      <td><button style="background-color:#0288d1" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
 Add
</button></td>
     
    </tr>


      </tbody>
</table>
          
</div>
</div>
                
               
                
             
             
             

        </main>
        
      
      
      </div>
         
      </div>


</body>
</html>