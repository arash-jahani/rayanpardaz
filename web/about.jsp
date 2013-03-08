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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="files/CssStyle/pages-style.css">
        <link rel="stylesheet" type="text/css" href="files/CssStyle/manage-page-style.css">
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
         <%@include file="/joint/leftpanel.jsp" %>
         <section class="main-section" style="height: auto">   
                                                                   
                             <form class="form-Insert"  accept-charset="UTF-8"  >                                                    
                            <label>نیازمند:</label>
                                <select  id="service">
                                <option value="خرید">خرید</option>
                                <option value="فروش">فروش</option>
                                <option value="تعمیر">تعمیر</option>                                
                            </select> 
                            <label>هستم.</label>
                                <br>
                                <label>     نام ونام خانوادگی:</label>
                                <input type="text" placeholder="Full Name"  id="fullname" style="margin-right: 10px;" maxlength="20"> <br>
                                <label >شماره تماس:</label>
                                <input type="text" placeholder="Phone Number" id="tell" style="margin-right: 40px" maxlength="11"> 
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
