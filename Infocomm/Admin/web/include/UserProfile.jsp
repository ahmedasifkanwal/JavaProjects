<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.wifi.cms.entity.SysModules"%>
<%@page import="java.util.List"%>
<%@page import="com.info.cms.presentation.entity.PeStatictics"%>
<%@page import="com.info.cms.helper.StaticResource"%>
<%

    SysUsers users = (SysUsers) session.getAttribute("Users");
    String name = users.getUsername() == null ? "" : users.getUsername();
    String fullName = users.getUserFullName() == null ? users.getUsername() : users.getUserFullName();


%>
<div class="tasks-menu"  style="padding-right:30px">
    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
        <span class="glyphicons glyphicons-parents"></span>  </button>
    <ul class="dropdown-menu dropdown-checklist checkbox-persist" role="menu">
        <li class="menu-arrow">
            <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">User Profile
            <span class="pull-right glyphicons glyphicons-tag">

            </span></li>
        <li>
            <ul class="dropdown-items">
                <li>
                    <div class="item-icon"><i class="fa fa-font "></i> </div>
                    <div class="item-message text-slash"><a><%=name%>(<%=fullName%>)</a></div>
                    <div class="item-label"><span class="label label-inverse">Name</span></div>

                </li>
                <li>
                    <div class="item-icon">
                        <i style="color: #0099ad;"   class="fa fa-envelope">

                        </i> </div>
                    <div class="item-message text-slash"><a><%=users.getEmail()%></a></div>
                    <div class="item-label"><span class="label label-info">Email</span></div>

                </li>

                <li>
                    <a href="Login.jsp" >
                        <div class="item-icon" >
                            <i  style="color: #D9534F;"   class="glyphicons glyphicons-power" >

                            </i> </div>
                        <div class="item-message text-slash"> Logout</div>

                    </a>
                </li>

            </ul>
        </li>
        <li class="dropdown-footer"><a href="#">View All Tasks <i class="fa fa-caret-right"></i> </a></li>
    </ul>
</div>