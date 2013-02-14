/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arash
 */
public class UploadImage {
    public  void Upload(String url,String filepath,String name)  {        
        try {
            String imageUrl = "http://www.avajava.com/images/avajavalogo.jpg";
            String destinationFile = "image.jpg";            
            URL u = new URL(imageUrl);
            InputStream is = u.openStream();
            OutputStream os = new FileOutputStream("D:\\txt.txt");

            byte[] b = new byte[2048];
            int length;

            while ((length = is.read(b)) != -1) {
                    os.write(b, 0, length);
            }

            is.close();
            os.close();
        } catch (IOException ex) {
            Logger.getLogger(UploadImage.class.getName()).log(Level.SEVERE, null, ex);
        }

}
}