<%-- 
    Document   : Copy
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>
<%@page import="pack.ConvertDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ConvertDate date=new ConvertDate();%>
<% String code=request.getParameter("code"); %>
<%  
    ProductSql product=new ProductSql();
    ResultSet rs_type;              
    rs_type=product.multisearch("SELECT * FROM rayanpardaz.category where id='"+code+"' ");
    String ProductName=rs_type.getString("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="files/pages-style.css">       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ماشین های اداری رایان پرداز</title>
    </head>
    <body>      
        <section class="page">
       <%@include file="joint/Header.jsp" %>
       <%@include file="joint/linklist.jsp" %>    
        <section class="new-product">   
            <header><%=ProductName %></header>
           <%try{                        
        ResultSet rs_device; 
        rs_device=product.eachproduct("Select * from rayanpardaz.product where type='"+code+"'");  
        rs_device.beforeFirst();
      %>
           <%while(rs_device.next()){%>
               <article class="product-price"> 
                     <%=rs_device.getString("price") %>&nbsp;ریال
               </article>
               <article class="each-product">
               <article class="product-id"> 
                    <%=rs_device.getString("id") %>
               </article>                                        
                    <img src="files/pics/Consumable.jpg" width="150" height="150" >                                                                               
                    <p><%=ProductName %>&nbsp;<%=rs_device.getString("name") %><br>
                     <%=rs_device.getString("oldornew") %>&nbsp;&nbsp;<%=date.getdate(rs_device.getString("date")) %>&nbsp;</p>
                     <textarea readonly><%=rs_device.getString("des")%></textarea>                                                                        
               </article>          
           <%}
       }catch(Exception ex){%>
                                                   
        <%}%>
        </section>         
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن: 09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
