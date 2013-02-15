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
        <section class="page">
        <%@include file="/joint/Header.jsp" %>
        <%@include file="/joint/linklist.jsp" %>        
     <section class="main-section">                           
    <%
    ProductSql cat2=new ProductSql();
    String query2="SELECT * FROM rayanpardaz.category";
    ResultSet rs2= cat.multisearch(query);  
    do{%>      
            <%String code2=rs2.getString("id");%>
            <%String type2=rs2.getString("type"); %>
            <figure class="img-polaroid " >                
                <img src="files/pics/<%=code2%>.jpg" class="img-setsize " >
                <figcaption><a href="temp.jsp?code=<%=code2%>" ><%=type2%></a></figcaption>
                </figure>         
             <%
      }while(rs2.next());    
     %>      
        </section>                       
           <section class="new-product">
               <header>جدیدترین محصولات</header>
               <article>                  
               </article>
           </section>         
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن:09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
