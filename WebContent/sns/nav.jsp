  <%@ page import="com.db.*" %>
 
  <style>
    .dot {
    height: 10px;
    width: 10px;
    background-color: red;
    border-radius: 50%;
    display: inline-block;
}</style>
  <%int userid = (int)session.getAttribute("userid"); 


dbConnection db = (dbConnection)session.getAttribute("db"); %>
 <a class="mdl-navigation__link" href="home.jsp"> <i class="material-icons">home</i> Home</a>
<% if(db.checkNot(userid)){%>
            <a class="mdl-navigation__link" href="notification.jsp"> <i class="material-icons">public</i> Notification<span class="dot"></span></a>
            <%}else {%>
            <a class="mdl-navigation__link" href="notification.jsp"> <i class="material-icons">public</i> Notification</a>
            <% }if(db.checkMsg(userid)){%>
            <a class="mdl-navigation__link" href="msg.jsp"> <i class="material-icons">message</i> Message<span class="dot"></span></a>
            <%}else{ %>
             <a class="mdl-navigation__link" href="msg.jsp"> <i class="material-icons">message</i> Message</a>
             <%} %>
            <a class="mdl-navigation__link" href="myprofile.jsp"> <i class="material-icons">account_circle</i> My Profile</a>
            <div class="android-drawer-separator"></div>