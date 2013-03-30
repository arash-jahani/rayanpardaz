/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import org.joda.time.DateTime;

/**
 *
 * @author Arash
 */
public class ConvertDate {
    public String getdate(String mDate){
        String shamsi = "";
        DateTime date=new DateTime(mDate);
        
        int year=Integer.parseInt(date.toString("yyyy"));
        int month=Integer.parseInt(date.toString("MM"));
        int day=Integer.parseInt(date.toString("dd"));
        
        Java_Calender convert=new Java_Calender(year, month, day);
        shamsi=convert.getIranianDate();
        return shamsi;
    }
}
