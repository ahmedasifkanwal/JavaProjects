<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.7
Version: 4.7.1
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<%@taglib uri="/struts-tags" prefix="s"%>
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Dashboard|Bytes</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for user account page" name="description" />
        <meta content="" name="author" />
        <%@include file="../layout/_inc_head.jsp" %>
        <jsp:include page="../layout/_inc_high_chart.jsp"/>
    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white  <%=session.getAttribute("SIDE_BAR_TOGGLE")%>" >
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                        <!-- BEGIN PAGE HEADER-->
                        <!-- BEGIN THEME PANEL -->
                        <div class="theme-panel hidden-xs hidden-sm"  >
                            <div class="toggler"> </div>
                            <div class="toggler-close"> </div>
                            <div class="theme-options">
                                <div class="theme-option theme-colors clearfix">
                                    <span> THEME COLOR </span>
                                    <ul>
                                        <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default"> </li>
                                        <li class="color-darkblue tooltips" data-style="darkblue" data-container="body" data-original-title="Dark Blue"> </li>
                                        <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue"> </li>
                                        <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey"> </li>
                                        <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light"> </li>
                                        <li class="color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2"> </li>
                                    </ul>
                                </div>
                                <div class="theme-option">
                                    <span> Theme Style </span>
                                    <select class="layout-style-option form-control input-sm">
                                        <option value="square" selected="selected">Square corners</option>
                                        <option value="rounded">Rounded corners</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Layout </span>
                                    <select class="layout-option form-control input-sm">
                                        <option value="fluid" selected="selected">Fluid</option>
                                        <option value="boxed">Boxed</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Header </span>
                                    <select class="page-header-option form-control input-sm">
                                        <option value="fixed" selected="selected">Fixed</option>
                                        <option value="default">Default</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Top Menu Dropdown</span>
                                    <select class="page-header-top-dropdown-style-option form-control input-sm">
                                        <option value="light" selected="selected">Light</option>
                                        <option value="dark">Dark</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Sidebar Mode</span>
                                    <select class="sidebar-option form-control input-sm">
                                        <option value="fixed">Fixed</option>
                                        <option value="default" selected="selected">Default</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Sidebar Menu </span>
                                    <select class="sidebar-menu-option form-control input-sm">
                                        <option value="accordion" selected="selected">Accordion</option>
                                        <option value="hover">Hover</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Sidebar Style </span>
                                    <select class="sidebar-style-option form-control input-sm">
                                        <option value="default" selected="selected">Default</option>
                                        <option value="light">Light</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Sidebar Position </span>
                                    <select class="sidebar-pos-option form-control input-sm">
                                        <option value="left" selected="selected">Left</option>
                                        <option value="right">Right</option>
                                    </select>
                                </div>
                                <div class="theme-option">
                                    <span> Footer </span>
                                    <select class="page-footer-option form-control input-sm">
                                        <option value="fixed">Fixed</option>
                                        <option value="default" selected="selected">Default</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- BEGIN DASHBOARD STATS 1-->
                        <s:form action="dashboard.itb" cssClass="horizontal-form" method="post" theme="simple" id="adminDashboard"  novalidate="novalidate">

                           
                            
                         <div class="row" style="padding-bottom:0px;">
                            <div class="col-md-6" style="padding-right:3px;">
                                <div class="portlet light ">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class=" icon-social-twitter font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">Leaves</span>
                                        </div>
                                        
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_actions_pending">
                                                <!-- BEGIN: Actions -->
                                                <div class="mt-actions">
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar10.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info "> 
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Saleem Javed</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">Sick Leave</p>
                                                                      
                                                                         <s:iterator var="p" value="empPassportList">
                                                              
                                 
                                                                            <s:property value="%{epPassportNum}" />
                                                                    
      </s:iterator>
                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">3-Jun-18</span>
                                                                    <span class=""> to </span>
                                                                    <span class="mt-action-date">10-Jun-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">Appove</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Reject</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar9.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Mohammed Ahmed</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">Casual Leave</p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">15-Aug-18</span>
                                                                    <span class=""> to </span>
                                                                    <span class="mt-action-date">20-Aug-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">Appove</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Reject</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar8.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Mohammed Abdullah</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">Travel Leave</p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">1-Aug-18</span>
                                                                    <span class=""> to </span>
                                                                    <span class="mt-action-date">1-Sep-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">Appove</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Reject</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Actions -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="padding-left:3px;">
                                <div class="portlet light ">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class=" icon-social-twitter font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">Notifications</span>
                                        </div>
                                        
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_actions_pending">
                                                <!-- BEGIN: Actions -->
                                                <div class="mt-actions">
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar7.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Abdul Hamid</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">Passport <br/></p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">29-Aug-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">9 Days</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Expiring</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar6.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Amna Khan</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">Visa</p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">26-Aug-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">5 Days</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Expiring</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar5.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Abdul Qader</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px">ID Card</p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">10-Aug-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline red btn-sm">-10 Days</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Expired</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Actions -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 0px">
                            <div class="col-lg-6 col-xs-12 col-sm-12" style="padding-right:3px;">
                                <div class="portlet light ">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class=" icon-social-twitter font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">Attendance</span>
                                        </div>
                                        
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_actions_pending">
                                                <!-- BEGIN: Actions -->
                                                <div class="mt-actions">
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar10.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info "> 
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Saleem Javed</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px"></p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">9:05 AM</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">Present</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Late</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar9.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Mohammed Asif</span>
                                                                        <p class="mt-action-desc" style="padding-bottom:2px"></p>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">08:45 AM</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">Present</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">On-Time</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Actions -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-xs-12 col-sm-12" style="padding-left:3px;">
                                <div class="portlet light ">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption">
                                            <i class=" icon-social-twitter font-dark hide"></i>
                                            <span class="caption-subject font-dark bold uppercase">Holidays</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_actions_pending">
                                                <!-- BEGIN: Actions -->
                                                <div class="mt-actions">
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar7.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">Eid-ul-Adha</span>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">21-Aug-18</span>
                                                                    <span class=""> to </span>
                                                                    <span class="mt-action-date">31-Aug-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">9 Days</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">Upcoming</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-action">
                                                        <div class="mt-action-img">
                                                            <img src="assets/pages/media/users/avatar6.jpg" /> </div>
                                                        <div class="mt-action-body">
                                                            <div class="mt-action-row">
                                                                <div class="mt-action-info ">
                                                                    <div class="mt-action-details ">
                                                                        <span class="mt-action-author">National Day</span>
                                                                    </div>
                                                                </div>
                                                                <div class="mt-action-datetime ">
                                                                    <span class="mt-action-date">19-Nov-18</span>
                                                                    <span class=""> to </span>
                                                                    <span class="mt-action-date">25-Nov-18</span>
                                                                </div>
                                                                <div class="mt-action-buttons ">
                                                                    <div class="btn-group btn-group-circle">
                                                                        <button type="button" class="btn btn-outline green btn-sm">7 Days</button>
                                                                        <button type="button" class="btn btn-outline red btn-sm">UpComing</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END: Actions -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                       </s:form>                  
                        <!-- Row 2 -->
                        <div class="row">
                            <div class="col-md-6" style="padding-right:3px;">
                                <div class="portlet box blue-steel">
                                    <div class="portlet-title">
                                        <div class="caption" style="font-size: 15px">
                                            <i class="fa fa-gift"></i>Report</div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                            <a href="javascript:;" class="reload"> </a>
                                            <a href="" class="fullscreen"> </a>
                                            <a href="javascript:;" class="remove"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body" style="padding: 0px 0px 0px 0px;">
                                        <div id="dashboard_amchart_3" class="CSSAnimationChart"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="padding-left:3px;">
                                <div class="portlet box blue-steel">
                                    <div class="portlet-title">
                                        <div class="caption" style="font-size: 15px">
                                            <i class="fa fa-gift"></i>Chart </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                            <a href="javascript:;" class="reload"> </a>
                                            <a href="" class="fullscreen"> </a>
                                            <a href="javascript:;" class="remove"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body" style="padding: 0px 0px 0px 0px;">
                                        <div id="dashboard_amchart_4" class="CSSAnimationChart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!-- END DASHBOARD STATS 2-->
                         <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <a class="dashboard-stat dashboard-stat-v2 blue" href="#">
                                    <div class="visual">
                                        <i class="fa fa-users"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">
                                            <span data-counter="counterup" data-value="22">10</span>
                                        </div>
                                        <div class="desc"> Employee </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <a class="dashboard-stat dashboard-stat-v2 red" href="#">
                                    <div class="visual">
                                        <i class="fa fa-user-secret"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">
                                            <span data-counter="counterup" data-value="2">5</span> </div>
                                        <div class="desc"> Separated </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <a class="dashboard-stat dashboard-stat-v2 green" href="#">
                                    <div class="visual">
                                        <i class="fa fa-building-o"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">
                                            <span data-counter="counterup" data-value="10">5</span>
                                        </div>
                                        <div class="desc"> Departments </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                                    <div class="visual">
                                        <i class="fa fa-globe"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number pull-left"> 
                                            <span data-counter="counterup" data-value="10">3</span> </div>
                                        <div class="desc"> Locations </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
                <!-- END CONTENT -->
                <!-- BEGIN QUICK SIDEBAR -->
                
       
                  <%@include file="../layout/_inc_head_nav.jsp" %>
                <!-- END QUICK SIDEBAR -->
            </div>
            <!-- END CONTAINER -->
            <%@include file="../layout/_inc_footer.jsp" %>           
        </div>
        <%@include file="../layout/_inc_footer_quick_nav.jsp" %>
        <%@include file="../layout/_inc_footer_script.jsp" %>
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

    </body>

</html>