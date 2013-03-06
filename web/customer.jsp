<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>
<!DOCTYPE html>
<!--[if lt IE 9]>
       <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
       <link rel="stylesheet" type="text/css" href="files/CssStyle/pages_style_ie8.css">
<![else]
        <link rel="stylesheet" type="text/css" href="files/CssStyle/pages_style_default.css">
<![endif]-->
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="files/pages-style.css">       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="files/JqueryStyle/jquery1.9.0.js"></script>
        <script src="files/JqueryStyle/jquary.js"></script>     
        <title>لیست مشتریان</title>
    </head>
    <body>      
        <section class="page">
       <%@include file="/joint/Header.jsp" %>
        <%@include file="/joint/linklist.jsp" %>    
         <%@include file="/joint/leftpanel.jsp" %>
        <section class="main-section"> 
            <article class="customer">                
           <%
      ProductSql customer=new ProductSql();
      String query_customer="SELECT * FROM rayanpardaz.customer";
      ResultSet rs_customer= customer.multisearch(query_customer);  
    %><ul><%
    do{%>
           <li><%=rs_customer.getString("name")%></li>
            <%
      }while(rs_customer.next());
     %>
     </ul>
         </article>
        </section>         
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن: 09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
