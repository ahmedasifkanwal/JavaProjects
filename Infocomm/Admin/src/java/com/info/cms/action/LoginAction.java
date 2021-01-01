/*
 * created By                  created On     Modified On                   Remarks
 * Mohd. Rehan                 18-feb-2013     25-Feb-2013                 Code Review
 */
package com.info.cms.action;

import com.info.cms.helper.DateHelper;
import com.info.cms.helper.LoggedInUser;
import com.info.cms.helper.SessionListener;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.wifi.cms.entity.SysAction;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.entity.SysLoginHistory;
import com.info.wifi.cms.entity.SysUserAction;
import com.info.wifi.cms.entity.SysUsers;
import com.info.wifi.cms.entity.controller.SysActionJpaController;
import com.info.wifi.cms.entity.controller.SysAuthoritiesJpaController;
import com.info.wifi.cms.entity.controller.SysModulesJpaController;
import com.info.wifi.cms.entity.controller.SysUserActionJpaController;
import com.info.wifi.cms.entity.controller.SysUsersJpaController;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class LoginAction extends MyActionSupport {

    private String userName;
    private String userPassWord;
    static final Logger logger = Logger.getLogger(LoginAction.class.getName());

    private SysUsers isValidInputInput() {

        SysUsers user = null;
        logger.log(Level.INFO, "Login user:{0}", this.getUserName());
        logger.log(Level.INFO, "Login user:{0}", this.userPassWord);
        if (StringHelper.isNullOrEmpty(this.getUserName())) {
            addActionError(getText("E_E30"));
        } else if (StringHelper.isNullOrEmpty(this.userPassWord)) {
            addActionError(getText("E_E31"));
        } else {
            SysUsersJpaController userController = new SysUsersJpaController();
            user = userController.findSysUsers(this.getUserName());
            SysAuthorities sysAuthorities = new SysAuthoritiesJpaController().findAuthority(user.getUserAuthority());

            if (!user.getUsername().equals("systemadmin")
                    && (sysAuthorities == null || !sysAuthorities.getStatus().equals("A"))) {
                addActionError(getText("E_E39"));
            } else if (user == null) {
                addActionError(getText("E_E38"));
            } else if (user.getUsername().equals("systemadmin")) {

                /*if (!StringHelper.paasordEncodeMD5(this.userPassWord, "yes")
                 .equals(user.getPassword())) {
                 addActionError(getText("E_E35"));
                 }*/
                if (!this.userPassWord.equals(user.getPassword())) {
                    addActionError(getText("E_E35"));
                }

            } else // if (!StringHelper.paasordEncodeMD5(this.userPassWord, user.getIsEncripted())
            // .equals(user.getPassword()))
             if (!this.userPassWord
                        .equals(user.getPassword())) {

                    addActionError(getText("E_E35"));

                } else if (!user.getStatus().equalsIgnoreCase(UIConstants.STATUS_CODE.ACTIVE.value)) {
                    addActionError(getText("E_E39"));
                } else if (!user.getUsername().equals("systemadmin") && !DateHelper.isGreaterToCurrentDate((user.getExpiryDate()))) {
                    addActionError(getText("E_E40"));
                }

        }

        return user;
    }

    @Override
    public String execute() {
        logger.info("execute Method:");
        try {
            SysUsersJpaController sysUsersJpaController = new SysUsersJpaController();
            SysUsers user = isValidInputInput();
            logger.log(Level.INFO, "execute Method user:{0}", user);
            if (getActionErrors().size() <= 0 && getActionMessages().size() <= 0) {
                user.setLastLoginDate(DateHelper.getCurrentDate());
                sysUsersJpaController.edit(user);
                SysUserActionJpaController sysUserActionJpaController = new SysUserActionJpaController();
                SysModulesJpaController modulesController = new SysModulesJpaController();
                List modules = null;
                List< SysUserAction> sysUserActionList = null;
                if (user.getUserAuthority().equals("System")) {
                    modules = modulesController.findSysModulesEntities();
                } else {
                    sysUserActionList = sysUserActionJpaController.findGroupActionsByUser(user.getUserAuthority());
                    modules = modulesController.findAssignedModulesMapping(sysUserActionList);
                }  //Get modules associated in acending order based on the sequence defined

                //  if (sysUserActionList != null)
                {

                    Map session = ActionContext.getContext().getSession();
                    session.put("SIDE_BAR_TOGGLE", "sidebar-collapsed");
                    session.put("Modules", modules);
                    //Get modules associated in acending order based on the sequence defined

                    if (user.getUserAuthority().equals("System")) {

                        List<SysAction> sysActionList = new SysActionJpaController().findSysActionEntities();
                        session.put("Actions", sysActionList);
                    } else {
                        List<SysAction> moduleActions = sysUsersJpaController.findAssignedModuleActions(sysUserActionList);
                        session.put("Actions", moduleActions);
                    }
                    
                   
                    
                    session.put("Users", user);
                    session.put("Authority", user.getUserAuthority());
                    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
                    //Log in DB
                    LoggedInUser logUser = new LoggedInUser();
                    logUser.setName(user.getUserFullName());
                    logUser.setEmail(user.getEmail());
                    logUser.setAuthority(user.getUserAuthority());
                    logUser.setUserName(user.getUsername());
                    logUser.setOwner(user.getOwner());
                    logUser.setSession(request.getSession(true));
                    //Need to Log
                    SysLoginHistory loginHistory = new SysLoginHistory();
                    loginHistory.setCountry(request.getLocale().getDisplayCountry());
                    loginHistory.setIp(request.getRemoteAddr());
                    loginHistory.setHost(request.getRemoteHost());
                    //loginHistory.setPort(request.getRemotePort());
                    loginHistory.setEmailId(user.getEmail());
                    loginHistory.setLoginDatetime(DateHelper.getCurrentDate());
                    loginHistory.setLoginStatus("Logged-In");
                    loginHistory.setUserName(user.getUsername());
                    loginHistory.setUsertype(StringHelper.isNullOrEmpty(user.getUserAuthority()) ? "" : user.getUserAuthority());
                    SessionListener.addLoggedInUser(logUser, loginHistory);
                    if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
                        return SUCCESSBUSINESS;
                    }

                }
            } else {

                return "error";
            }
        } catch (Exception ex) {
            if (ex != null) {
                logger.log(Level.SEVERE, "Exeption in execute{0}", ex.getMessage());
            } else {
                logger.severe("Exeption in execute" + "NULL EXCEPTION");
            }
            return UIConstants.GLOBAL_ERROR;
        }

        return SUCCESS;
    }

    /**
     * @return the userPassWord
     */
    public String getUserPassWord() {
        return userPassWord;
    }

    /**
     * @param userPassWord the userPassWord to set
     */
    public void setUserPassWord(String userPassWord) {
        this.userPassWord = userPassWord;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

}
