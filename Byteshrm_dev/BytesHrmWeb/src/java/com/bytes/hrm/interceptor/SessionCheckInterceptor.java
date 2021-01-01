/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.interceptor;

/**
 *
 * @author mohd rehan
 */
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;
import java.util.logging.Logger;

public class SessionCheckInterceptor extends AbstractInterceptor {

    static final Logger LOGGER = Logger.getLogger(SessionCheckInterceptor.class.getName());

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {

        try {
            ActionProxy proxy = invocation.getProxy();
            Map results = proxy.getConfig().getResults();
            Map sessionMap = invocation.getInvocationContext().getSession();
             if (sessionMap == null || sessionMap.isEmpty() || sessionMap.get("Users") == null) {
              LOGGER.info("Session has expired.");
           addActionError(invocation, "Your session has been expired.Please login again.");
          return "invalidsession";
           }

            sessionMap.put("SCREEN_ID", proxy.getActionName());
            LOGGER.info("Session has created.");
            return invocation.invoke();

        } catch (Exception ex) {
            LOGGER.info("intercept error:" + ex);
        }
        return null;
    }

    private void addActionError(ActionInvocation invocation, String message) {
        Object action = invocation.getAction();
        if (action instanceof ValidationAware) {
            ((ValidationAware) action).addActionError(message);
        }
    }

}
