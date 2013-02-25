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
            <details>
                <summary id="product" >محصولات</summary>
                <section class="main-section-product">
                    <nav>  
                        <ul>
                        <li class="link-Insert">افزودن محصول جدید </li>
                        <li class="link-Edit">                            ویرایش اطلاعات محصول
                         <li class="link-Delete">حذف محصول  
                            </ul>
                    </nav>
                    <section class="info-section" id="info-section" >
                        
                        <% if(request.getParameter("submit")==null){ %> <!--barasi inke,aya karbar avalin bar ast ke varede form mishavad ya qablan niz hozr dashte-->                        
                        <form class="form-Insert" method="post" action="admin.jsp" accept-charset="UTF-8"  >
                            <label class="header"> محصول جدید با شناسه :</label>                               
                            <label class="header" > 
                                <% ProductSql lastrecord=new ProductSql();%> 
                                <%= lastrecord.getLastRecord() %> </label>
                                <label class="header">در :</label>
                                <%DateTime date=new DateTime();%>    
                                <input type="text"  name="date"  style="background-color: #eee;text-align: center;" value="<%=date.toString("yyyy-MM-dd") %>">
                              <br>
                            <label>نوع محصول:</label>
                            <select name="producttype">
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
                             <select name="oldornew">
                                <option value='بدون کارکرد'>دستگاه بدون کارکرد</option>
                                    <option value='کارکرده'>دستگاه کارکرده</option>                                    
                            </select>
                                <br>
                                <label>     نام محصول:</label>
                                <input type="text" placeholder="Typing Name" id="status" name="productname" style="margin-right: 10px;">                                                                   
                                <label >قیمت:</label>
                                <input type="text" placeholder="Typing Price" name="price" style="margin-right: 72px"> 
                                ریال<br>
                                <label>توضیحات :</label>
                                <textarea name="des" style="margin-right: 10px" ></textarea>
                                <img src="../files/productpic/NoImage.jpg" class="img-polaroid" ><br>                                
                                <input type="submit" name="submit" value="ثبت" class="submit-btn">
                                <input type="reset" value="پاک کردن" class="submit-btn">                           
                       </form>
                              <form action="upload.jsp" enctype="multipart/form-data" method="POST" style="margin-top: 400px">
                                  برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید
                                <input type="file" accept="image/*" name="imagepath">
                                  <input type="submit" name="submit" value="آپلود تصویر" class="submit-btn">
                              </form>
                         <%}else{                                                                 
                       Boolean UpImageStatus=true;                                              
                    if(UpImageStatus.equals(true)){
                        String producttype=request.getParameter("producttype");    
                        String oldornew=request.getParameter("oldornew");
                        String productname=request.getParameter("productname");
                        String price=request.getParameter("price");
                        String des=request.getParameter("des");
                        String date=request.getParameter("date");
                        String imagepath=request.getParameter("imagepath");                        
                        InsertQuery="INSERT INTO `rayanpardaz`.`product` (`type`, `name`, `date`, `price`, `oldornew`, `des`) VALUES ('"+producttype+"', '"+productname+"',  '"+date+"', '"+price+"', '"+oldornew+"', '"+des+"');";    
                        QueryStatus=product.InsertDelete(InsertQuery);
                        %>
                                                <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >
                                                <label class="header"> محصول جدید با شناسه :</label>                               
                                                <label class="header" > 
                                                    <% ProductSql lastrecord=new ProductSql();%> 
                                                    <%= lastrecord.getLastRecord() %> </label>
                                                    <label class="header">در :</label>
                                                    <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
                                    Date today = new Date();  %>
                                                    <input type="text"  name="date"  style="background-color: #eee;text-align: center;" value="<%=formatter.format(today) %>">
                                                  <br>
                                                <label>نوع محصول:</label>
                                                <select name="producttype">
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
                                                 <select name="oldornew">
                                                    <option value='بدون کارکرد'> بدون کارکرد</option>
                                                        <option value='کارکرده'> کارکرده</option>                                    
                                                </select>
                                                    <br>
                                                    <label>     نام محصول:</label>
                                                    <input type="text" placeholder="Typing Name" id="field" name="productname" style="margin-right: 10px;">                                                                   
                                                    <label >قیمت:</label>
                                                    <input type="text" placeholder="Typing Price" name="price" style="margin-right: 72px"> 
                                                    ریال<br>
                                                    <label>توضیحات :</label>
                                                    <textarea name="des" style="margin-right: 10px" ></textarea>
                                                    <img src="../files/productpic/NoImage.jpg" class="img-polaroid" ><br>                                                    
                                                    <input type="submit" name="submit" value="ثبت" class="submit-btn">
                                                    <input type="reset" value="پاک کردن" class="submit-btn">
                                           </form>
                                                  <form action="upload.jsp" enctype="multipart/form-data" method="POST" style="margin-top: 400px">
                                  برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید
                                <input type="file" accept="image/*" name="imagepath">
                                  <input type="submit" name="submit" value="آپلود تصویر" class="submit-btn">
                              </form>
                                                <%
                      if(QueryStatus.equals(true)){%>                                                                                                                        
                                                 <label class="status" >ثبت شد</label>
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >ثبت نشد</label>
                                        <%}}else{%>
                                        <label class="status" style="background-color: #ed1c24" >  اشکال در آپلود تصویر.لطفا دوباره تلاش کنید</label>   
                                        <%}             
              }%>
                            <form class="form-Edit"  method="POST" action="save-data.jsp" accept-charset="UTF-8">
                           <label class="header">  ویرایش </label><br>   
                           <input type="hidden" value='2' name="formname"> <!--2 for Product Edit-->
                           <input type="text" class="input-medium search-query"  name="key" style="margin-right: 200px">
                            <button type="submit">جسنجو</button><br>
                            </form>                                
                             <% if(request.getParameter("delete")==null){ %>
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                             <label class="header">  حذف </label><br>                              
                            <input type="text" class="input-medium search-query" id="productname"  name="key" style="margin-right: 200px">
                            <button type="submit" name="delete">حذف</button><br>
                        </form>
                        <%}else{
                  String key=request.getParameter("key");
                  DeleteQuery="DELETE FROM `rayanpardaz`.`product` where id='"+key+"' ";          
                  QueryStatus=product.InsertDelete(DeleteQuery);
                  %>
                                    <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                                    <label class="header" >  حذف </label><br>                              
                                    <input type="text" id="field" class="input-medium search-query" name="key" style="margin-right: 200px">
                                    <button type="submit"  name="delete">حذف</button><br>
                            </form>
                             <%
                    if(QueryStatus.equals(true)){%>                                                                                                                        
                                                   <label class="status" > حذف شد </label>                                                        
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >حذف  نشد</label>
                                        <%}      
             }%>
                    </section>
                </section>
            </details>          
            <details id="Customer">
                <summary id="customer" >مشتریان</summary>
                <section class="main-section-customer">
                    <nav>  
                        <ul>
                            <li class="link-Insert">افزودن مشتری جدید </li>
                            <li class="link-Delete">حذف مشتری  
                        </ul>
                    </nav>
                    <section class="info-section">
                        <%if(request.getParameter("customer-submit")==null){%>
                            <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >                                
                                <label class="header">افزودن مشتری به لیست </label><br>                                                                                    
                                <label>     نام مشتری:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="customername" style="width: 400px"> <br>
                                <input type="submit" name="customer-submit" value= "ثبت مشتری" class="submit-btn">
                       </form>
                        <%}else{
                        String name=request.getParameter("customername");
                        InsertQuery="INSERT INTO `rayanpardaz`.`customer` (`name`) VALUES ('"+name+"');";    
                        QueryStatus=product.InsertDelete(InsertQuery);
            %>
                        <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >                                
                                <label class="header">افزودن مشتری به لیست </label><br>                                                                                    
                                <label>     نام مشتری:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="customername" style="width: 400px"> <br>
                                <input type="submit" name="customer-submit" value= "ثبت مشتری" class="submit-btn">
                       </form>
                     <% if(QueryStatus.equals(true)){%>                                                                                                                        
                                                 <label class="status" >ثبت شد</label>
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >ثبت نشد</label>                                                   
                            <% }}%>
                           <%if(request.getParameter("customer-delete")==null){%> 
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                             <label class="header">  حذف مشتری از لیست </label><br>   
                           <label>     نام مشتری:</label>
                            <input type="text" placeholder="Typing Name" id="field" name="customername" style="width: 400px"> <br>
                                <input type="submit" name="customer-delete"  value= "حذف مشتری" class="submit-btn">
                        </form>     
                        <%}else{
                       String name=request.getParameter("customername");
                       DeleteQuery="DELETE FROM `rayanpardaz`.`customer` where name='"+name+"' ";     
                       QueryStatus=product.InsertDelete(DeleteQuery);     
            %>
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                                <label class="header">  حذف مشتری از لیست </label><br>   
                                <label>     نام مشتری:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="customername" style="width: 400px"> <br>
                                <input type="submit" name="customer-delete"  value= "حذف مشتری" class="submit-btn">
                        </form>   
                        <% if(QueryStatus.equals(true)){%>                                                                                                                        
                                                 <label class="status" > حذف شد</label>
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >حذف  نشد</label>                                                   
                            <% }}%>
                    </section>                    
                </section>
            </details>
            <details>
                <summary id="links">لینک درایورها</summary>
                <section class="main-section-customer">
                    <nav>                        
                             <nav>  
                        <ul> 
                            <li class="link-Insert">درج 
                            <li class="link-Delete">حذف  
                         </ul>
                    </nav>                                                  
                    </nav>
                    <section class="info-section">
                         <%if(request.getParameter("link-submit")==null){%> 
                            <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >                                
                                <label class="header">افزودن درایور جدید</label><br>                                                                                    
                                <label>     عنوان:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="drivername" style="width: 400px"> <br>
                                <label>     لینک:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="link" style="margin-right:5px ;width: 400px"> <br>
                                <input type="submit" name="link-submit" value= "ثبت " class="submit-btn">
                       </form>
                         <%}else{
                        String drivername=request.getParameter("drivername");
                        String link=request.getParameter("link");
                        InsertQuery="INSERT INTO `rayanpardaz`.`driver` (`name`, `link`) VALUES ('"+drivername+"', '"+link+"');";         
                        QueryStatus=product.InsertDelete(InsertQuery);
            %>            
                       <form class="form-Insert" method="POST" action="admin.jsp" accept-charset="UTF-8" >                              
                                <label class="header">افزودن درایور جدید</label><br>                                                                                    
                                <label>     عنوان:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="drivername" style="width: 400px"> <br>
                                <label>     لینک:</label>
                                <input type="text" placeholder="Typing Name" id="field" name="link" style="margin-right:5px ;width: 400px"> <br>
                                <input type="submit" name="link-submit" value= "ثبت " class="submit-btn">
                       </form>
                     <% if(QueryStatus.equals(true)){%>                                                                                                                        
                                                 <label class="status" >ثبت شد</label>
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >ثبت نشد</label>                                                   
                            <% }}%>                                                          
                          <%if(request.getParameter("delete-link")==null){%>   
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                         <label class="header"> حذف </label><br>                             
                         <label>     عنوان:</label>
                         <input type="text" placeholder="Typing Name" name="drivername" style="width: 400px"> <br>
                         <input type="submit" name="delete-link" id="field"  value= "حذف" class="submit-btn">
                        </form>
                        <%}else{
                       String name=request.getParameter("drivername");
                       DeleteQuery="DELETE FROM `rayanpardaz`.`driver` where name='"+name+"' ";     
                       QueryStatus=product.InsertDelete(DeleteQuery);    
            %>
                        <form class="form-Delete"  method="POST" action="admin.jsp" accept-charset="UTF-8">
                           <label class="header"> حذف </label><br>                             
                           <label>     عنوان:</label>
                           <input type="text" placeholder="Typing Name" name="drivername" style="width: 400px"> <br>
                           <input type="submit" name="delete-link" id="field"  value= "حذف" class="submit-btn">
                        </form>  
                        <% if(QueryStatus.equals(true)){%>                                                                                                                        
                                         <label class="status" > حذف شد</label>
                                         <% }else{%>
                                         <label class="status" style="background-color: #ed1c24" >حذف  نشد</label>                                                   
                            <% }}%>
                    </section>
                </section>
            </details>
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
