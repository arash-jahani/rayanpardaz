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
                                           
            if(request.getParameter("insert-product-submit")!=null){                
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
                    response.setContentType("text/xml");
                    response.setHeader("Cache-Control", "no-cache");
                    if(QueryStatus.equals(true)){                        
                        response.getWriter().write("OK");
                    }else{
                        response.getWriter().write("NO");
                    }
                }
            }else{
                   }       
            %>                  

