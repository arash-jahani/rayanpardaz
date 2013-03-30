/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kavtion.helpers;

import org.joda.time.DateTime;

/**
 *
 * @author Mohsen
 */
public class DateHelper {

    public static long getUnixTime() {
        DateTime dt = new DateTime();
        dt.plusHours(3);
        dt.plusMinutes(30);
        return dt.getMillis()/1000;
    }
}
