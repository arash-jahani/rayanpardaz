<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="files/pages-style.css">       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>لیست مشتریان</title>
    </head>
    <body>      
        <section class="page">
       <%@include file="/joint/Header.jsp" %>
        <%@include file="/joint/linklist.jsp" %>                
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
