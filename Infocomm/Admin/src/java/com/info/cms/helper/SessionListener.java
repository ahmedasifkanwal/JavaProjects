/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;


import com.info.wifi.cms.entity.SysLoginHistory;
import com.info.wifi.cms.entity.controller.SysLoginHistoryJpaController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * This class is used to keep records of the currently logged in users
 *
 * @author shahab
 */
public class SessionListener implements HttpSessionListener, HttpSessionBindingListener {

    static final Logger logger = Logger.getLogger(SessionListener.class.getName());
    private static SysLoginHistoryJpaController loginHistoryFacade = new SysLoginHistoryJpaController();
    /**
     * This list contains object of LoggedInUser class. Each logged in user
     * object is registered in this map. Key is user ID and value is an object
     * of LoggedInUser class
     */
    private static Map<String, LoggedInUser> loggedInUserMap = new TreeMap<String, LoggedInUser>();
    private static List<HttpSession> sessionList = new ArrayList<HttpSession>();

    /**
     *
     * @param evt
     */
    @Override
    public void sessionCreated(HttpSessionEvent evt) {
        sessionList.add(evt.getSession());
    }

    /**
     *
     * @return
     */
    public static List<HttpSession> getSessionList() {
        return sessionList;
    }

    /**
     *
     * @param evt
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent evt) {
        LoggedInUser user = (LoggedInUser) evt.getSession().getAttribute(LoggedInUser.class.getName());
        logger.info("Logging out user: " + user);
        if (user != null) {
            logoutUser(user.getUserName(), new SysLoginHistory());
        }
        sessionList.remove(evt.getSession());
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
    }

    /**
     *
     * @return
     */
    public static Map<String, LoggedInUser> getLoggedInUserMap() {
        return loggedInUserMap;
    }

    /**
     *
     * @param userId
     * @return
     */
    public static LoggedInUser getLoggedInUser(String userId) {
        return loggedInUserMap.get(userId);
    }

    /**
     *
     * @param user
     * @param loginHistory
     */
    public static void addLoggedInUser(LoggedInUser user, SysLoginHistory loginHistory) {

        logger.info("adding logged in user: " + user);
        if (!loggedInUserMap.isEmpty()) {
            LoggedInUser alreadyuser = loggedInUserMap.get(user.getUserName());
            if (alreadyuser != null) {
                loginHistory.setLoginStatus("Multi Browser-Logout");
                /// logoutUser(alreadyuser.getUserName(), loginHistory);
            }

        }
        loggedInUserMap.put(user.getUserName(), user);
        //store login information into database table
        logger.info("Storing login information into database");
        try {
            loginHistory.setId(null);
            loginHistoryFacade.create(loginHistory);
            logger.info("Record inserted into database: " + loginHistory);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Error during inserting login history record", ex);
        }

    }

    /**
     *
     * @param userId
     * @param loginHistory
     */
    public static void logoutUser(String userId, SysLoginHistory loginHistory) {
        LoggedInUser user = loggedInUserMap.get(userId);
        logger.info("Logging out user: " + user);
        if (user != null) {
            loggedInUserMap.remove(user.getUserName());
            logger.info("Storing logout information into database: " + loginHistory);
            try {
                loginHistoryFacade.create(loginHistory);
                logger.info("Record inserted into database: " + loginHistory);
            } catch (Exception ex) {
                logger.log(Level.SEVERE, "Error during inserting logout history record", ex);
            }
            //invalidate session
            try {
                if (user.getSession() != null) {
                    user.getSession().removeAttribute(LoggedInUser.class.getName());
                    user.getSession().invalidate();
                }

            } catch (Exception e) {
            }
        }
    }

    public static Map<String, LoggedInUser> getLoggedInUser() {

        return loggedInUserMap;

    }
}
