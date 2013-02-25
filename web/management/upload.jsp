<%-- 
    Document   : index
    Created on : Jan 20, 2013, 11:27:05 AM
    Author     : Arash
--%>
<%@page import="java.net.URL"%>
<!DOCTYPE html> 

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<scriplet>
    <%
    
    
    int totalRows = 0;
    String saveFile = "";
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
       // out.println("dddda  === \n " + in.toString());
             
    
        int formDataLength = request.getContentLength();
        int pi_filesize = formDataLength / 1024;

        byte dataBytes[] = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }                       
        String file = new String(dataBytes);
       saveFile = file.substring(file.indexOf("filename=\"")+10);               
       saveFile = saveFile.substring(0,saveFile.indexOf("\""));               
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
        int pos;
        pos = file.indexOf("filename=\"");        
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;        
        saveFile = getClass().getProtectionDomain().getCodeSource().getLocation().toString() + "files/" + saveFile;            
        File f = new File("D:/123456.jpg");
        if (!f.exists()) {
            f.createNewFile();
	}
        FileOutputStream fileOut = new FileOutputStream(f);                 
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
       fileOut.close();
       response.sendRedirect("admin.jsp");
        } 
           %>
</scriplet>