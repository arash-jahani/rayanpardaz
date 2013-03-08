/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kavtion.helpers;

import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 *
 * @author Mohsen
 */
public class RestHelper {

    public static HttpResponse doPost(String url, UrlEncodedFormEntity params) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(url);
        post.setEntity(params);
        HttpResponse response = client.execute(post);
        return response;
    }
    public static HttpResponse doGet(String url) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpGet get = new HttpGet(url);
        HttpResponse response = client.execute(get);
        return response;
    }
}
