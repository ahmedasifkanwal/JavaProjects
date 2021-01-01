
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.wifi.cms.entity.SysModules"%>
<%@page import="java.util.List"%>
<%@page import="com.info.cms.presentation.entity.PeStatictics"%>
<%@page import="com.info.cms.helper.StaticResource"%>
<%

    PeStatictics pe = StaticResource.getStatistics();
    boolean isBilling = false;
    SysUsers user = (SysUsers) session.getAttribute("Users");
    List<SysModules> listModule = (List<SysModules>) session.getAttribute("Modules");


%>
<div class="alerts-menu">


    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" title="System Statistics">
        <span class="glyphicons glyphicons-camera"></span> <b>3</b> </button>

    <ul class="dropdown-menu checkbox-persist" role="menu">
        <li class="menu-arrow">
            <div class="menu-arrow-up"></div>
        </li>
        <li class="dropdown-header">Statistics <span class="pull-right glyphicons glyphicons-bell"></span></li>
        <li>
            <ul class="dropdown-items">
                <li title="Active Gateway">
                    <div class="item-icon">
                        <i style="color: #0066ad;" class="glyphicons glyphicons glyphicons-router"></i> </div>
                    <div class="item-message"><a href="searchgateway.icms">No of Gateway  <b class="label label-success"><%=pe.getGatewayCount()%></b></a></div>
                </li>
                <li title="Active Gateway">
                    <div class="item-icon">
                        <i style="color: #0066ad;" class="glyphicons glyphicons glyphicons-router"></i> </div>
                    <div class="item-message"><a href="searchgateway.icms">No of Gateway  <b class="label label-success"><%=pe.getGatewayCount()%></b></a></div>
                </li>
                <li  title="Active Vlan">
                    <div class="item-icon"><i style="color: #5cb85c;" class="glyphicons glyphicons-signal"></i> </div>
                    <div class="item-message"><a href="searchvlan.icms">No of Active Vlan <b class="label label-success"><%=pe.getVlanCount()%></b></a></div>
                </li>
                <li  title="Online Users">
                    <div class="item-icon"><i style="color: #f0ad4e" class="fa fa-user"></i> </div>
                    <div class="item-message"><a href="onlineuser.icms">Online Users <b class="label label-success"><%=pe.getOnlineCount()%></b></a></div>
                </li>



            </ul>
        </li>
        <li class="dropdown-footer"><a href="#">View All Alerts <i class="fa fa-caret-right"></i> </a></li>
    </ul>
</div>