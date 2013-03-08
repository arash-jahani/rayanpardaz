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
            
                <header id="product" class="header-topic">محصولات</header>
                <section class="main-section-product">
                    <nav>  
                        <ul>
                        <li class="link-Insert">افزودن محصول جدید </li>
                        <li class="link-Edit">                            ویرایش اطلاعات محصول
                         <li class="link-Delete">حذف محصول  
                            </ul>
                    </nav>
                    <section class="info-section" id="info-section" >                                                       
                        <form class="form-Insert"  accept-charset="UTF-8" enctype="multipart/form-data" >
                            <label class="header"> محصول جدید با شناسه :</label>                               
                            <label class="header" id="product-id"> 
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
                            </select>
                            <label>کارکرد دستگاه:</label>
                             <select id="oldornew">
                                <option value='بدون کارکرد'>دستگاه بدون کارکرد</option>
                                    <option value='کارکرده'>دستگاه کارکرده</option>                                    
                            </select>
                                <br>
                                <label>     نام محصول:</label>
                                <input type="text" placeholder="Typing Name"  id="productname" style="margin-right: 10px;">                                                                   
                                <label >قیمت:</label>
                                <input type="text" placeholder="Typing Price" id="price" style="margin-right: 72px"> 
                                ریال<br>
                                <label>توضیحات :</label>
                                <textarea id="des"  ></textarea>
                                <img src="" class="img-polaroid" id="image" ><br>                                                                                                              
                                  برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید
                                  <input type="file" accept=".jpg" id="imagepath" onchange="showimage(this);">
                                 <input type="button" id="insert-product-submit" value="ارسال" class="submit-btn" onclick="InsertProduct();">
                                <input type="reset" value="پاک کردن" class="submit-btn">   
                                <span id="status" ></span>
                              </form>
                              
                           <form class="form-Edit" accept-charset="UTF-8" action="editproduct.jsp" method="POST">
                               <label class="header">  ویرایش </label>                              
                               <input type="text" class="input-medium search-query"  name="key" style="margin-right: 200px">
                               <input type="submit"  value="Search" class="submit-btn">
                            </form>                             
                                                                                                                                               
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                             <label class="header">  حذف </label>                              
                            <input type="text" class="input-medium search-query"  id="key" style="margin-right: 200px">
                            <input type="button" id="Delete-product-submit" value="حذف" class="submit-btn" onclick="DeleteProduct();">
                            <span id="Delete-status" ></span>
                        </form>                        
                    </section>
                </section>                      
            
                <header id="customer" class="header-topic" >مشتریان</header>
                <section class="main-section-customer">
                    <nav>  
                        <ul>
                            <li class="link-Insert">افزودن مشتری جدید </li>
                            <li class="link-Delete">حذف مشتری  
                        </ul>
                    </nav>
                    <section class="info-section">                        
                            <form class="form-Insert"  accept-charset="UTF-8" >                                
                                <label class="header">افزودن مشتری به لیست </label><br>                                                                                    
                                <label>     نام مشتری:</label>
                                <input type="text" placeholder="Typing Name"  id="customername" style="width: 400px"> <br>
                                <input type="button" id="Insert-custome-submit" value="ارسال" class="submit-btn" onclick="InsertCustomer();">
                                <span id="Customer_insert_status" ></span>
                       </form>                                                                         
                        <form class="form-Delete"  accept-charset="UTF-8">
                           <label class="header">  حذف مشتری از لیست </label><br>   
                           <label>     نام مشتری:</label>
                           <input type="text" placeholder="Typing Name" id="customernamed" style="width: 400px"> <br>
                           <input type="button" id="Delete-customer-submit" value="حذف" class="submit-btn" onclick="DeleteCustomer();">
                           <span id="customer_delete_status" ></span>
                        </form>                           
                    </section>                    
                </section>            
                <header id="links" class="header-topic">لینک درایورها</header>
                <section class="main-section-links">
                    <nav>                        
                             <nav>  
                        <ul> 
                            <li class="link-Insert">درج 
                            <li class="link-Delete">حذف  
                         </ul>
                    </nav>                                                  
                    </nav>
                    <section class="info-section">                         
                            <form class="form-Insert" method="POST"  >                                
                                <label class="header">افزودن درایور جدید</label><br>                                                                                    
                                <label>     عنوان:</label>
                                <input type="text" placeholder="Typing Name" id="drivername" style="width: 400px"> <br>
                                <label>     لینک:</label>
                                <input type="text" placeholder="Typing Name" id="link" style="margin-right:5px ;width: 400px"> <br>
                                <input type="button"  value= "ارسال " class="submit-btn" onclick="InsertLink();">
                                <span id="link_insert_status" ></span>
                       </form>
                                                                                                             
                        <form class="form-Delete"  method="POST" >
                         <label class="header"> حذف </label><br>                             
                         <label>     عنوان:</label>
                         <input type="text" placeholder="Typing Name" id="drivernamed" style="width: 400px"> <br>
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
