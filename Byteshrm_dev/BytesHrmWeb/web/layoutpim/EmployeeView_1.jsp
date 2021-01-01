<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>


        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->



    </head>
    <!-- END HEAD -->
    <style>

        .errorMessage

        {

            color: red;
            list-style: none;



        }

    </style>
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">



        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">

                        <div class="portlet-body">
                            <div class="timeline">
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_1.jpg"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        
                                       
                                                            <div class="portlet blue-hoki box">
                                                                <div class="portlet-title">
                                                                    <div class="caption">
                                                                        <i class="fa fa-cogs"></i>Customer Information </div>
                                                                    <div class="actions">
                                                                        <a href="javascript:;" class="btn btn-default btn-sm">
                                                                            <i class="fa fa-pencil"></i> Edit </a>
                                                                    </div>
                                                                </div>
                                                                <div class="portlet-body">
                                                                    <div class="row static-info">
                                                                        <div class="col-md-5 name"> Customer Name: </div>
                                                                        <div class="col-md-7 value"> Jhon Doe </div>
                                                                    </div>
                                                                    <div class="row static-info">
                                                                        <div class="col-md-5 name"> Email: </div>
                                                                        <div class="col-md-7 value"> jhon@doe.com </div>
                                                                    </div>
                                                                    <div class="row static-info">
                                                                        <div class="col-md-5 name"> State: </div>
                                                                        <div class="col-md-7 value"> New York </div>
                                                                    </div>
                                                                    <div class="row static-info">
                                                                        <div class="col-md-5 name"> Phone Number: </div>
                                                                        <div class="col-md-7 value"> 12234389 </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                     
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge ">
                                       <div class="timeline-icon">
                                            <i class="icon-bag font-red-pink"></i>
                                        </div> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">Vanessa Bond</a>
                                                <span class="timeline-body-time font-grey-cascade">Posted new post at 5:10 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions"> </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <span class="font-grey-cascade">
                                                <p>
                                                    <img class="timeline-body-img pull-right" src="assets/pages/media/blog/4.jpg" alt=""> Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard
                                                    greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. coriander bitterleaf epazote radicchio shallot winter purslane collard. </p>
                                                <p> Coriander bitterleaf epazote radicchio shallot winter purslane collard. Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery
                                                    coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. </p>
                                                <p>
                                                    <img class="timeline-body-img pull-left" src="assets/pages/media/blog/6.jpg" alt=""> Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard
                                                    greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi radicchio shallot winter purslane collard greens spring onion squash lentil.
                                                </p>
                                                <p> Coriander bitterleaf epazote radicchio shallot winter purslane collard. Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery
                                                    coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                                <!-- TIMELINE ITEM WITH GOOGLE MAP -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_3.jpg"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">Carles Puyol</a>
                                                <span class="timeline-body-time font-grey-cascade">Added office location at 2:50 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions">
                                                <div class="btn-group">
                                                    <button class="btn btn-circle btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                        <li>
                                                            <a href="javascript:;">Action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Another action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Something else here </a>
                                                        </li>
                                                        <li class="divider"> </li>
                                                        <li>
                                                            <a href="javascript:;">Separated link </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <div id="gmap_polygons" class="gmaps"> </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM WITH GOOGLE MAP -->
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <div class="timeline-icon">
                                            <i class="icon-user-following font-green-haze"></i>
                                        </div>
                                    </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <span class="timeline-body-alerttitle font-red-intense">You have new follower</span>
                                                <span class="timeline-body-time font-grey-cascade">at 11:00 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions">
                                                <div class="btn-group">
                                                    <button class="btn btn-circle green btn-outline

                                                            btn-sm dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                        <li>
                                                            <a href="javascript:;">Action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Another action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Something else here </a>
                                                        </li>
                                                        <li class="divider"> </li>
                                                        <li>
                                                            <a href="javascript:;">Separated link </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <span class="font-grey-cascade"> You have new follower
                                                <a href="javascript:;">Ivan Rakitic</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_1.jpg"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">Andres Iniesta</a>
                                                <span class="timeline-body-time font-grey-cascade">Replied at 7:45 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions"> </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <span class="font-grey-cascade"> Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
                                                tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <img class="timeline-badge-userpic img-circle" src="assets/pages/media/users/avatar80_2.jpg"> </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <a href="javascript:;" class="timeline-body-title font-blue-madison">Vanessa Bond</a>
                                                <span class="timeline-body-time font-grey-cascade">Posted new post at 5:10 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions"> </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <span class="font-grey-cascade">
                                                <p>
                                                    <img class="timeline-body-img pull-right" src="assets/pages/media/blog/4.jpg" alt=""> Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard
                                                    greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. coriander bitterleaf epazote radicchio shallot winter purslane collard. </p>
                                                <p> Coriander bitterleaf epazote radicchio shallot winter purslane collard. Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery
                                                    coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. </p>
                                                <p>
                                                    <img class="timeline-body-img pull-left" src="assets/pages/media/blog/6.jpg" alt=""> Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter purslane collard
                                                    greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi radicchio shallot winter purslane collard greens spring onion squash lentil.
                                                </p>
                                                <p> Coriander bitterleaf epazote radicchio shallot winter purslane collard. Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette lettuce. Celery
                                                    coriander bitterleaf epazote radicchio shallot winter purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot black-eyed pea brussels sprout garlic kohlrabi. </p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                                <!-- TIMELINE ITEM -->
                                <div class="timeline-item">
                                    <div class="timeline-badge">
                                        <div class="timeline-icon">
                                            <i class="icon-docs font-red-intense"></i>
                                        </div>
                                    </div>
                                    <div class="timeline-body">
                                        <div class="timeline-body-arrow"> </div>
                                        <div class="timeline-body-head">
                                            <div class="timeline-body-head-caption">
                                                <span class="timeline-body-alerttitle font-green-haze">Server Report</span>
                                                <span class="timeline-body-time font-grey-cascade">Yesterday at 11:00 PM</span>
                                            </div>
                                            <div class="timeline-body-head-actions">
                                                <div class="btn-group dropup">
                                                    <button class="btn btn-circle red btn-sm dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right" role="menu">
                                                        <li>
                                                            <a href="javascript:;">Action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Another action </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">Something else here </a>
                                                        </li>
                                                        <li class="divider"> </li>
                                                        <li>
                                                            <a href="javascript:;">Separated link </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="timeline-body-content">
                                            <span class="font-grey-cascade"> Lorem ipsum dolore sit amet
                                                <a href="javascript:;">Ispect</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TIMELINE ITEM -->
                            </div>
                        </div>
                    </div>
                    <!-- END CONTENT BODY -->
                </div>
            </div>
        </div>

        <!--  layout/_inc_footer_quick_nav.jsp-->
        <%@include file="../layout/_inc_footer_script.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>