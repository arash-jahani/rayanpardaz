<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>
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
            <a href="customer.jsp">لبست مشتریان</a>     
            <a href="Drivers.jsp.jsp">لبست درایورها</a> 
            <a href="about.jsp">ارتباط با ما</a>            
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
            <%-- 1 row --%>
            <figure class="img-polaroid " >                
                <img src="files/pics/Copier.jpg" class="img-setsize " >
                <figcaption><a href="Copy.jsp" >فتوکپی</a></figcaption>
                </figure>         
             <figure class="img-polaroid " >                
                 <img src="files/pics/printer.jpg" class="img-setsize " >
                <figcaption><a href="Printer.jsp">پرینتر</a></figcaption>
                </figure> 
           <figure class="img-polaroid " >                
               <img src="files/pics/check.jpg" class="img-setsize " >
                <figcaption><a href="ChPrinter.jsp">چک پرینتر</a></figcaption>
                </figure> 
             <figure class="img-polaroid " >                
                 <img src="files/pics/Facsimiles.jpg" class="img-setsize " >
                <figcaption><a href="Fax.jsp">فاکس</a></figcaption>
                </figure>           
            <%-- 2 row --%>
            <figure class="img-polaroid " >                
                <img src="files/pics/Scanner.jpg" class="img-setsize " >
                <figcaption><a href="Scanner.jsp">انواع اسکنر </a></figcaption>
                </figure>         
             <figure class="img-polaroid " >                
                 <img src="files/pics/polshomar.jpg" class="img-setsize " >
                <figcaption><a href="Money.jsp">پولشمار </a></figcaption>
                </figure> 
           <figure class="img-polaroid " >                
               <img src="files/pics/test.jpg" class="img-setsize " >
                <figcaption><a href="TMoney.jsp"> تست اسکناس</a></figcaption>
                </figure> 
             <figure class="img-polaroid " >                
                 <img src="files/pics/CashRegister.jpg" class="img-setsize " >
                <figcaption><a href="Store.jsp">صندوق فروشگاهی</a></figcaption>
                </figure>           
             <%-- 3 row --%>
           <figure class="img-polaroid " >                
               <img src="files/pics/Projector.jpg" class="img-setsize " >
                <figcaption><a href="Projector.jsp">ویدئو/دیتا پروژکتور</a></figcaption>
                </figure>         
             <figure class="img-polaroid " >                
                 <img src="files/pics/loptop.jpg" class="img-setsize " >
                <figcaption><a href="Computer.jsp">کامپیوتر و لپ تاپ</a></figcaption>
                </figure> 
           <figure class="img-polaroid " >                
               <img src="files/pics/monitor.jpg" class="img-setsize " >
                <figcaption><a href="Monitor.jsp">مانیتور</a></figcaption>
                </figure> 
             <figure class="img-polaroid " >                
                 <img src="files/pics/Consumable.jpg" class="img-setsize " >
                <figcaption><a href="Consumable.jsp">کالای مصرفی</a></figcaption>
                </figure>           
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
