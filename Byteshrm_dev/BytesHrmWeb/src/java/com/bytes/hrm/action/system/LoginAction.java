/*
 * created By                  created On     Modified On                   Remarks
 * Mohd. Rehan                 18-feb-2013     25-Feb-2013                 Code Review
 */
package com.bytes.hrm.action.system;

import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.common.helper.DateHelper;
import com.bytes.hrm.common.helper.LoggedInUser;
import com.bytes.hrm.common.helper.SessionListener;
import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysAuthorities;
import com.bytes.hrm.dao.entity.SysLoginHistory;
import com.bytes.hrm.dao.entity.SysUserAction;
import com.bytes.hrm.dao.entity.SysUser;
import com.bytes.hrm.service.system.SysAuthoritiesServiceImpl;
import com.bytes.hrm.service.system.SysAuthoritiesService;
import com.bytes.hrm.service.system.SysModulesServiceImpl;
import com.bytes.hrm.service.system.SysModulesService;
import com.bytes.hrm.service.system.SysUserActionServiceImpl;
import com.bytes.hrm.service.system.SysUserActionService;
import com.bytes.hrm.service.system.SysUserServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.bytes.hrm.service.system.SysUserService;
import java.util.Collection;

public class LoginAction extends ActionSupport {

    private String SUCCESS_ESS = "successess";
    private String userName;
    private String userPassWord;
    static final Logger logger = Logger.getLogger(LoginAction.class.getName());
    //Service 
    SysUserService sysUsersService = new SysUserServiceImpl();
    SysModulesService sysModulesService = new SysModulesServiceImpl();
    SysAuthoritiesService sysAuthoritiesService = new SysAuthoritiesServiceImpl();
    SysUserActionService sysUserActionService = new SysUserActionServiceImpl();

    //Service 
    public String login() {
        return SUCCESS;

    }

    private SysUser isValidInput() {

        SysUser sysUsers = null;
        SysAuthorities sysAuthorities = null;

        logger.log(Level.INFO, "Login user:{0}", this.getUserName());
        logger.log(Level.INFO, "Login user:{0}", this.userPassWord);
        if (StringHelper.isNullOrEmpty(this.getUserName())) {
            addActionError("Username required.");
        } else if (StringHelper.isNullOrEmpty(this.userPassWord)) {
            addActionError("Password required!");
        } else {
            logger.log(Level.INFO, "Login start user:{0}", this.getUserName());
            sysUsers = sysUsersService.findSysUsers(this.getUserName());
            sysAuthorities = sysAuthoritiesService.findAuthority(sysUsers.getUserAuthority());

            logger.log(Level.INFO, "Login user:{0}", sysUsers);

            if (!sysUsers.getUsername().equals("systemadmin")
                    && (sysAuthorities == null || !sysAuthorities.getStatus().equals("A"))) {
                addActionError("Username not valid.");

                logger.log(Level.INFO, "Username not valid." + sysAuthorities.getStatus());
            } else if (sysUsers == null) {
                addActionError("Username not valid.");
                logger.log(Level.INFO, "Username not valid." + sysAuthorities.getStatus());
            } else if (sysUsers.getUsername().equals("systemadmin")) {

                /*if (!StringHelper.paasordEncodeMD5(this.userPassWord, "yes")
                 .equals(sysUsers.getPassword())) {
                 addActionError(getText("E_E35"));
                 }*/
                if (!this.userPassWord.equals(sysUsers.getPassword())) {
                    addActionError(("Password is required!"));
                }

            } else // if (!StringHelper.paasordEncodeMD5(this.userPassWord, user.getIsEncripted())
            // .equals(user.getPassword()))
            {
                if (!this.userPassWord
                        .equals(sysUsers.getPassword())) {

                    addActionError("Password incorrect.");

                    logger.log(Level.INFO, "Password incorrect" + sysUsers.getPassword() + this.userPassWord);

                } else if (!sysUsers.getStatus().equalsIgnoreCase("A")) {
                    addActionError(getText("E_E39"));
                } else if (!sysUsers.getUsername().equals("systemadmin") && !DateHelper.isGreaterToCurrentDate((sysUsers.getExpiryDate()))) {
                    addActionError("User account expired.");
                    logger.log(Level.INFO, "User account expired" + sysUsers.getPassword() + this.userPassWord);
                }
            }

        }
        logger.log(Level.INFO, "Login Validated", sysUsers);

        return sysUsers;
    }

    @Override
    public String execute() {
        logger.info("execute Method:");
        try {

            SysUser sysUsers = isValidInput();
            logger.log(Level.INFO, "execute Method user:{0}", getActionErrors().size() + "" + " " + getActionMessages().size() + "");

            if (getActionErrors().size() <= 0 && getActionMessages().size() <= 0) {
                sysUsers.setLastLoginDate(DateHelper.getCurrentDate());
                logger.log(Level.INFO, "Start Login Update", sysUsers);
                ///  sysUsersService.update(sysUsers);
                logger.log(Level.INFO, "End Login Update", sysUsers);
                List modules = null;
                Collection< SysUserAction> sysUserActionList = null;
                if (sysUsers.getUserAuthority().equals("System")) {
                    modules = sysModulesService.findAll();//dSysModulesEntities();
                } else {
                    sysUserActionList = sysUserActionService.findUserActionByRole(sysUsers.getUserAuthority());
                    modules = sysModulesService.findAssignedModulesMapping(sysUserActionList);
                }  //Get modules associated in acending order based on the sequence defined

                //   if (sysUserActionList != null) 
                {

                    Map session = ActionContext.getContext().getSession();
                    session.put("SIDE_BAR_TOGGLE", "page-sidebar-close");
                    session.put("Modules", modules);
                    //Get modules associated in acending order based on the sequence defined

                    if (sysUsers.getUserAuthority().equals("System")) {

                        List<SysAction> sysActionList = sysUserActionService.findAllAction();//findSysActionEntities();
                        session.put("Actions", sysActionList);
                    } else {
                        List<SysAction> moduleActions = sysUsersService.findAssignedModuleActions(sysUserActionList);
                        session.put("Actions", moduleActions);
                    }
                    session.put("Application", "Harmony");
                    session.put("Users", sysUsers);
                    session.put("Authority", sysUsers.getUserAuthority());
                    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
                    //Log in DB
                    LoggedInUser logUser = new LoggedInUser();
                    logUser.setUserName(sysUsers.getUsername());
                    logUser.setSession(request.getSession(true));

                    //Need to Log
                    SysLoginHistory loginHistory = new SysLoginHistory();
                    loginHistory.setCountry(request.getLocale().getDisplayCountry());
                    loginHistory.setIp(request.getRemoteAddr());
                    loginHistory.setHost(request.getRemoteHost());
                    //loginHistory.setPort(request.getRemotePort());
                    loginHistory.setEmailId(sysUsers.getEmail());
                    loginHistory.setLoginDatetime(DateHelper.getCurrentDate());
                    loginHistory.setLoginStatus("Logged-In");
                    loginHistory.setUserName(sysUsers.getUsername());
                    loginHistory.setUsertype(StringHelper.isNullOrEmpty(sysUsers.getUserAuthority()) ? "" : sysUsers.getUserAuthority());
                    System.out.print("Updatting History Begin");
                    // new SessionListener().addLoggedInUser(logUser, loginHistory);
                    System.out.print("Updatting  History End");

                }
            } else {
                System.out.print("Error");
                return "error";
            }

            if (sysUsers.getUserAuthority().equals("ESS")) {
                return SUCCESS_ESS;
            } else {
                return SUCCESS;
            }
        } catch (Exception ex) {
            if (ex != null) {
                logger.severe("Exeption in execute" + ex.getMessage());
            } else {
                logger.severe("Exeption in execute" + "NULL EXCEPTION");
            }
            return "GLOBAL_ERROR";
        }

    }

    public String logout() {
        logger.info("----------------execute Method:logout----------");
        try {
            HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

            if (request != null && request.getSession(true) != null) {

                //Log in DB
                LoggedInUser logUser = new LoggedInUser();
                SysUser sysUsers = (SysUser) request.getSession(true).getAttribute("Users");
                logUser.setUserName(sysUsers.getUsername());
                logUser.setSession(request.getSession(true));
                //Need to Log
                SysLoginHistory loginHistory = new SysLoginHistory();
                loginHistory.setCountry(request.getLocale().getDisplayCountry());
                loginHistory.setIp(request.getRemoteAddr());
                loginHistory.setHost(request.getRemoteHost());
                //loginHistory.setPort(request.getRemotePort());
                loginHistory.setEmailId(sysUsers.getEmail());
                loginHistory.setLoginDatetime(DateHelper.getCurrentDate());
                loginHistory.setLoginStatus("Logged-Out");
                loginHistory.setUserName(sysUsers.getUsername());
                loginHistory.setUsertype(StringHelper.isNullOrEmpty(sysUsers.getUserAuthority()) ? "" : sysUsers.getUserAuthority());
                System.out.print("Updatting History Begin");
                new SessionListener().logoutUser(sysUsers.getUsername(), loginHistory);
                System.out.print("Updatting  History End");

            }

        } catch (Exception ex) {
            if (ex != null) {
                logger.severe("Exeption in execute" + ex.getMessage());
            } else {
                logger.severe("Exeption in execute" + "NULL EXCEPTION");
            }
            return "GLOBAL_ERROR";
        }

        return SUCCESS;
    }

    public String search() {
        try {

            userName = "saleee";

        } catch (Exception ex) {

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
