<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.UploadImage"%>
<%@page import="pack.ProductSql"%>
<%@page import="java.io.File"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
   int formname=Integer.valueOf(request.getParameter("formname"));      
%>
<!DOCTYPE html> 
<html>    
    <head>   
         <link rel="stylesheet" type="text/css" href="files/manage-page-style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ثبت وقایع</title>       
    </head>
    <body>   
        <section class="page">
            <%// ProductSql lastrecordsql=new ProductSql();%> 
            <% //String lastrecord=String.valueOf( lastrecordsql.getLastRecord());
          //UploadImage up=new UploadImage();
        //up.Upload(user.getImagepath() , "D:\\", lastrecord);  
        %>
        <%                      
            ProductSql product=new ProductSql();            
            Boolean UpImageStatus=true;
            String InsertQuery;
            String EditQuery;
            String DeleteQuery;
            String SearchQuery;
            Boolean QueryStatus=false; 
            ResultSet rs=null;
            String key=(request.getParameter("key"));
            switch(formname){               
                 case 2:{ //2 is Edit Product form 
                     if(request.getParameter("submit")==null){
                    SearchQuery="Select * from rayanpardaz.product where id='"+key+"' ";                       
                    rs=product.search(SearchQuery);
                    if(rs!=null){%>  
                                             <section class="main-section-product">
                                            <section class="info-section" >
                                                <form class="form-Edit" method="POST" action="save-data.jsp" accept-charset="UTF-8" >
                                                     <input type="hidden" value='2' name="formname"> <!--2 for Product Edit-->
                                                    <label class="header">ویرایش محصول به شناسه</label>                                               
                                                    <input type="text" name="key" style="background-color: #eee;text-align: center;border:none;width:70px;" value="<%=key %>" readonly>
                                                    <label>ثبت شده در تاریخ :</label>
                                                    <input type="text" name="date" style="background-color: #eee;text-align: center;" value="<%=rs.getString("date") %>">
                                                    <br>
                                                    <label>نوع محصول:</label>
                                                    <select name="producttype">
                                                        <option value="<%=rs.getString("type")%>" selected="selected"><%=rs.getString("type")%> </option>
                                                        <option value="فتوکپی">فتوکپی</option>
                                                        <option value="پرینتر">پرینتر</option>
                                                        <option value="چک پرینتر">چک پرینتر</option>
                                                        <option value="فاکس">فاکس</option>
                                                        <option value="پولشمار">پولشمار</option>                                    
                                                        <option value="تست اسکناس">تست اسکناس</option>
                                                        <option value="اسکنر">اسکنر</option>
                                                        <option value="مانیتور">مانیتور</option>                                    
                                                        <option value="کامپیوتر و لپ تاپ">کامپیوتر و لپ تاپ</option>
                                                        <option value="ویدئو/دیتا پرژکتور">ویدئو/دیتا پرژکتور</option>
                                                        <option value="صندوق فروشگاهی">صندوق فروشگاهی</option>
                                                        <option value="کالای مصرفی">کالای مصرفی</option>
                                                    </select>
                                                    <label>کارکرد دستگاه:</label>
                                                     <select name="oldornew">
                                                           <option value="<%=rs.getString("oldornew")%>" selected="selected"> <%=rs.getString("oldornew")%></option>
                                                           <option value='  بدون کارکرد'> بدون کارکرد</option>
                                                           <option value='  کارکرده'> کارکرده</option>                                    
                                                    </select><br>
                                                    <label>     نام محصول:</label>
                                                    <input type="text" placeholder="Typing Name" name="productname" value=" <%=rs.getString("name")%>" style="margin-right: 10px;">                                                                   
                                                    <label>قیمت:</label>
                                                    <input type="text" placeholder="Typing Price" name="price" value=" <%=rs.getString("price")%>" style="margin-right: 72px">ریال <br>                                                
                                                    <label>توضیحات :</label>
                                                    <textarea name="des" style="margin-right: 10px"> <%=rs.getString("des")%></textarea>                                                                                                                     
                                                    <img src="C:\fakepath\iran.jpg" class="img-polaroid" ><br>
                                                    <p>برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید</p>
                                                    <input type="file" accept="image/*" name="imagepath"><br>
                                                      <input type="submit" name="submit" value="ویرایش" class="submit-btn">   
                                                    
                                               </section>
                                            </section>
                                     <%}else{%>
                                             <section class="main-section">
                                                <section class="info-section" >                                                                                                
                                                    <label>اطلاعاتی موجود نیست</label>
                                               </section>
                                            </section>
                                        <%}}else{                                                                
                        String id=request.getParameter("key");
                        String producttype=request.getParameter("producttype");    
                        String oldornew=request.getParameter("oldornew");
                        String productname=request.getParameter("productname");
                        String price=request.getParameter("price");
                        String des=request.getParameter("des");
                        String date=request.getParameter("date");
                        String imagepath=request.getParameter("imagepath"); 
                        EditQuery="UPDATE `rayanpardaz`.`product` SET `type`='"+producttype+"' , `name`='"+productname+"' , `price`= '"+price+"', `oldornew`='"+oldornew+"' , `des`= '"+des+"' WHERE `id`= '"+id+"' ";
                        QueryStatus=product.InsertDelete(EditQuery);
                        %>
                                                <section class="main-section-product">
                                                <section class="info-section" >
                                                <form class="form-Edit" method="POST" action="save-data.jsp" accept-charset="UTF-8" >
                                                     <input type="hidden" value='2' name="formname"> <!--2 for Product Edit-->
                                                    <label class="header">ویرایش محصول به شناسه</label>                                               
                                                    <input type="text" name="key" style="background-color: #eee;text-align: center;border:none;width:70px;" value="<%=id%>" readonly>
                                                    <label>ثبت شده در تاریخ :</label>
                                                    <input type="text"  name="date"  style="background-color: #eee;text-align: center;" value="<%=date%>">
                                                    <br>
                                                    <label>نوع محصول:</label>
                                                    <select name="producttype">
                                                        <option value="<%=producttype%>" selected="selected"><%=producttype%> </option>
                                                        <option value="فتوکپی">فتوکپی</option>
                                                        <option value="پرینتر">پرینتر</option>
                                                        <option value="چک پرینتر">چک پرینتر</option>
                                                        <option value="فاکس">فاکس</option>
                                                        <option value="پولشمار">پولشمار</option>                                    
                                                        <option value="تست اسکناس">تست اسکناس</option>
                                                        <option value="اسکنر">اسکنر</option>
                                                        <option value="مانیتور">مانیتور</option>                                    
                                                        <option value="کامپیوتر و لپ تاپ">کامپیوتر و لپ تاپ</option>
                                                        <option value="ویدئو/دیتا پرژکتور">ویدئو/دیتا پرژکتور</option>
                                                        <option value="صندوق فروشگاهی">صندوق فروشگاهی</option>
                                                        <option value="کالای مصرفی">کالای مصرفی</option>
                                                    </select>
                                                    <label>کارکرد دستگاه:</label>
                                                     <select name="oldornew">
                                                           <option value="<%=oldornew%>" selected="selected"> <%=oldornew%></option>
                                                           <option value='دستگاه  بدون کارکرد'>دستگاه بدون کارکرد</option>
                                                           <option value='دستگاه  کارکرده'>دستگاه کارکرده</option>                                    
                                                    </select><br>
                                                    <label>     نام محصول:</label>
                                                    <input type="text" placeholder="Typing Name" name="productname" value=" <%=productname%>" style="margin-right: 10px;">                                                                   
                                                    <label>قیمت:</label>
                                                    <input type="text" placeholder="Typing Price" name="price" value=" <%=price%>" style="margin-right: 72px">ریال <br>                                                
                                                    <label>توضیحات :</label>
                                                    <textarea name="des" style="margin-right: 10px"> <%=des%></textarea>                                                                                                                     
                                                    <img src="C:\fakepath\iran.jpg" class="img-polaroid" ><br>
                                                    <p>برای افزایش سرعت  بارگذاری،قبل از افزودن تصویر سایز حداکثر 200*200 را برای تصویر ست نمایید</p>
                                                    <input type="file" accept="image/*" name="imagepath"><br>
                                                    <input type="submit" name="submit" value="ویرایش" class="submit-btn">                                               
                                               </section>
                                            </section>
                                                <%
                        if(QueryStatus.equals(true)){%>                                                                                                                        
                                                         <label class="product-edit-status">ثبت شد
                                                         </label>
                                         <% }else{%>
                                         <label class="product-edit-status" style="background-color: #ed1c24">ثبت نشد
                                                         </label>
                                        <%}    
                     }
                    break;
                    }                
                     %>                                          
        </section>
    </body>
</html>
