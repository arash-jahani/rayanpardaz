<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash jahani 09367857892 arash.jahani13@gmail.com
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.ProductSql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductSql product=new ProductSql();
    Boolean QueryStatus=false;
    String InsertQuery;
    String DeleteQuery;
    request.setCharacterEncoding("UTF-8");      
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../files/CssStyle/manage-page-style.css">       
        <script src="../files/JqueryStyle/jquery1.9.0.js"></script>
        <script src="../files/JqueryStyle/jquary.js"></script>
        <script type="text/javascript" src="../files/ClientHits.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <title>ثبت وقایع</title>       
    </head>
    <body>  
        <%
            Cookie[] list=request.getCookies();
            if(list !=null){                
               if((list[0].getName().equals("username"))&&(list[0].getValue().equals("1"))&&
                       (list[1].getName().equals("password"))&&(list[1].getValue().equals("1"))){%>                   
        <section class="page">                            
                <section class="main-section">
                    <article class="panel">  
                        <ul>
                            <li>محصولات</li>
                            <ul>
                                <li class="product-Insert">افزودن محصول جدید </li>                                 
                                <li class="product-Edit">                            ویرایش اطلاعات محصول
                                <li class="product-Delete">حذف محصول  
                                 <li class="image-Insert">افزودن تصویر </li>
                                 <li class="image-Delete">حذف تصویر </li>
                            </ul>
                            <li>مشتریان</li>
                            <ul>
                                <li class="customer-Insert">افزودن مشتری جدید </li>
                                <li class="customer-Delete">حذف مشتری  
                            </ul>
                            <li>لینک ها</li>
                            <ul> 
                                <li class="link-Insert">افزودن 
                                <li class="link-Delete">حذف  
                           </ul>
                        </ul>
                    </article>
                    <section class="info-section"  >                                                       
                        <form class="product-form-Insert"  accept-charset="UTF-8" enctype="multipart/form-data" >
                            <label class="header"> محصول جدید با شناسه :</label>                               
                            <label class="header" id="product-id" > 
                                <% ProductSql lastrecord=new ProductSql();%> 
                                <%= lastrecord.getLastRecord() %> </label>
                                <label class="header">در :</label>
                                <%DateTime now=new DateTime();%>    
                                <input type="text"  id="date"  style="background-color: #eee;text-align: center;" value="<%=now.toString("yyyy-MM-dd") %>">
                              <br>
                            <label>نوع محصول:</label>
                            <select  id="producttype">
                                <option value="1">فتوکپی</option>
                                <option value="2">پرینتر</option>
                                <option value="3">چک پرینتر</option>
                                <option value="4">فاکس</option>
                                <option value="6">پولشمار</option>                                    
                                <option value="7">تست اسکناس</option>
                                <option value="5">اسکنر</option>
                                <option value="11">مانیتور</option>                                    
                                <option value="10">کامپیوتر و لپ تاپ</option>
                                <option value="9">ویدئو/دیتا پرژکتور</option>
                                <option value="8">صندوق فروشگاهی</option>
                                <option value="12">کالای مصرفی</option>
                            </select><br>
                            <label>کارکرد دستگاه:</label>
                             <select id="oldornew">
                                <option value='بدون کارکرد'>دستگاه بدون کارکرد</option>
                                    <option value='کارکرده'>دستگاه کارکرده</option>                                    
                            </select>
                                <br>
                                <label>     نام محصول:</label>
                                <input type="text" placeholder="Typing Name"  id="productname"><br>                                                                   
                                <label >قیمت:</label>
                                <input type="text" placeholder="Typing Price" id="price" > 
                                ریال<br>
                                <label>توضیحات :</label>
                                <textarea id="des"  ></textarea><br>                
                                 <input type="button" id="insert-product-submit" value="ارسال" class="submit-btn" onclick="InsertProduct();">
                                <input type="reset" value="پاک کردن" class="submit-btn">   
                                <span id="status" ></span>
                              </form>
                             
                              <form class="image-form-Insert" accept-charset="UTF-8" action="" method="POST">                                                                                                                                           
                                    <p style="margin-right: 10px">                                  برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید</p>
                                    <input type="file" accept=".jpg" id="imagepath" onchange="showimage(this);" style="margin-right: 10px">
                                    <img src="" class="img-polaroid" id="image" > 
                              </form>   
                             
                              <form class="product-image-Delete"  accept-charset="UTF-8">
                                     <label class="header">  حذف تصویر </label>  <br>                            
                                     <input type="text" class="input-medium search-query"  id="" >
                                     <input type="button" id="" value="حذف" class="submit-btn" onclick="">
                                     <span id="Delete-status" ></span>
                            </form>
                              
                           <form class="product-form-Edit" accept-charset="UTF-8" action="editproduct.jsp" method="POST">
                               <label class="header">  ویرایش محصول </label><br>                              
                               <input type="text" class="input-medium search-query"  name="key" >
                               <input type="submit"  value="بیاب" class="submit-btn">
                            </form>                             
                                                                                                                                               
                        <form class="product-form-Delete"  accept-charset="UTF-8">
                             <label class="header">  حذف محصول </label>  <br>                            
                            <input type="text" class="input-medium search-query"  id="key" >
                            <input type="button" id="Delete-product-submit" value="بیاب" class="submit-btn" onclick="DeleteProduct();">
                            <span id="Delete-status" ></span>
                        </form>                        
                    
                                                                           
                    <form class="customer-form-Insert"  accept-charset="UTF-8" >                                
                        <label class="header">افزودن مشتری  </label><br>                                                                                    
                        <label>     نام مشتری:</label>
                        <input type="text" placeholder="Typing Name"  id="customername" style="width: 400px"> <br>
                        <input type="button" id="Insert-custome-submit" value="ارسال" class="submit-btn" onclick="InsertCustomer();">
                        <span id="Customer_insert_status" ></span>
                       </form>                                                                         
                        <form class="customer-form-Delete"  accept-charset="UTF-8">
                           <label class="header">  حذف مشتری  </label><br>   
                           <label>     نام مشتری:</label>
                           <input type="text" placeholder="Typing Name" id="customernamed" style="width: 400px"> <br>
                           <input type="button" id="Delete-customer-submit" value="حذف" class="submit-btn" onclick="DeleteCustomer();">
                           <span id="customer_delete_status" ></span>
                        </form>                           
                                                                                                       
                            <form class="link-form-Insert"  accept-charset="UTF-8" >                                
                                <label class="header">افزودن لینک </label><br>                                                                                    
                                <label>     عنوان:</label>
                                <input type="text" placeholder="Typing Name" id="drivername" > <br>
                                <label>     لینک:</label>
                                <input type="text" placeholder="Typing Name" id="link" > <br>
                                <input type="button"  value= "ارسال " class="submit-btn" onclick="InsertLink();">
                                <span id="link_insert_status" ></span>
                       </form>
                                                                                                             
                        <form class="link-form-Delete"  method="POST" >
                         <label class="header"> حذف لینک </label><br>                             
                         <label>     عنوان:</label>
                         <input type="text" placeholder="Typing Name" id="drivernamed" > <br>
                         <input type="button"  value= "حذف" class="submit-btn" onclick="DeleteLink();">
                         <span id="link-delete-status" ></span>
                        </form>
                       
                    </section>
                </section>            
                    <%
                }else{                  
                    response.sendRedirect("login.jsp");
                }
            }else{
               // out.println("null");
                response.sendRedirect("login.jsp");
            }
    %>
    </body>
</html>
