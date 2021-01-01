
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="java.util.List"%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.helper.LoggedInUser"%>
<%@page import="com.info.cms.helper.SessionListener"%>
<%
    java.util.Map<String, LoggedInUser> loggedInUserMap = SessionListener.getLoggedInUserMap();
    String SCREEN_ID = (String) session.getAttribute("SCREEN_ID");
    SysUsers usera = (SysUsers) session.getAttribute("Users");


%>

<header class="navbar navbar-fixed-top"  style="background-image: url(img/logos/headerbanner.png)">

    <div class="pull-left header-btns" >


        <div class="alerts-menu" style="dispalay:none">
            <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-user_add"></span> <b><%=loggedInUserMap.size()%></b> </button>
            <ul class="dropdown-menu checkbox-persist" role="menu">
                <li class="menu-arrow">
                    <div class="menu-arrow-up"></div>
                </li>
                <li class="dropdown-header">Welcome to  <span  style=" color: #bc6061">  <%=usera.getOwner() == null ? "Admin" : usera.getOwner()%> !!</span></li>
            <li>
                <ul class="dropdown-items">

                        <%  for (java.util.Map.Entry<String, LoggedInUser> e : loggedInUserMap.entrySet()) {
                                LoggedInUser user = e.getValue();
                      if (user.getAuthority().equals(UIConstants.ADVERTISER_AUTHORITY) && user.getOwner().equals(usera.getOwner())) {

                        %>
                        <li>
                            <div class="item-icon"><i style="color: #0066ad;" class="fa fa-user"></i> </div>
                            <div class="item-message"><a href="#" title="<%=user.getOwner()%>"><%=user.getName()%> <div class="pull-right"><%=user.getAuthority()%></div></a></div>
                        </li>
                        <%}
                            }
                        %>


                        <%  for (java.util.Map.Entry<String, LoggedInUser> e : loggedInUserMap.entrySet()) {
                                LoggedInUser user = e.getValue();
                                if (usera.getOwner() == null) {

                        %>
                        <li>
                            <div class="item-icon"><i style="color: #0066ad;" class="fa fa-user"></i> </div>
                            <div class="item-message"><a href="#" title="<%=user.getOwner()%>"><%=user.getName()%> <div class="pull-right"><%=user.getAuthority()%></div></a></div>
                        </li>
                        <%}
                            }
                        %>


                    </ul>
                </li>
                <li class="dropdown-footer"><a href="#">More.. <i class="fa fa-caret-right"></i> </a></li>
            </ul>
        </div>
        <% if (false) {%>

        <div class="messages-menu" >
            <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-comment"></span> <b>4</b> </button>
            <ul class="dropdown-menu checkbox-persist" role="menu">
                <li class="menu-arrow">
                    <div class="menu-arrow-up"></div>
                </li>
                <li class="dropdown-header">Recent Messages <span class="pull-right glyphicons glyphicons-comment"></span></li>
                <li>
                    <ul class="dropdown-items">
                        <li>
                            <div class="item-avatar"><img src="img/avatars/header/2.jpg" class="img-responsive" alt="avatar" /></div>
                            <div class="item-message"><b>Maggie</b> - <small class="text-muted">12 minutes ago</small><br />
                                Great work Yesterday!</div>
                        </li>
                        <li>
                            <div class="item-avatar"><img src="img/avatars/header/3.jpg" class="img-responsive" alt="avatar" /></div>
                            <div class="item-message"><b>Robert</b> - <small class="text-muted">3 hours ago</small><br />
                                Is the Titan Project still on?</div>
                        </li>
                        <li>
                            <div class="item-avatar"><img src="img/avatars/header/1.jpg" class="img-responsive" alt="avatar" /></div>
                            <div class="item-message"><b>Cynthia</b> - <small class="text-muted">14 hours ago</small><br />
                                Don't forget about the staff meeting tomorrow</div>
                        </li>
                        <li>
                            <div class="item-avatar"><img src="img/avatars/header/4.jpg" class="img-responsive" alt="avatar" /></div>
                            <div class="item-message"><b>Matt</b> - <small class="text-muted">2 days ago</small><br />
                                Thor Project cancelled, Sorry.</div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown-footer"><a href="#">View All Messages <i class="fa fa-caret-right"></i> </a></li>
            </ul>
        </div>
        <div class="alerts-menu" style="dispalay:none">
            <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-bell"></span> <b>3</b> </button>
            <ul class="dropdown-menu checkbox-persist" role="menu">
                <li class="menu-arrow">
                    <div class="menu-arrow-up"></div>
                </li>
                <li class="dropdown-header">Recent Alerts <span class="pull-right glyphicons glyphicons-bell"></span></li>
                <li>
                    <ul class="dropdown-items">
                        <li>
                            <div class="item-icon"><i style="color: #0066ad;" class="fa fa-facebook"></i> </div>
                            <div class="item-message"><a href="#">Facebook likes reached <b>8,200</b></a></div>
                        </li>
                        <li>
                            <div class="item-icon"><i style="color: #5cb85c;" class="fa fa-check"></i> </div>
                            <div class="item-message"><a href="#">Robert <b>completed task</b> - Client SEO Revamp</a></div>
                        </li>
                        <li>
                            <div class="item-icon"><i style="color: #f0ad4e" class="fa fa-user"></i> </div>
                            <div class="item-message"><a href="#"><b>Marko</b> logged 12 hours</a></div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown-footer"><a href="#">View All Alerts <i class="fa fa-caret-right"></i> </a></li>
            </ul>
        </div>
        <div class="tasks-menu" style="dispalay:none">
            <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-tag"></span> <b>7</b> </button>
            <ul class="dropdown-menu dropdown-checklist checkbox-persist" role="menu">
                <li class="menu-arrow">
                    <div class="menu-arrow-up"></div>
                </li>
                <li class="dropdown-header">Recent Tasks <span class="pull-right glyphicons glyphicons-tag"></span></li>
                <li>
                    <ul class="dropdown-items">
                        <li>
                            <div class="item-icon"><i class="fa fa-pencil"></i> </div>
                            <div class="item-message text-slash"><a>Try Clicking me!</a></div>
                            <div class="item-label"><span class="label label-danger">Urgent</span></div>
                            <div class="item-checkbox">
                                <input class="checkbox row-checkbox" type="checkbox">
                            </div>
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
                            <div class="item-icon"><i class="fa fa-flask"></i> </div>
                            <div class="item-message text-slash"><a>Find new Python Developer </a></div>
                            <div class="item-label"><span class="label label-success">Completed</span></div>
                            <div class="item-checkbox">
                                <input class="checkbox row-checkbox" type="checkbox">
                            </div>
                        </li>
                        <li>
                            <div class="item-icon"><i class="fa fa-facebook"></i> </div>
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
        <% }%>


    </div>

        <div class="pull-right" style="margin-left: 200px">
            
            <a class="navbar-brand" href="<%=SCREEN_ID%>">
                <div class="navbar-logo"><img src="img/logos/logo.png" class="img-responsive" alt="logo"/></div>
            </a>

    </div>
</header>