<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="files/CssStyle/pages-style.css">             
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ارسال درخواست</title>
    </head>
    <body>      
        <section class="page">
        <%@include file="/joint/Header.jsp" %>
        <%@include file="/joint/linklist.jsp" %>               
        <section class="main-section">   
            <article class="customer">
                <ul>
                    <li>کد محصول مورد نظر به همراه مشخصات خود را وارد نمایید،در خواست شما را پیگیری کرده و محصول را ارسال میکنیم.</li>
                    <li>اگر قصد تعمیر وسیله ای را دارید،واژه "تعمیر" را در  فیلد کد وارد نمایید</li>                    
                </ul>
                <% if(request.getParameter("submit")==null){ %> <!--barasi inke,aya karbar avalin bar ast ke varede form mishavad ya qablan niz hozr dashte-->
                        <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >                            
                            
                            <label>     کد محصول:</label>
                                <input type="text" placeholder="Typing Code"  name="code" style="margin-right: 66px;">                                                                                                                                                                                   
                                <br>                                
                                <label >نام و نام خانوادگی:</label>
                                <input type="text" placeholder="Your Name" name="name" style="margin-right: 17px"> 
                                <br>
                                 <label >شماره تلفن:</label>
                                <input type="text" placeholder="Phone Number" name="phone" style="margin-right: 59px"> 
                                <br><br>
                                <label>توضیحات :</label><br>
                                <textarea name="des" style="margin-right: 150px" placeholder="Description"></textarea>     <br>                           
                                <input type="submit" name="submit" value="ثبت" class="submit-btn">
                                <input type="reset" value="پاک کردن" class="submit-btn">                           
                       </form>
                         <%}else%>
                        
                        <%%>
            </article>
        </section>         
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن:09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
