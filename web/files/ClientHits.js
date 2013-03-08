
function showimage(input){   
    if (input.files && input.files[0])
    {       
        var reader = new FileReader();
       reader.onload = function (e)
          {             
           document.getElementById('image').src=e.target.result;           
          };
       reader.readAsDataURL(input.files[0]);       
     }
}
var xmlhttp;
function GetXmlHttpObject(){
    if (window.XMLHttpRequest)
    {
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}
function InsertProduct(){  
    var id=document.getElementById('product-id').value;
    var producttype=document.getElementById('producttype').value;    
    var oldornew=document.getElementById('oldornew').value;
    var productname=document.getElementById('productname').value;
    var price=document.getElementById('price').value;
    var des=document.getElementById('des').value;
    var date=document.getElementById('date').value;    
   var imagepath=document.getElementById('imagepath').files[0];   
    var insert_product_submit=document.getElementById('insert-product-submit').value;//IPSsubmit==Insert Product Submit
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {
    var id=parseInt(document.getElementById('product-id').innerText);
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("status").innerHTML=xmlhttp.responseText;             
            document.getElementById("product-id").innerText=id+1;
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("status").innerHTML="waiting...";
        }else{
            document.getElementById("status").innerHTML="Server Error!";
        }
    };
    var parameters="id="+id+"&producttype=" + producttype +"&oldornew=" + oldornew +"&productname=" + productname +"&price=" 
            + price +"&des=" + des +"&date=" + date +"&imagepath=" + imagepath +"&insert-product-submit=" 
            + insert_product_submit;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}

function EditProduct(){   
    var id=document.getElementById('key').value;
    var producttype=document.getElementById('producttype').value;    
    var oldornew=document.getElementById('oldornew').value;
    var productname=document.getElementById('productname').value;
   var price=document.getElementById('price').value;
    var des=document.getElementById('des').value;    
    var imagepath=document.getElementById('imagepath').value;
    var edit_product_submit=document.getElementById('edit-product-submit').value;//IPSsubmit==Insert Product Submit    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("status").innerHTML="waiting...";
        }else{
            document.getElementById("status").innerHTML="Server Error!";
        }
    };
    var parameters= "id="+id+"&producttype=" + producttype +"&oldornew=" + oldornew +"&productname=" + productname +"&price=" 
            + price +"&des=" + des +"&imagepath=" + imagepath +"&edit-product-submit=" 
            + edit_product_submit;
    alert(parameters);
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}

function DeleteProduct(){   
    var id=document.getElementById('key').value;    
    var Delete_product_submit=document.getElementById('Delete-product-submit').value;//IPSsubmit==Insert Product Submit    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("Delete-status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("Delete-status").innerHTML="waiting...";
        }else{
            document.getElementById("Delete-status").innerHTML="Server Error!";
        }
    };
    var parameters= "id="+id+"&Delete-product-submit=" + Delete_product_submit;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function InsertCustomer(){   
    var Customer=document.getElementById('customername').value;        
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("Customer_insert_status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("Customer_insert_status").innerHTML="waiting...";
        }else{
            document.getElementById("Customer_insert_status").innerHTML="Server Error!";
        }
    };
    var parameters= "cname="+Customer;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function DeleteCustomer(){   
    var Customer=document.getElementById('customernamed').value;        
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("customer_delete_status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("customer_delete_status").innerHTML="waiting...";
        }else{
            document.getElementById("customer_delete_status").innerHTML="Server Error!";
        }
    };
    var parameters= "cdname="+Customer;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function InsertLink(){   
    var drivername=document.getElementById('drivername').value; 
    var link=document.getElementById('link').value; 
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("link_insert_status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("link_insert_status").innerHTML="waiting...";
        }else{
            document.getElementById("link_insert_status").innerHTML="Server Error!";
        }
    };
    var parameters= "drivername="+drivername+"&link="+link;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function DeleteLink(){   
    var drivernamed=document.getElementById('drivernamed').value;        
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("link-delete-status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("link-delete-status").innerHTML="waiting...";
        }else{
            document.getElementById("link-delete-status").innerHTML="Server Error!";
        }
    };
    var parameters= "drivernamed="+drivernamed;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function SendMessage(){
    var service=document.getElementById("service").value;
    var fullname=document.getElementById("fullname").value;
    var tell=document.getElementById("tell").value;
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=function()
    {    
    if (xmlhttp.readyState===4 && xmlhttp.status===200 )
        {
            document.getElementById("message-status").innerHTML=xmlhttp.responseText;                         
        }else if(xmlhttp.readyState===0 ||xmlhttp.readyState===1 ||xmlhttp.readyState===2 ||xmlhttp.readyState===3 ){
             document.getElementById("message-status").innerHTML="waiting...";
        }else{
            document.getElementById("message-status").innerHTML="Server Error!";
        }
    };
    var parameter="service="+service+"&fullname="+fullname+"&tell="+tell;
    xmlhttp.open("POST","server.jsp",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);
}