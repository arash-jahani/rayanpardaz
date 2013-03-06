  //be mahze focus shodan bar roye Summery mahsolat faqat baskhshe darke mahsolate jadid nemayesh dade shavad
  
  $(document).ready(function(){
  $(".main-section-product").slideUp('slow');
  $(".main-section-customer").slideUp('slow');
  $(".main-section-links").slideUp('slow');
  
  $("#product").click(function(){
      $(".main-section-product").slideToggle('slow');
      $(".form-Insert").show();
      $(".form-Delete").hide();
      $(".form-Edit").hide();   
  });
  $("#customer").click(function(){
      $(".main-section-customer").slideToggle('slow');
      $(".form-Insert").show();
    $(".form-Delete").hide();
  });
  
  $("#links").click(function(){
      $(".main-section-links").slideToggle('slow');
      $(".form-Insert").show();
      $(".form-Delete").hide();    
  });
});  
   
   
// 3 mojmoe dastorate zir baraye namayesh form hayi ke bar roye yek dighar qarar darand
$(document).ready(function(){
  
  $(".link-Insert").click(function(){
     $(".form-Delete").hide();
     $(".form-Edit").hide();
     $(".form-Insert").show();
  });
  $(".link-Edit").click(function(){
     $(".form-Insert").hide();
     $(".form-Delete").hide();          
     $(".form-Edit").show();         
  });
  $(".link-Delete").click(function(){
     $(".form-Insert").hide();
     $(".form-Edit").hide();        
     $(".form-Delete").show();
  });
});
//$(document).ready(function(){
//  $(".field").focus(function(){
//    $(".producttype").hide(); 
//  });
//});
//leftpanle animate
$(document).ready(function(){
  $("#panel").mouseenter(function(){      
     $("#panel").animate({left:'-30px'});
  });
});
$(document).ready(function(){
  $("#panel").mouseleave(function(){      
     $("#panel").animate({left:'-165px'},'slow');
  });
});
//panele tabliqat

$(document).ready(function(){
    $("#incan").hide();
    $(Window).scroll(function(){        
        var offset = $("#incan").offset();        
        var offset=offset.top;
        
         if(offset>320) {                   
         $("#incan").show();
        }else{
            $("#incan").hide();
        }        
    });
});

// product navbar in IE8
$(function(){
var userAgent = navigator.userAgent.toLowerCase();
var userBrowserName  = navigator.appName.toLowerCase();
// Figure out what browser is being used
$.browser = {
	version: (userAgent.match( /.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/ ) || [0,'0'])[1],
	safari: /webkit/.test( userAgent ),
	opera: /opera/.test( userAgent ),
	msie: /msie/.test( userAgent ) && !/opera/.test( userAgent ),
	mozilla: /mozilla/.test( userAgent ) && !/(compatible|webkit)/.test( userAgent ),
	name:userBrowserName
};
if ($.browser.msie && parseInt($.browser.version)===8){
    $("#incan").hide();
    $(document).ready(function(){        
    $(window).on('scroll',function(){        
        var offset =$("#product-nav").offset(); 
        var offset=offset.top;       
        if(offset>300) {             
             $(".product-nav").css('margin-top','-80px');             
             if(offset>600){
                $("#incan").css('margin-top','-260px');
                $("#incan").show();
            }
            }else{ 
                $(".product-nav").css('margin-top','0px');                
                $("#incan").hide();
            }    
        });
    });
}
if ($.browser.opera){
    $("#incan").hide();
    $(document).ready(function(){        
    $(window).on('scroll',function(){        
        var offset =$("#incan").offset();
        var offset=offset.top;
        if(offset<300) {                                                     
             $("#incan").hide();//animate({'right':'-220px'},'fast');
        }else{                                
             $("#incan").show();//animate({'right':'200px'},'fast'); 
            }    
        });
    });
}
});




