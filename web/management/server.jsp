<%-- 
    Document   : index
    Created on : Jan 25, 2013, 10:00:07 PM
    Author     : Arash jahani 09367857892 arash.jahani13@gmail.com
--%>

<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.kavtion.models.Message"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.kavtion.App"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
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
    response.setContentType("text/xml");
    response.setHeader("Cache-Control", "no-cache");
    ProductSql product=new ProductSql();
    Boolean QueryStatus=false;
    String InsertQuery;
    String DeleteQuery;
    String EditQuery;
    String SearchQuery;
    request.setCharacterEncoding("UTF-8");
    //insert product     
    if(request.getParameter("insert-product-submit")!=null){
            String id=request.getParameter("id");
            String producttype=request.getParameter("producttype");    
            String oldornew=request.getParameter("oldornew");
            String productname=request.getParameter("productname");
            String price=request.getParameter("price");
            String des=request.getParameter("des");
            String date=request.getParameter("date");                                 
            InsertQuery="INSERT INTO `rayanpardaz`.`product` (`type`, `name`, `date`, `price`, `oldornew`, `des`) VALUES ('"+producttype+"', '"+productname+"',  '"+date+"', '"+price+"', '"+oldornew+"', '"+des+"');";    
            QueryStatus=product.InsertDelete(InsertQuery);            
            if(QueryStatus.equals(true)){                        
                response.getWriter().write("ثبت کامل اطلاعات");
                return;
            }else{
                response.getWriter().write(" خطا در ثبت ");
                return;
            }
       // }
    }else{       
    } 
    //edit product information    
    if(request.getParameter("edit-product-submit")!=null){                      
            String id=request.getParameter("id");
            String producttype=request.getParameter("producttype");    
            String oldornew=request.getParameter("oldornew");
            String productname=request.getParameter("productname");
            String price=request.getParameter("price");
            String des=request.getParameter("des");
            String date=request.getParameter("date");
            EditQuery="UPDATE `rayanpardaz`.`product` SET `type`='"+producttype+"' , `name`='"+productname+"' , `price`= '"+price+"', `oldornew`='"+oldornew+"' , `des`= '"+des+"' WHERE `id`= '"+id+"' ";
            QueryStatus=product.InsertDelete(EditQuery);            
            if(QueryStatus.equals(true)){                        
                response.getWriter().write("ویرایش با موفقیت انجام شد");
                return;
            }else{
                response.getWriter().write("خطا در ویرایش");
                return;                              
            }
    }
    //delete product
    if(request.getParameter("Delete-product-submit")!=null){
      String key=request.getParameter("id");
      DeleteQuery="DELETE FROM `rayanpardaz`.`product` where id='"+key+"' ";          
      QueryStatus=product.InsertDelete(DeleteQuery);      
      if(QueryStatus.equals(true)){
          response.getWriter().write("انجام شد");
          return;
      }else{
          response.getWriter().write("خطا در حذف");
          return;
      }
    }
    //insert Customer Name
     if(request.getParameter("cname")!=null){
        String name=request.getParameter("cname");
        InsertQuery="INSERT INTO `rayanpardaz`.`customer` (`name`) VALUES ('"+name+"');";    
        QueryStatus=product.InsertDelete(InsertQuery);        
        if(QueryStatus.equals(true)){
           response.getWriter().write("ثبت شد");
           return;
        }else{
          response.getWriter().write("خطا در ثبت");
          return;
        }     
     }  
     //Delete Customer Name
      if(request.getParameter("cdname")!=null){
        String name=request.getParameter("cdname");
        DeleteQuery="DELETE FROM `rayanpardaz`.`customer` where name='"+name+"' ";     
        QueryStatus=product.InsertDelete(DeleteQuery);        
        if(QueryStatus.equals(true)){
           response.getWriter().write("انجام شد");
           return;
        }else{
          response.getWriter().write("خطا در حذف");
          return;
        }     
     }        
     //Insert Driver
     if(request.getParameter("drivername")!=null){
        String drivername=request.getParameter("drivername");
        String link=request.getParameter("link");
        InsertQuery="INSERT INTO `rayanpardaz`.`driver` (`name`, `link`) VALUES ('"+drivername+"', '"+link+"');";         
        QueryStatus=product.InsertDelete(InsertQuery);
        if(QueryStatus.equals(true)){
           response.getWriter().write("ثبت شد");
           return;
        }else{
          response.getWriter().write("خطا در ثبت");
          return;
        }     
     }
    //Delete Driver
    if(request.getParameter("drivernamed")!=null){
        String name=request.getParameter("drivernamed");
        DeleteQuery="DELETE FROM `rayanpardaz`.`driver` where name='"+name+"' ";     
        QueryStatus=product.InsertDelete(DeleteQuery);         
        if(QueryStatus.equals(true)){
           response.getWriter().write("انجام شد");
           return;
        }else{
          response.getWriter().write("خطا در حذف");
          return;
        }     
     }
    //Send MEssage
     String fullname=request.getParameter("fullname");
     String tell=request.getParameter("tell");
     String service=request.getParameter("service");     
    if((fullname!=null)&&(tell!=null)){
        String msg="نیازمند"+"-"+service+"-"+"\n"+fullname+tell+"\n";
        App message=new App();        
        message.Send(new Message(msg, "09367857892", "10009000080000"));
        response.getWriter().write("ارسال شد");
        return;
    }
    
%>

