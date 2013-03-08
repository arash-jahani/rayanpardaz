/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
/**
 *
 * @author Arash
 */
public class UploadImage {
    public  Boolean Upload(InputStream is,String filepath,String name)  {        
        try {
//            String imageUrl = url;
            String destinationFile = filepath+name+".jpg";
    //        System.out.println(destinationFile);
//            URL u = new URL(imageUrl);
//            InputStream is = u.openStream();
            OutputStream os = new FileOutputStream(destinationFile);
            byte[] b = new byte[2048];
            int length;

            while ((length = is.read(b)) != -1) {
                    os.write(b, 0, length);
            }
            is.close();
            os.close();
            return true;
        } catch (IOException ex) {
            ex.toString();
            return false;                        
        }        

}
}