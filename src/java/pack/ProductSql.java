package pack;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Arash
 */
public class ProductSql {
    private static String DriverName="com.mysql.jdbc.Driver";
    private static String url="jdbc:mysql://localhost:3306/rayanpardaz?useUnicode=true&characterEncoding=UTF-8"; 
    public static Connection con=null;    
    private void CreateConnection(){
        try {
            Class.forName(DriverName);
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Mysql Driver Not Support!", "Error", JOptionPane.ERROR_MESSAGE, null);
        }
        try {
            con= DriverManager.getConnection(url,"root","1234");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, " Unable To Load DataBase", "Error", JOptionPane.ERROR_MESSAGE, null);
        }
    }
    /* bedast avordane akharin recorde jadval be manzore bedast avordane id recordi badi
    ke ijad khahad shod va nesbat dadane an be name image*/
    public long getLastRecord(){
        long lastrecord = 0;        
        CreateConnection();
        Statement stmt;
        ResultSet rs;     
        try {
            stmt = con.createStatement();
             rs=stmt.executeQuery("select * from rayanpardaz.product ORDER BY id ASC ");            
            while(rs.next()){ 
                lastrecord=rs.getLong("id");
            }            
            rs.close();
            stmt.close();
            con.close(); 
        } catch (SQLException ex) {
              
        }
        return lastrecord+1;
    }
    
    
    public Boolean InsertDelete(String query){
        
        CreateConnection();
        Statement stmt = null;     
        try {
            stmt = con.createStatement();
            int rs=stmt.executeUpdate(query);
            stmt.close();
            con.close();
            if(rs>0)
            return true;
        } catch (SQLException ex) {                       
            return false;            
        }
       return false;
}
    
    public ResultSet search(String search_query) {
     CreateConnection();
     Statement stmt = null;
     ResultSet rs = null;    
        try {
           stmt = con.createStatement(); 
            rs = stmt.executeQuery(search_query);           
          while(rs.next()){                                
                    return rs;                          
            }          
            con.close();
            stmt.close();           
            rs.close();   
             return null;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error", "Rent", JOptionPane.ERROR_MESSAGE, null);
            return null;
        } 
    }
      public ResultSet multisearch(String search_query) {
     CreateConnection();
     Statement stmt = null;
     ResultSet rs = null;    
        try {
           stmt = con.createStatement(); 
            rs = stmt.executeQuery(search_query);           
          if(rs.next()){
                    //rs.beforeFirst();
                    return rs;                          
            }          
            con.close();
            stmt.close();           
            rs.close();   
            return null;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error", "Rent", JOptionPane.ERROR_MESSAGE, null);
            return null;
        }
}
    public ResultSet eachproduct(String search_query) {
     CreateConnection();
     Statement stmt = null;
     ResultSet rs = null;    
        try {
           stmt = con.createStatement(); 
            rs = stmt.executeQuery(search_query);  
            if(rs.next()!=false){
                rs.beforeFirst();
                return rs;           
            }
            con.close();
            stmt.close();           
            rs.close();   
            return null;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error", "Rent", JOptionPane.ERROR_MESSAGE, null);
            return null;
        }              
}
    
}