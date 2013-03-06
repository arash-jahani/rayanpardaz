<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash 
--%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="files/CssStyle/Default.css">
<!--[if lt IE 9]>
       <script src="files/shiv.js"></script>
       <link rel="stylesheet" type="text/css" href="files/CssStyle/IE8.css">
<![endif]-->
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>          
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="files/JqueryStyle/jquery1.9.0.js"></script>
        <script src="files/JqueryStyle/jquary.js"></script>
        <title>ماشین های اداری رایان پرداز</title>
    </head>
    <body>
        
        <section class="incan" id="incan">
            <article class="full-circle"><a href="index.jsp"><img src="files/pics/home.png" width="30" height="30"></a></article>            
            <article class="full-circle"><a href="customer.jsp"><img src="files/pics/customer.png" width="30" height="30"></a></article>            
            <article class="full-circle"><a href="Driver.jsp"><img src="files/pics/driver.png" width="30" height="30"></a></article>            
            <article class="full-circle"><a href="about.jsp"><img src="files/pics/info.png" width="30" height="30"></a></article>            
        </section>
       
        
         <section class="product-nav" id="product-nav">
            <%
      ProductSql cat=new ProductSql();
      String query="SELECT * FROM rayanpardaz.category";
      ResultSet rs= cat.multisearch(query);  
    %><ul><%
    do{%>      
            <%String links_code=rs.getString("id");%>
            <%String links_type=rs.getString("type"); %>
           <li><a href="temp.jsp?code=<%=links_code%>"><%=links_type%></a></li>
            <%
      }while(rs.next());      
     %>  
           </ul>
        </section>   
    </body>
</html>
