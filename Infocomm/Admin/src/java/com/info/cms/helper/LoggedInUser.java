/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

//import com.info.wifi.cms.entity.UserLoginHistory;
import com.info.wifi.cms.entity.SysLoginHistory;
import javax.servlet.http.*;

/**
 * This class represents logged in user
 * @author shahab
 */
public class LoggedInUser implements java.io.Serializable, javax.servlet.http.HttpSessionBindingListener {

    private String userId;
    private String email;
    private String name;
    private String Owner;
    private String authority;
    private HttpSession session = null;

    @Override
    public String toString() {
        return org.apache.commons.lang.builder.ToStringBuilder.reflectionToString(this);
    }

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
        SessionListener.logoutUser(userId, new SysLoginHistory());
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the authority
     */
    public String getAuthority() {
        return authority;
    }

    /**
     * @param authority the authority to set
     */
    public void setAuthority(String authority) {
        this.authority = authority;
    }

    /**
     * @return the Owner
     */
    public String getOwner() {
        return Owner;
    }

    /**
     * @param Owner the Owner to set
     */
    public void setOwner(String Owner) {
        this.Owner = Owner;
    }
}
