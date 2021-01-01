
<%@page import="com.info.cms.presentation.entity.PeAlert"%>
<%@page import="com.info.cms.facade.SystemAlertFacade"%>
<%@page import="com.info.cms.entity.SysUsers"%>
<%@page import="com.info.cms.entity.SysModules"%>
<%@page import="java.util.List"%>
<%@page import="com.info.cms.presentation.entity.PeStatictics"%>
<%@page import="com.info.cms.helper.StaticResource"%>
<%

    PeAlert peAlert = null;

    peAlert = new SystemAlertFacade().getSystemAlerts();
    if (session.getAttribute("peAlert") == null) {

        session.setAttribute("peAlert", peAlert);
    } else {
        peAlert = (PeAlert) session.getAttribute("peAlert");
    }


%>




<div class="tasks-menu" >
    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown">
        <span class="glyphicons glyphicons-bell"></span> <b>7</b> </button>
    <ul class="dropdown-menu dropdown-checklist checkbox-persist" role="menu">
        <li class="menu-arrow">
            <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">Recent Alerts <span class="pull-right glyphicons glyphicons-tag"></span></li>
        <li>
            <ul class="dropdown-items">
                <% for (int j = 0; j < peAlert.getPeAlertList().size(); j++) {%>
                <li>
                    <div class="item-icon"><i  style="<%=peAlert.getPeAlertList().get(j).getIconColor()%>"   class="<%=peAlert.getPeAlertList().get(j).getIconName()%>"></i> </div>
                    <div class="item-message text-slash"><a><%=peAlert.getPeAlertList().get(j).getMessage()%></a></div>
                    <div class="item-label"><span <%=peAlert.getPeAlertList().get(j).getTypeClass()%>><%=peAlert.getPeAlertList().get(j).getType()%></span></div>

                </li>

                <%}%>
            </ul>
        </li>
        <li class="dropdown-footer"><a href="#">View All Alerts <i class="fa fa-caret-right"></i> </a></li>
    </ul>
</div>




<div class="tasks-menu" style="display: none">
    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> 
        <span class="glyphicons glyphicons-bell"></span> <b>7</b> </button>
    <ul class="dropdown-menu dropdown-checklist checkbox-persist" role="menu">
        <li class="menu-arrow">
            <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">Recent Tasks <span class="pull-right glyphicons glyphicons-tag"></span></li>
        <li>
            <ul class="dropdown-items">
                <li>
                    <div class="item-icon"><i class="fa fa-dollar"></i> </div>
                    <div class="item-message text-slash"><a>Try Clicking me!</a></div>
                    <div class="item-label"><span class="label label-danger">Urgent</span></div>

                </li>
                <li>
                    <div class="item-icon"><i class="fa fa-phone"></i> </div>
                    <div class="item-message text-slash"><a>Contact Client and request Approval</a></div>
                    <div class="item-label"><span class="label label-info">Normal</span></div>
                    <div class="item-checkbox">
                        <input class="checkbox row-checkbox" type="checkbox">
                    </div>
                </li>
                <li>
                    <div class="item-icon"><i style="color: #0066ad;"  class="fa fa-flask"></i> </div>
                    <div class="item-message text-slash"><a>Find new Python Developer </a></div>
                    <div class="item-label"><span class="label label-success">Completed</span></div>
                    <div class="item-checkbox">
                        <input class="checkbox row-checkbox" type="checkbox">
                    </div>
                </li>
                <li>
                    <div class="item-icon"><i class="fa fa-legal"></i> </div>
                    <div class="item-message text-slash"><a>Update Facebook Page with Halloween Pictures</a></div>
                    <div class="item-label"><span class="label label-primary">In Progress</span></div>
                    <div class="item-checkbox">
                        <input class="checkbox row-checkbox" type="checkbox">
                    </div>
                </li>
                <li>
                    <div class="item-icon"><i class="fa fa-group"></i> </div>
                    <div class="item-message text-slash"><a>Organize next Staff Meeting</a></div>
                    <div class="item-label"><span class="label label-success">Completed</span></div>
                    <div class="item-checkbox">
                        <input class="checkbox row-checkbox" type="checkbox">
                    </div>
                </li>
                <li>
                    <div class="item-icon"><i class="fa fa-plane"></i> </div>
                    <div class="item-message text-slash"><a>Interview new applicant</a></div>
                    <div class="item-label"><span class="label label-warning">Moderate</span></div>
                    <div class="item-checkbox">
                        <input class="checkbox row-checkbox" type="checkbox">
                    </div>
                </li>
            </ul>
        </li>
        <li class="dropdown-footer"><a href="#">View All Tasks <i class="fa fa-caret-right"></i> </a></li>
    </ul>
</div>