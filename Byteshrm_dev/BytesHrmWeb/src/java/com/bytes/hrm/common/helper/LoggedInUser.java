/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.common.helper;

//import com.info.wifi.icms.entity.UserLoginHistory;
import javax.servlet.http.*;

/**
 * This class represents logged in user
 * @author shahab
 */
public class LoggedInUser implements java.io.Serializable, javax.servlet.http.HttpSessionBindingListener {

    private String userId;
    private HttpSession session = null;

   

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    /**
     *
     * @return
     */
    public String getUserName() {
        return userId;
    }

    /**
     *
     * @param userId
     */
    public void setUserName(String userId) {
        this.userId = userId;
    }

    /**
     *
     * @return
     */
    public HttpSession getSession() {
        return session;
    }

    /**
     *
     * @param session
     */
    public void setSession(HttpSession session) {
        this.session = session;
    }

    /**
     *
     * @param arg0
     */
    @Override
    public void valueBound(HttpSessionBindingEvent arg0) {
    }

    /**
     *
     * @param arg0
     */
    @Override
    public void valueUnbound(HttpSessionBindingEvent arg0) {
       // SessionListener.logoutUser(userId,new UserLoginHistory());
    }
}
