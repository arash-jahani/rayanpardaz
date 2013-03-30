        
$(document).ready(function(){
  $(".product-form-Insert").show();  
  $(".product-form-Edit").hide();
  $(".product-form-Delete").hide();
  $(".customer-form-Insert").hide();
  $(".customer-form-Delete").hide(); 
  $(".link-form-Insert").hide(); 
  $(".link-form-Delete").hide(); 
  $(".image-form-Insert").hide();
  $(".product-image-Delete").hide();
  $(".product-Insert").click(function(){
      $(".product-form-Insert").show();  
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide(); 
      $(".link-form-Delete").hide(); 
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".product-Edit").click(function(){
      $(".product-form-Insert").hide();  
      $(".product-form-Edit").show();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide(); 
      $(".link-form-Delete").hide(); 
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".product-Delete").click(function(){
      $(".product-form-Insert").hide();  
      $(".product-form-Edit").hide();
      $(".product-form-Delete").show();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide(); 
      $(".link-form-Delete").hide();
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".customer-Insert").click(function(){
      $(".product-form-Insert").hide()  ;
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").show();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide(); 
      $(".link-form-Delete").hide();
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".customer-Delete").click(function(){
      $(".product-form-Insert").hide()  ;
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").show(); 
      $(".link-form-Insert").hide(); 
      $(".link-form-Delete").hide(); 
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".link-Insert").click(function(){
      $(".product-form-Insert").hide();
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").show(); 
      $(".link-form-Delete").hide(); 
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".link-Delete").click(function(){
      $(".product-form-Insert").hide();
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide() ;
      $(".link-form-Delete").show(); 
      $(".image-form-Insert").hide();
      $(".product-image-Delete").hide();
  });
  $(".image-Insert").click(function(){
      $(".product-form-Insert").hide();
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide() ;
      $(".link-form-Delete").hide() ;
      $(".image-form-Insert").show();
      $(".product-image-Delete").hide();
  });
  $(".image-Delete").click(function(){
      $(".product-form-Insert").hide();
      $(".product-form-Edit").hide();
      $(".product-form-Delete").hide();
      $(".customer-form-Insert").hide();
      $(".customer-form-Delete").hide(); 
      $(".link-form-Insert").hide() ;
      $(".link-form-Delete").hide() ;
      $(".image-form-Insert").hide();
      $(".product-image-Delete").show();
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




