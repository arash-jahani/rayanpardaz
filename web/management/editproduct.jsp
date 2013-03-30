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
    Cookie[] list=request.getCookies();
    if(list !=null){                
       if((list[0].getName().equals("username"))&&(list[0].getValue().equals("1"))&&
               (list[1].getName().equals("password"))&&(list[1].getValue().equals("1"))){
%>
<!DOCTYPE html> 
<html>    
    <head>   
        <link rel="stylesheet" type="text/css" href="../files/CssStyle/manage-page-style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../files/ClientHits.js"></script>
        <title>ثبت وقایع</title>       
    </head>
    <body>   
        <section class="page">            
        <%                      
            ProductSql product=new ProductSql();            
            Boolean UpImageStatus=true;
            String InsertQuery;            
            String DeleteQuery;
            String SearchQuery;
            Boolean QueryStatus=false; 
            ResultSet rs=null;                 
                String key=(request.getParameter("key"));                        
                SearchQuery="Select * from rayanpardaz.product where id='"+key+"' ";                       
                rs=product.search(SearchQuery);
                if(rs!=null){
                    ResultSet type_rs=null;//code zir meqdar adadiye type dar jadvale product ra gherefte va bar asas ana meqdar reshti dar category ra bar mighardanad
                    SearchQuery="Select * from rayanpardaz.category where id='"+rs.getString("type")+"' ";                       
                    type_rs=product.search(SearchQuery);
                %>                                       
                <section class="main-section" style="margin-right: -100px">
                    <section class="info-section" >                            
                        <form class="form-Edit" accept-charset="UTF-8" id="search-product" >                                                 
                                <label class="header">ویرایش محصول به شناسه</label>                                               
                                <input type="text" id="key" style="background-color: #eee;text-align: center;border:none;width:70px;margin-right: 20px" value="<%=key %>" readonly >                                                
                               <br> <label>نوع محصول:</label>
                                <select id="producttype">
                                    <option value="<%=rs.getString("type")%>" selected="selected"><%=type_rs.getString("type")%> </option>
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
                                       <option value="<%=rs.getString("oldornew")%>" selected="selected"> <%=rs.getString("oldornew")%></option>
                                       <option value='  بدون کارکرد'> بدون کارکرد</option>
                                       <option value='  کارکرده'> کارکرده</option>                                    
                                </select><br>
                                <label>     نام محصول:</label>
                                <input type="text" placeholder="Typing Name" id="productname" value=" <%=rs.getString("name")%>" >  <br>
                                <label>قیمت:</label>
                                <input type="text" placeholder="Typing Price" id="price" value=" <%=rs.getString("price")%>" style="margin-left: 10px" >ریال <br>                                                
                                <label>توضیحات :</label>
                                <textarea id="des" > <%=rs.getString("des")%></textarea> <br>                                                                                                                                                                    
                                <input type="button" id="edit-product-submit" value="ثبت" class="submit-btn" onclick="EditProduct();">
                                <input type="reset" value="پاک کردن" class="submit-btn">   
                                <span id="status" ></span>   
                            </form>
                           </section>
                        </section>
                                 <%}else{%>
                                         <section class="main-section">
                                            <section class="info-section" >                                                                                                
                                                <label>اطلاعاتی موجود نیست</label>
                                           </section>
                                        </section>
                                    <%} 
            
            
        }else{                  
            response.sendRedirect("login.jsp");
        }
        }else{      
            response.sendRedirect("login.jsp");
        }               
                    %>

        </section>
    </body>
</html>
