package com.kavtion.models;

import com.kavtion.helpers.DateHelper;

public class Message {
    //Model Variables ===========================================================================================//

    private int id;
    private String message;
    private String sender;
    private String receptor;
    private long date;

    //Constructors  =============================================================================================//
    public Message(String message, String receptor, String sender) {
        this.message = message;
        this.sender = sender;
        this.receptor = receptor;
        
    }

    public Message(String message, String receptor, String sender, long date) {
        this.message = message;
        this.sender = sender;
        this.receptor = receptor;
        this.date = date;
    }

    //Properties ================================================================================================//
    public long getDate() {
        return date;
    }

    public void setDate(long date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceptor() {
        return receptor;
    }
}