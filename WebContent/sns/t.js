 $(document).ready(function(){ 
      //  alert();
     var dialog2 = document.querySelector('#loginDialog');
        if (! dialog2.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog2.showModal();
     
     var dialog = document.querySelector('#signupDialog');
        if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog.close();

      $('#create').click(function(){
           var dialog2 = document.querySelector('#loginDialog');
        if (! dialog2.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog2.close();
     
     var dialog = document.querySelector('#signupDialog');
        if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog.showModal();
      })
    // });

 $('#signinbtn').click(function(){
           var dialog2 = document.querySelector('#loginDialog');
        if (! dialog2.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog2.showModal();
     
     var dialog = document.querySelector('#signupDialog');
        if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog2);
    }
    
      dialog.close();
    })
 }); 
    