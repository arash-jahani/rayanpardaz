<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
    <head>  
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" type="text/css" href="files/CssStyle/about-page-style.css">
        <link rel="stylesheet" type="text/css" href="files/CssStyle/Default.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="files/JqueryStyle/jquery1.9.0.js"></script>
        <script src="files/JqueryStyle/jquary.js"></script>       
        <script type="text/javascript" src="files/ClientHits.js"></script>
        <title>تماس با  ما  </title>
    </head>
    <body>      
        <section class="page">
        <%@include file="/joint/Header.jsp" %>
        <%@include file="/joint/linklist.jsp" %>          
         <section class="main-section" style="height: auto;direction: rtl">                                                                      
             <form class="form-Insert"  accept-charset="UTF-8"  style="margin-top: 50px">                                                    
                            <label >نیازمند:</label>
                            <select  id="service" style="margin-right: 150px">
                                <option value="خرید">خرید</option>
                                <option value="فروش">فروش</option>
                                <option value="تعمیر">تعمیر</option>                                
                            </select> 
                            <label>هستم.</label>
                                <br>
                                <label>     نام ونام خانوادگی:</label>
                                <input type="text" placeholder="Full Name"  id="fullname"  maxlength="20" style="margin-right: 150px"> <br>
                                <label >شماره تماس:</label>
                                <input type="text" placeholder="Phone Number" id="tell"  maxlength="11" style="margin-right: 150px"> 
                                <br>                                
                                 <input type="button" id="send-message" value="ارسال" class="submit-btn" onclick="SendMessage();">
                                <input type="reset" value="پاک کردن" class="submit-btn">   
                                <span id="message-status" ></span>
                              </form>                    
        </section> 
        <footer> 
            <br>
            <h4>آدرس: قزوین، خیابان فلسطین شرقی، نرسیده به توحید، روبروی نانوایی بربری پلاک 71 <br>تلفکس: 02813358124 &nbsp;&nbsp;&nbsp;تلفن:09102081638</h4>                 
        </footer>
        </section>
    </body>
</html>
