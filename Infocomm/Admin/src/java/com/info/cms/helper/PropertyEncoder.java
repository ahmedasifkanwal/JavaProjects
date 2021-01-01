/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.info.cms.helper;



import java.util.Locale;
import java.util.ResourceBundle;

/**
 *
 * @author software
 */
public class PropertyEncoder {
     private ResourceBundle rb = null;
    private boolean encode = false;

    /**
     *
     * @param rb
     */
    public PropertyEncoder(ResourceBundle rb) {
        this.rb = rb;
        if (rb.getLocale() != Locale.ENGLISH) {
            encode = true;
        }
    }

    /**
     *
     * @param msg
     * @return
     */
    public static String getDecimalEntities(String msg) {
        if (msg == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < msg.length(); i++) {
            if (msg.charAt(i) < 127) {
                sb.append(msg.charAt(i));
            } else {
                String c = "" + (int) msg.charAt(i);
                //prepend 0  and make it 5 digit long
                while (c.length() < 5) {
                    c = "0" + c;
                }
                sb.append("&#" + c + ";");
            }
        }
        return sb.toString();
    }
/**
 * This method is used to return Unicode String 
 * encoded into HTML decimal entities
 * @param key Key for the resource byndle
 * @return decimal entities of the string
 */
    public String getString(String key) {
        String reply = null;
        try{
        if (encode) {
            reply = getDecimalEntities(rb.getString(key));
        }else {
       reply = rb.getString(key);
       }
        }catch (Exception e){
            reply = key + "["+e.getMessage()+"]";
        }
        return reply;

    }
    /**
     * This methid is used to return value from the resource bundle
     * without any encoding
     * @param key Key for the resource byndle
     * @return plain string returned from the resource bundle
     */
    public String getPlanString(String key) {
        return rb.getString(key);
    }
}
