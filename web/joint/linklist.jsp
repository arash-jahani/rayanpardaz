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
        <link rel="stylesheet" type="text/css" href="files/CssStyle/pages-style.css">       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ماشین های اداری رایان پرداز</title>
    </head>
    <body>      
         <nav class="product-nav">
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
        </nav>   
    </body>
</html>
