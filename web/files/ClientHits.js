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
function stateChanged()
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
}

function InsertProduct(){          
    var producttype=document.getElementById('producttype').innerText;    
    var oldornew=document.getElementById('oldornew').value;
    var productname=document.getElementById('productname').value;
    var price=document.getElementById('price').value;
    var des=document.getElementById('des').value;
    var date=document.getElementById('date').value;
    var imagepath=document.getElementById('imagepath').value;
    var insert_product_submit=document.getElementById('insert-product-submit').value;//IPSsubmit==Insert Product Submit
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp===null)
        {
        alert ("Please Use New Version Of Browsers!");
        return;
        }            
    xmlhttp.onreadystatechange=stateChanged;
    var parameters="producttype=" + producttype +"&oldornew=" + oldornew +"&productname=" + productname +"&price=" 
            + price +"&des=" + des +"&date=" + date +"&imagepath=" + imagepath +"&insert-product-submit=" 
            + insert_product_submit;
    xmlhttp.open("POST","server.jsp",true);     
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");    
    xmlhttp.send(parameters);    
}
function showimage(input){
    //var imagepath=document.getElementById('imagepath').value.split('/').pop().split('\\').pop();   
    //alert(imagepath);
    //document.getElementById('image').src=imagepath;
   // alert(document.getElementById('image').src);
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

