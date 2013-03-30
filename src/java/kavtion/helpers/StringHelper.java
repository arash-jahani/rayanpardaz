/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kavtion.helpers;

/**
 *
 * @author Mohsen
 */
public class StringHelper {

    public static String join(String[] r, String d) {
        StringBuilder sb = new StringBuilder();
        int i;
        for (i = 0; i < r.length - 1; i++) {
            sb.append(r[i] + d);
        }
        return sb.toString() + r[i];

    }
}
