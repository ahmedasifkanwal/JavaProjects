
<%@page import="com.info.wifi.cms.entity.SysModules"%>
<%@page import="com.info.wifi.cms.entity.SysAction"%>
<%@page import="java.util.Vector"%>

<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<body>
    <%if (session.getAttribute("Modules") == null) {%>
    <jsp:forward page="/Login.jsp" />
    <%}%>

    <%
        String isPageAuthorized = "Not Authorized";
        List<SysModules> modules = (List<SysModules>) session.getAttribute("Modules");
        List<SysAction> actions = (List<SysAction>) session.getAttribute("Actions");

        // String menu = "";
        StringBuilder leftMenuScript = new StringBuilder();
        String SCREEN_ID = (String) session.getAttribute("SCREEN_ID");

        int moduleSelectedIndex = 0;
        int moduleChildSelectedIndex = 0;
        //String[] iconArray1 = {"glyphicons-show_lines", "glyphicons-adjust_alt", "glyphicons-vcard", "glyphicons-table", "glyphicons-message_new", "glyphicons-settings", "glyphicons-settings", "glyphicons-settings"};
        //First time login
        if (session.getAttribute("MenuItem") == null) {
            isPageAuthorized = "Authorized";
            for (int moduleCount = 0; moduleCount < modules.size(); moduleCount++) {
                SysModules moduleNode = modules.get(moduleCount);
                //Build main link

                leftMenuScript.append("<li class=\"PARENT" + moduleCount + "\"> <a class=\"accordion-toggle PARENT_OPEN" + moduleCount + "\" href='#'" + moduleCount + "' ><span class=\"glyphicons " + moduleNode.getCssStyle() + "\"></span><span class=\"sidebar-title\">" + moduleNode.getDescription() + "</span><span class=\"caret\"></span></a>");
                leftMenuScript.append("<ul id=\"sideFour\" class=\"nav sub-nav\">");

                if (actions != null && actions.size() > 0) {
                    for (int actionsCount = 0; actionsCount < actions.size(); actionsCount++) //Module Sub menu
                    {
                        SysAction actionNode = (SysAction) actions.get(actionsCount);
                        if (actionNode.getActionType().equals("menu")
                                    && actionNode.getModuleId().getId().intValue() == moduleNode.getId().intValue()) {

                            leftMenuScript.append("<li  class=\"CHILD" + moduleCount + actionsCount + "\"> <a href=" + actionNode.getActionName() + "><span class=\"glyphicons glyphicons-hand_right\"></span>" + actionNode.getDescription() + "</a></li>");

                        }

                    }
                }

                leftMenuScript.append("  </ul> </li>");
            }

                leftMenuScript.append(" <li class=\"active\"> <a  href=\"Login.jsp\" ><span class=\"glyphicons glyphicons-power\"></span><span class=\"sidebar-title\"> Logout</span><span class=\"caret\"></span></a>   </li>");
                session.setAttribute("MenuItem", leftMenuScript);
        } else {
            leftMenuScript = (StringBuilder) session.getAttribute("MenuItem");
            for (int moduleCount = 0; moduleCount < modules.size(); moduleCount++) {

                SysModules moduleNode = modules.get(moduleCount);

                for (int actionsCount = 0; actionsCount < actions.size(); actionsCount++) //Module Sub menu
                {
                    SysAction actionNode = (SysAction) actions.get(actionsCount);
                    if (actionNode.getActionType().equals("menu")
                                && actionNode.getModuleId().getId().intValue() == moduleNode.getId().intValue()
                                && (actionNode.getActionName().equalsIgnoreCase(SCREEN_ID))) {
                        moduleSelectedIndex = moduleCount;
                        moduleChildSelectedIndex = actionsCount;
                        session.setAttribute("MODULECHILDSELECTEDINDEX", actionsCount);
                        session.setAttribute("MODULLESELECTEDINDEX", moduleCount);
                        session.setAttribute("SELACTIONNAME", actionNode.getDescription());
                        session.setAttribute("SELAMODULENAME", moduleNode.getDescription());
                        isPageAuthorized = "Authorized";

                        break;
                    } else if (actionNode.getActionType().equals("link") && actionNode.getModuleId().getId().intValue() == moduleNode.getId().intValue()) {

                        if (actionNode.getActionName().equalsIgnoreCase(SCREEN_ID)) {

                            if (session.getAttribute("MODULECHILDSELECTEDINDEX") != null) {
                                moduleChildSelectedIndex = (Integer) session.getAttribute("MODULECHILDSELECTEDINDEX");
                            }
                            if (session.getAttribute("MODULLESELECTEDINDEX") != null) {
                                moduleSelectedIndex = (Integer) session.getAttribute("MODULLESELECTEDINDEX");
                            }
                            session.setAttribute("SELACTIONNAME", actionNode.getDescription());
                            session.setAttribute("SELAMODULENAME", moduleNode.getDescription());
                            isPageAuthorized = "Authorized";
                            moduleSelectedIndex = moduleCount;
                            break;

                        }

                    }

                }

            }
            String menuScript1 = leftMenuScript.toString().replace("PARENT" + moduleSelectedIndex, "active").replace("PARENT_OPEN" + moduleSelectedIndex, "menu-open")
                        .replace("CHILD" + moduleSelectedIndex + moduleChildSelectedIndex, "active");
            leftMenuScript = new StringBuilder(menuScript1);

        }

        session.setAttribute("isPageAuthorized", isPageAuthorized);

    %>



    <%=leftMenuScript%>

</body>



