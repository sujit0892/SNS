<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% dbConnection db = new dbConnection();
UserInfo userinfo= db.getInformation(101); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
<title>
        Home1
    </title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style><%out.print(".android-drawer-separator {"+"height: 1px;"+"background-color: #dcdcdc;"+"margin: 8px 0;"+"}"+".demo-avatar {"+" background-image: url('"+userinfo.getPicurl()+"');"+"background-position: center;"+"background-size: cover;"+"width: 100px;"+"height: 100px;"+"border-radius: 50px;"+"margin-left: 50px"+"}");%>
</style>
</head>
<body>

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
                <input style="background-color:white;color:black" class="mdl-textfield__input" type="text" name="sample" id="waterfall-exp">
              </div>
            </div>
              <!-- Right aligned menu below button -->
              <button id="demo-menu-lower-right"
               class="mdl-button mdl-js-button mdl-button--icon">
                <i class="material-icons">more_vert</i>
              </button>
      
              <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
              for="demo-menu-lower-right">
              <li class="mdl-menu__item">Edit Profile</li>
              <li class="mdl-menu__item">Sign Out</li>
        
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
          
          <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href=""> <i class="material-icons">home</i> Home</a>
            <a class="mdl-navigation__link" href=""> <i class="material-icons">public</i> Notification</a>
            <a class="mdl-navigation__link" href=""> <i class="material-icons">message</i> Message</a>
            <a class="mdl-navigation__link" href=""> <i class="material-icons">account_circle</i> My Profile</a>
            <div class="android-drawer-separator"></div>
            
           </nav>

        </div>
        <main id="a"class="mdl-layout__content">       
      
        </main>
      
      
      </div>
         
      </div>
      

</body>
</html>