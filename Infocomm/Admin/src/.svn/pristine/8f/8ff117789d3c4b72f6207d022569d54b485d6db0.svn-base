/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.interceptor;

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

    static final Logger logger = Logger.getLogger(SessionCheckInterceptor.class.getName());

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {

        ActionProxy proxy = invocation.getProxy();
        Map results = proxy.getConfig().getResults();
        Map sessionMap = invocation.getInvocationContext().getSession();
        if (sessionMap == null || sessionMap.isEmpty() || sessionMap.get("Users") == null) {
            logger.info("Session has expired.");
            addActionError(invocation, "Your session has been expired.Please login again.");
            return "invalidsession";
        }
        logger.info("Session has created.");
        sessionMap.put("SCREEN_ID", proxy.getActionName() + ".icms");
        return invocation.invoke();
    }

    private void addActionError(ActionInvocation invocation, String message) {
        Object action = invocation.getAction();
        if (action instanceof ValidationAware) {
            ((ValidationAware) action).addActionError(message);
        }
    }

}
