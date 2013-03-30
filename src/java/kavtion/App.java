package com.kavtion;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.kavtion.helpers.ApiHelper;
import com.kavtion.helpers.RestHelper;
import com.kavtion.helpers.StringHelper;
import com.kavtion.models.Message;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.entity.UrlEncodedFormEntity;

/*  Kavenegar API Java Sample Code - version 1  */
public class App {
    public static void main(String[] args) {
        try {
//            System.out.println("===========================================================================");
//            System.out.println("Sample running");

            //Ersale Sade va Ersale Gorohi =================================================================================================//
//
//            JsonObject send_result = Send(new Message("سلام", "09367857892", "10009000080000"));
//            JsonObject sendarray_result = SendArray(new Message[]{new Message("Hello", "09360462966", "30001528961415"), new Message("World", "09360462965", "30001528961414")});
//            // Check Kardane Vaziyate Payam ( Delivery ) =======================================================================================//
//            if (send_result != null) {
//                // agar ersal ba movafaghiyat ejra nashod khorojiye tabe null mibashad ke dar in sorat nabayad deliverty check kard .
//                Status(new String[]{send_result.get("entries").getAsJsonArray().get(0).getAsJsonObject().get("messageid").getAsString()});
//            }
//            AccountInfo();
            // Ersale Payame Zaman Bandi Shode  ==============================================================================================//

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public static JsonObject Send(Message msg) {
        try {
            String url = ApiHelper.getApiPath("sms", "send");            
            UrlEncodedFormEntity params = ApiHelper.createParams("sender", msg.getSender(), "receptor", msg.getReceptor(), "message", msg.getMessage(), "date", msg.getDate());            
            HttpResponse response = RestHelper.doPost(url, params);            
            JsonObject result = ApiHelper.getResult(response);
            JsonObject jsonResult = ApiHelper.getJsonResult(result);
            //System.out.println(jsonResult.toString());
            return null;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static JsonObject SendArray(Message[] messages) {
        try {
            String url = ApiHelper.getApiPath("sms", "sendarray");
            JsonArray sender = new JsonArray();
            JsonArray receptor = new JsonArray();
            JsonArray message = new JsonArray();
            // Vorodihaye in method az noe array e mibashand 
            for (Message msg : messages) {
                sender.add(new JsonPrimitive(msg.getSender()));
                receptor.add(new JsonPrimitive(msg.getReceptor()));
                message.add(new JsonPrimitive(msg.getMessage()));
            }

            UrlEncodedFormEntity params = ApiHelper.createParams("sender", sender.toString(), "receptor", receptor.toString(), "message", message.toString());
            HttpResponse response = RestHelper.doPost(url, params);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static JsonObject Status(String[] ids) {
        try {
            String url = ApiHelper.getApiPath("sms", "status");
            String messageid = StringHelper.join(ids, ",");
            UrlEncodedFormEntity params = ApiHelper.createParams("messageid", messageid);
            HttpResponse response = RestHelper.doPost(url, params);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static JsonObject Cancel(String[] ids) {
        try {
            String url = ApiHelper.getApiPath("sms", "cancel");
            String messageid = StringHelper.join(ids, ",");
            UrlEncodedFormEntity params = ApiHelper.createParams("messageid", messageid);
            HttpResponse response = RestHelper.doPost(url, params);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            return null;
        }
    }

    public static JsonObject Select(String[] ids) {
        try {
            String url = ApiHelper.getApiPath("sms", "select");
            String messageid = StringHelper.join(ids, ",");
            UrlEncodedFormEntity params = ApiHelper.createParams("messageid", messageid);
            HttpResponse response = RestHelper.doPost(url, params);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            return null;
        }
    }

    public static JsonObject Unreads(String line, int status) {
        try {
            String url = ApiHelper.getApiPath("sms", "unreads");
            UrlEncodedFormEntity params = ApiHelper.createParams("linenumber", line, "status", status);
            HttpResponse response = RestHelper.doPost(url, params);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            return null;
        }
    }

    public static JsonObject AccountInfo() {
        try {
            String url = ApiHelper.getApiPath("account", "info");
            HttpResponse response = RestHelper.doGet(url);
            // dar in if check mishavad ke request e ersale shode ba movafaghiyat ejra shode bashad
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                JsonObject result = ApiHelper.getResult(response);
                JsonObject jsonResult = ApiHelper.getJsonResult(result);
                System.out.println(jsonResult.toString());
            } else {
                System.out.println("Request was not successfull !");
            }
            return null;
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
            return null;
        }
    }
}
