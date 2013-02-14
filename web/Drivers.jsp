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
        <title>ماشین های اداری رایان پرداز</title>
    </head>
    <body>      
        <section class="page">
        <nav class="main-navbar">
            <a href="index.jsp">صفحه اصلی</a>
            <a href="index.jsp">لبست مشتریان</a>   
            <a href="Drivers.jsp.jsp">لبست درایورها</a> 
            <a href="index.jsp">ارتباط با ما</a>            
        </nav>
        <header class="page-header">
            <img src="files/pics/header.jpg">
        </header>
        <nav class="product-nav">
            <ul>
                <li> <a href="Copy.jsp" >فتوکپی</a>
                <li><a href="Printer.jsp">پرینتر</a>
                <li><a href="ChPrinter.jsp">چک پرینتر</a>
                <li><a href="Fax.jsp">فاکس</a>
                <li><a href="Scanner.jsp">انواع اسکنر </a>
                <li><a href="Money.jsp">پولشمار </a>
                <li><a href="TMoney.jsp"> تست اسکناس</a> 
                <li><a href="Store.jsp">صندوق فروشگاهی</a>
                <li><a href="Monitor.jsp">مانیتور</a>
                <li><a href="Computer.jsp">کامپیوتر و لپ تاپ</a>
                <li><a href="Projector.jsp">ویدئو/دیتا پروژکتور</a>
                <li><a href="Consumable.jsp">کالای مصرفی</a>
           </ul>
        </nav>               
        <section class="main-section">   
           <article class="customer">
               <%
      ProductSql driver=new ProductSql();
      String query="SELECT * FROM rayanpardaz.driver";
      ResultSet rs= driver.multisearch(query);  
    %><ul><%
    do{%>       
    <li><a href="<%=rs.getString("link")%>" target="_blanck" >       <%=rs.getString("name")%></a></li>        
            <%
      }while(rs.next());
     %>
     </ul>
           </article>
        </section>         
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن:09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
