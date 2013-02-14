/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import com.sun.media.sound.JavaSoundAudioClip;
import org.joda.time.DateTime;
import pack.Java_Calender;

/**
 *
 * @author Arash
 */
public class ConvertDate {
    public String getdate(String mDate){
        String shamsi = null;
        DateTime date=new DateTime(mDate);
        
        int year=Integer.parseInt(date.toString("yyyy"));
        int month=Integer.parseInt(date.toString("MM"));
        int day=Integer.parseInt(date.toString("dd"));
        
        Java_Calender convert=new Java_Calender(year, month, day);
        shamsi=convert.getIranianDate();
        return shamsi;
    }
}
