<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    if(session.getAttribute("userid")!= null){
    response.sendRedirect("home.jsp");
    }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>


    <link rel="stylesheet" href="home.css">
    <script src="t.js"></script>
<link rel="stylesheet" href="t.css"/>

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script type="text/javascript" src="home.js"></script>
</head>
<body style="background-color:dodgerblue">
     <!-- log in dialog-->
     <!-- log in dialog-->
     <!--<div id="logo">
         <p><b>SNS</b></p></div> -->
<script>
$(document).ready(function()
		{$('#hide').click(function()
				{
		      $('#loginDialog').show();
		      $('signupDialog').hide();
				})
	
		});
</script>

<!--SIGN IN DIALOG BOX.......................................................................................................-->

<form action="log.jsp" method="post">
        <dialog id="loginDialog" style="width:30% ;height: 70%" class="mdl-dialog">
          <h4 class="mdl-dialog__title" align='left'><span style="color: blue">S</span><span style="color:orange">N</span><span style="color: blue">S</span></h4>
    <h4 class="mdl-dialog__title"><span style="font-size: 20px">Sign In</span></h4>
    <p id="error" style="color:red"></p>
    <div class="mdl-dialog__content">
     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" name="email" required>
    <label class="mdl-textfield__label" for="sample3">Email...</label>
  </div>
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="password" name="password" required>
    <label class="mdl-textfield__label" for="sample3">Password...</label>
  </div>
    </div>
    <div style="margin: 5px" class="mdl-dialog__actions">
   <br><br><br> <br/><br/><br/>
      <button id="signbtn"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">
       Sign In
       </button>
      
       <!--<button align="left" id="create" type="button" class="mdl-button close">Create Account</button>-->
       <div  style="margin:5px " id="loginspinner" class="loader mdl-spinner mdl-js-spinner is-active"></div>
       <div  id="create" type="button"class=" mdl-button mdl-button--colored">Create Account</div>




    
    </div>
  </dialog>
</form>

<!--SIGN UP DIALOG FINAL-->
<form  method="get" action="reg.jsp">
        <dialog id="signupDialog" style="width:55% ;height: 80%" class="mdl-dialog">
          <h4 class="mdl-dialog__title" align='left'><span style="color: blue">S</span><span style="color:orange">N</span><span style="color: blue">S</span></h4>
    <h4 class="mdl-dialog__title"><span style="font-size: 20px">Sign Up</span></h4>
    <p id="error" style="color:red"></p>
    <div class="mdl-dialog__content">
     <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="email" name="email" required>
    <label class="mdl-textfield__label" fog2r="sample3">Email</label>
  </div><br/>
  <div style="margin: 10px;"class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" name="fname" required>
    <label class="mdl-textfield__label" for="sample3">First name</label>
  </div>
  <div style="margin: 10px;" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" name="sname" required>
    <label class="mdl-textfield__label" for="sample3">Surname</label>
  </div>
  <div style="margin: 10px;" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="date" name="dob" required>
    <label class="mdl-textfield__label" for="sample3"></label>
  </div>

<div id="gender" style="margin-left:55%;margin-top: -46px">
<div class="md-radio md-radio-inline">
      <input value="male" type="radio" name="gender" checked/>
      <label for="male"><span style="font-size: 20px ">Male</span></label>
    </div>
    <div style="margin-left: 32%; margin-top: -22px" class="md-radio md-radio-inline">
      <input value="female" type="radio" name="gender">
      <label for="female"><span style="font-size: 20px ">Female</span></label>
    </div>
  </div>
  
  <div style="margin: 10px;" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="password" name="password" required>
    <label class="mdl-textfield__label" for="sample3">Password...</label>
  </div>
   <div style="margin: 10px;" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="password" name="cpassword" required>
    <label class="mdl-textfield__label" for="sample3"> Confirm Password...</label>
  </div>


  

      </div>
    <div style="width:80% ;height:10px;" class="mdl-dialog__actions">
   <br><br><br> <br/><br/><br/>
      <button  style="margin:60px" id="signbtn"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">
      Sign up
       </button>
       <div  style="margin:5%" id="signinbtn"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">
       <i class="material-icons">keyboard_backspace</i>

       </div>
      


       <div  id="loginspinner" class="loader mdl-spinner mdl-js-spinner is-active"></div>

      
       
       <div id="signupspinner" class="loader mdl-spinner mdl-js-spinner is-active"></div>
    </div>


    <!--<button align="left" id="create" type="button" class="mdl-button close">Create Account</button>-->
    </div>
  </dialog>
  </form>
  




</body>
</html>