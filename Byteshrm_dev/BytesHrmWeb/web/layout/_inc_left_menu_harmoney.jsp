
<%@page import="com.bytes.hrm.dao.entity.SysUser"%>
<%@page import="com.bytes.hrm.dao.entity.SysModules"%>
<%@page import="com.bytes.hrm.dao.entity.SysAction"%>
<%@page import="java.util.List"%>
<!-- BEGIN SIDEBAR -->





<%
    String isPageAuthorized = "Not Authorized";
    SysUser sysUser = (SysUser) session.getAttribute("Users");
    if (session.getAttribute("Modules") == null) {%>
<jsp:forward page="../layoutcommon//Login.jsp" />
<%}

    try {
%>



<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-closed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler">
                    <span></span>
                </div>
            </li>
            <!-- END SIDEBAR TOGGLER BUTTON -->
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                                <i class="icon-magnifier"></i>
                            </a>
                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="nav-item start ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item start ">


                        <% if (sysUser.getUserAuthority().equals("ESS")) { %>
                        <a href="dashboardess.itb" class="nav-link ">
                            <i class="icon-bar-chart"></i>
                            <span class="title">My Dashboard</span>
                        </a>
                        <%  } else {%>
                        <a href="dashboard.itb" class="nav-link ">
                            <i class="icon-bar-chart"></i>
                            <span class="title">Dashboard</span>
                        </a>
                        <%  }
                        %>



                    </li>

                </ul>
            </li>



            <!-- START MENU BUILDING CODE -->
            <%
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
                    String is_found = "";
                    for (int moduleCount_m = 0; moduleCount_m < modules.size(); moduleCount_m++) {

                        SysModules moduleNode_m = modules.get(moduleCount_m);

                        if (!moduleNode_m.getApplication().equals("Harmony")) {
                            continue;
                        }

                        if (is_found.contains(moduleNode_m.getGroupType())) {
                            continue;
                        }
                        leftMenuScript.append(" <li class=\"heading\">    <h3 class=\"uppercase\">" + moduleNode_m.getGroupType() + "</h3> </li> ");

                        //
                        for (int moduleCount = 0; moduleCount < modules.size(); moduleCount++) {
                            SysModules moduleNode = modules.get(moduleCount);

                            if (!moduleNode.getApplication().equals("Harmony")) {
                                continue;
                            }

                            if (!moduleNode.getGroupType().equalsIgnoreCase(moduleNode_m.getGroupType())) {
                                continue;
                            }
                            if (is_found.contains(moduleNode_m.getGroupType())) {
                                continue;
                            }

//Build main link
                            leftMenuScript.append("<li class=\"nav-item PARENT_OPEN" + moduleCount + "\"> <a href=\"javascript:;\" class=\"nav-link nav-toggle\"> <i class=\"" + moduleNode.getCssStyle() + "\"></i><span class=\"title\">"
                                    + moduleNode.getDescription() + "</span><span class=\"arrow\"></span> </a>");

                            leftMenuScript.append("<ul class=\"sub-menu\">");

//building sun-menu
                            if (actions != null && actions.size() > 0) {
                                for (int actionsCount = 0; actionsCount < actions.size(); actionsCount++) //Module Sub menu
                                {
                                    SysAction actionNode = (SysAction) actions.get(actionsCount);

                                    if (actionNode.getActionType().equals("menu")
                                            && actionNode.getModuleId() == moduleNode.getId().intValue()) {

                                        // leftMenuScript.append("<li  class=\"CHILD" + moduleCount + actionsCount + "\"> <a href=" + actionNode.getActionName() + "><span class=\"glyphicons glyphicons-hand_right\"></span>" + actionNode.getDescription() + "</a></li>");
                                        leftMenuScript.append("<li class=\"nav-item CHILD" + moduleCount + actionsCount + "\"> <a href=" + actionNode.getActionName() + ".itb" + " class=\"nav-link \">");
                                        leftMenuScript.append(" <i class=\"icon-arrow-right\"></i> <span class=\"title\">" + actionNode.getDescription() + "</span></a></li>");

                                    }

                                }
                            }

                            //building sun-menu
                            leftMenuScript.append("</ul> </li>");

                        }
                        is_found = is_found + moduleNode_m.getGroupType();
                    }//main logical groups
/// leftMenuScript.append(" <li class=\"active\"> <a  href=\"Login.jsp\" ><span class=\"glyphicons glyphicons-power\"></span><span class=\"sidebar-title\"> Logout</span><span class=\"caret\"></span></a>   </li>");
                    session.setAttribute("MenuItem", leftMenuScript);
                } else {
                    leftMenuScript = (StringBuilder) session.getAttribute("MenuItem");
                    for (int moduleCount = 0; moduleCount < modules.size(); moduleCount++) {

                        SysModules moduleNode = modules.get(moduleCount);
                        if (!moduleNode.getApplication().equals("Harmony")) {
                            continue;
                        }

                        for (int actionsCount = 0; actionsCount < actions.size(); actionsCount++) //Module Sub menu
                        {

                            SysAction actionNode = (SysAction) actions.get(actionsCount);

                            if (actionNode.getId().intValue() == 68) {
                                String check;
                            }

                            if (actionNode.getActionType().equals("menu")
                                    && actionNode.getModuleId() == moduleNode.getId().intValue()
                                    && (actionNode.getActionName().equalsIgnoreCase(SCREEN_ID))) {
                                moduleSelectedIndex = moduleCount;
                                moduleChildSelectedIndex = actionsCount;
                                session.setAttribute("MODULECHILDSELECTEDINDEX", actionsCount);
                                session.setAttribute("MODULLESELECTEDINDEX", moduleCount);
                                session.setAttribute("SELACTIONNAME", actionNode.getDescription());
                                session.setAttribute("SELAMODULENAME", moduleNode.getDescription());
                                isPageAuthorized = "Authorized";

                                break;
                            } else if (actionNode.getActionType().equals("link")
                                    && actionNode.getModuleId() == moduleNode.getId().intValue()) {

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
                    String menuScript1 = leftMenuScript.toString().replace("PARENT_OPEN" + moduleSelectedIndex, "active open")
                            .replace("CHILD" + moduleSelectedIndex + moduleChildSelectedIndex, "active open");
                    leftMenuScript = new StringBuilder(menuScript1);
                }

                session.setAttribute("isPageAuthorized", isPageAuthorized);


            %>


            <%=leftMenuScript%>



            <!-- END CODE BUILDING MENU -->



        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->

<%
    } catch (Exception ex) {
        log("Exception:" + ex);
    }

%>