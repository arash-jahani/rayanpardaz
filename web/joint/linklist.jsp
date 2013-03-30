<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash 
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>     
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
