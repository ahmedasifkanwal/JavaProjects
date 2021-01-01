/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.common.helper;

import com.bytes.hrm.dao.entity.SysAction;
import com.bytes.hrm.dao.entity.SysModules;
import com.bytes.hrm.dao.entity.SysUserAction;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author Saleem
 */
public class MakeMyStruts {

    public static void main(String[] args) {
        String isCollection = "N"; //Y or N

        Map<String, String> map = new HashMap<String, String>();

        map.put("m", ""); // to manage
        map.put("a", "");//  tp Add
        map.put("e", "");// To edit
        map.put("o", "");// to Open 
        map.put("g", "");// to get  Single Object
        if (isCollection.equals("Y")) {
            map.put("c", "All"); // To get Collection Store , like dependents , skills
        }

        String functionName = "WorkWeek";
        String pkg = "leave";

        int moduleId =13;
        int displayOrder = 0;
        StringBuffer sb = new StringBuffer();
        Iterator<Map.Entry<String, String>> i = map.entrySet().iterator();
        while (i.hasNext()) {
            displayOrder++;
            String key = i.next().getKey();
            String value = map.get(key);
            System.out.println(key + ", " + value);
            SysAction action = new SysAction();
            action.setActionName(key + functionName);
            action.setDescription(value + functionName);
            action.setTiles("link");
            if ("m".equals(key)) {
                action.setActionType("menu");
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"  method=\"search\" class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\" >/layout" + pkg + "/" + "Manage" + functionName + ".jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"error\"  >/layout" + pkg + "/" + "Manage" + functionName + ".jsp</result>");
                sb.append("\n");
                sb.append("</action>");

            } else if ("o".equals(key)) {
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"   class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\">/layout" + pkg + "/Add" + functionName + ".jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"forward\" type=\"redirectAction\" >/m" + functionName + "</result>");
                sb.append("\n");
                sb.append("</action> ");

                action.setActionType("link");
            } else if ("a".equals(key)) {
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"   class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\">/layout" + pkg + "/Add" + functionName + ".jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"forward\" type=\"redirectAction\" >/m" + functionName + "</result>");
                sb.append("\n");
                sb.append("</action> ");

                action.setActionType("link");
            } else if ("c".equals(key)) {
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"  method=\"getAll" + functionName + "\" class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\">/layout" + pkg + "/Edit" + functionName + ".jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"forward\" type=\"redirectAction\" >/c" + functionName + "</result>");
                sb.append("\n");
                sb.append("</action> ");
                action.setActionType("link");
            } else if ("g".equals(key)) {
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"  method=\"getSelected\" class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\">/layout" + pkg + "/Edit" + functionName + ".jsp</result> ");
                sb.append("\n");
                sb.append("</action> ");
                action.setActionType("link");
            } else if ("e".equals(key)) {
                sb.append("\n");
                sb.append("\n");
                sb.append("<action name=\"" + key + functionName + "\"    method=\"edit\"  class=\"com.bytes.hrm.action." + pkg + "." + functionName + "Action\" >");
                sb.append("\n");
                sb.append("<interceptor-ref name=\"sessionExpirayStack\"></interceptor-ref>");
                sb.append("\n");
                sb.append("<result name=\"invalidsession\">/layoutcommon/Login.jsp</result>");
                sb.append("\n");
                sb.append("<result name=\"success\">/layout" + pkg + "/Edit" + functionName + ".jsp</result> ");
                sb.append("\n");
                sb.append("<result name=\"forward\" type=\"redirectAction\" >/m" + functionName + "</result>");
                sb.append("\n");
                sb.append("</action>");

                action.setActionType("link");
            }
            action.setCreatedDate(new Date());
            action.setCreatedBy("Admin");
            action.setDisplayOrder(displayOrder);
            action.setStatus("A");
            action.setAuthority("Admin");
            SysModules sysModules = new SysModules();
            sysModules.setId(moduleId);
            action.setModuleId(sysModules.getId());

           //  new SysActionDaoImpl().create(action);
            SysUserAction sysUserAction = new SysUserAction();
            //sysUserAction.setActionId(action.getId());
            sysUserAction.setAuthority(action.getAuthority());
            sysUserAction.setCreatedBy(action.getCreatedBy());
            sysUserAction.setCreatedDate(action.getCreatedDate());
           // SysModules  moduleId =new SysModules();
            
           // sysUserAction.setModuleId(action.getModuleId());
            sysUserAction.setStatus(action.getStatus());

            // sysUserActionImpl.create(sysUserAction);
            System.out.println(action.toString());
            System.out.println(sysUserAction.toString());

        }
        System.out.println(sb.toString());

    }

}
