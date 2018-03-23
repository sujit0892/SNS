<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
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
 <link rel="stylesheet" href="home.css">
 <script type="text/javascript">
 function load()
 {   
 var filetoUpload=document.getElementById("ID").files[0];
 
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
       
     },
     function error(err){

     },
     function complete(){
        downloadURL = task.snapshot.downloadURL;
        
         window.location.replace("uploadPicture2.jsp?url="+downloadURL);
     }
 ); }
 }
 </script>
</head>
<body style="background-color:dodgerblue">

  
  <style>
.demo-card-wide.mdl-card {
  width: 512px;
}
.demo-card-wide > .mdl-card__title {
  color: #fff;
  height: 176px;
  background: url('../assets/demos/welcome_card.jpg') center / cover;
}
.demo-card-wide > .mdl-card__menu {
  color: #fff;
}
</style>

  
<div align='center' style="margin-left:25%;" class=' demo-card-wide mdl-card mdl-shadow--2dp'>
 <h4 class="mdl-dialog__title" align='left'><span style="color: blue">S</span><span style="color:orange">N</span><span style="color: blue">S</span></h4>
    <h4 class="mdl-dialog__title"><span style="font-size: 20px">Upload profile pic</span></h4>

<div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
  <input class="mdl-textfield__input" placeholder="No file chosen" type="text" id="TEXT_ID" readonly />
  <div class="mdl-button mdl-button--icon mdl-button--file">
    <i class="material-icons">add_a_photo</i>
    <input type="file" name="NAME"   accept="image/*" id="ID" onchange="document.getElementById('TEXT_ID').value=this.files[0].name;document.getElementById('TEXT_ID').style.display='block';"/>
  </div>
</div>
  <div style="margin-left:75%">
                     <button id ="post" class = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="load()">post
                  </button>
                  </div>
</div>


</body>
</html>