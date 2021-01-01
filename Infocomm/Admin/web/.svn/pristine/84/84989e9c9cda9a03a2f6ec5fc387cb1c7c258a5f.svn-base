<%@page import="com.info.cms.entity.SysUsers"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>

    <!-- Mirrored from admindesigns.com/stardom/blank.html by HTTrack Website Copier/3.x [XR&CO'2008], Mon, 02 Jun 2014 10:48:56 GMT -->
    <head>
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <title><tiles:insertAttribute name="title"  /></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/github.css" type="text/css" />



        <!-- Core CSS  -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css">

        <!-- Plugin CSS -->
        <link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/timepicker/bootstrap-timepicker.min.css">

        <link rel="stylesheet" type="text/css" href="vendor/plugins/datepicker/datepicker.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/daterange/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/formswitch/css/bootstrap-switch.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/tags/tagmanager.css">

        <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/css/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/extras/TableTools/media/css/TableTools.css"><!-- Datatables TableTools Addon-->
        <link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/css/bootstrap-editable.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css" />



        <%
            SysUsers users = (SysUsers) session.getAttribute("Users");
            String name = users.getUsername() == null ? "" : users.getUsername();
            String fullName = users.getUserFullName() == null ? "" : users.getUserFullName();


        %>

        <!-- Page CSS -->
        <link rel="stylesheet" type="text/css" href="vendor/plugins/dynatree/skin-vista/ui.dynatree.css">

        <!-- Theme CSS -->
        <link rel="stylesheet" type="text/css" href="css/theme.css">
        <link rel="stylesheet" type="text/css" href="css/pages.css">
        <link rel="stylesheet" type="text/css" href="css/plugins.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">

        <!-- Boxed-Layout CSS -->
        <link rel="stylesheet" type="text/css" href="css/boxed.css">

        <!-- Demonstration CSS -->
        <link rel="stylesheet" type="text/css" href="css/demo.css">

        <!-- Your Custom CSS -->
        <link rel="stylesheet" type="text/css" href="css/custom.css">

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/logos/icms.ico">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script language="JavaScript" type="text/javascript" src="js/common.js"></script>

    </head>

    <body>
        <script> var boxtest = localStorage.getItem('boxed');
            if (boxtest === 'true') {
                document.body.className += ' boxed-layout';
            }</script>
        <!-- Start: Theme Preview Pane -->
        <div id="skin-toolbox" style="display:none" >
            <div class="skin-toolbox-toggle"> <i class="fa fa-flask"></i> </div>
            <div class="skin-toolbox-panel">
                <h4 class="padding-left-sm">Theme Options</h4>
                <form id="skin-toolbox-form">
                    <div class="form-group">
                        <label class="checkbox-inline">
                            <input id="header-option" class="checkbox" type="checkbox" checked>
                            Fixed <b>Header</b> </label>
                        .</div>
                    <div class="form-group">
                        <label class="checkbox-inline">
                            <input id="sidebar-option" class="checkbox" type="checkbox">
                            Fixed <b>Sidebar</b> </label>
                    </div>
                    <div class="form-group">
                        <label class="checkbox-inline option-disabled">
                            <input id="breadcrumb-option" class="checkbox" type="checkbox" disabled>
                            Fixed <b>Breadcrumbs</b> </label>
                    </div>
                    <hr class="short" style="margin: 7px 10px;" />
                    <div class="form-group">
                        <label class="checkbox-inline">
                            <input id="breadcrumb-hidden" class="checkbox" type="checkbox">
                            Hide <b>Breadcrumbs</b> </label>
                    </div>
                    <div class="form-group margin-bottom-lg">
                        <label class="checkbox-inline">
                            <input id="searchbar-hidden" class="checkbox" type="checkbox">
                            Hide <b>Search Bar</b> </label>
                    </div>
                    <h4 class="padding-left-sm">Layout Options</h4>
                    <div class="form-group">
                        <label class="radio-inline">
                            <input class="radio" type="radio" name="optionsRadios" id="fullwidth-option" checked>
                            Fullwidth </label>
                    </div>
                    <div class="form-group">
                        <label class="radio-inline">
                            <input class="radio" type="radio" name="optionsRadios" id="boxed-option">
                            Boxed Layout</label>
                    </div>
                    <hr class="short"/>

                </form>
            </div>
        </div>
        <!-- End: Theme Preview Pane -->

        <!-- Start: Header -->
        <tiles:insertAttribute name="header" />
        <!-- End: Header -->
        <!-- Start: Main -->
        <div id="main">
            <!-- Start: Sidebar -->
            <aside id="sidebar">
                <div id="sidebar-search">
                    <form role="search">
                        <div class="btn-group user-menu" >
                            <div style="padding-left:5px;"><span class="glyphicons glyphicons-user"></span> <b title="<%=fullName%>"><%=name%></b> &nbsp; &nbsp; &nbsp;<a href="Login.jsp">Logout</a></div>

                            <ul class="dropdown-menu checkbox-persist " role="menu">
                                <li class="menu-arrow">
                                    <div class="menu-arrow-up"></div>
                                </li>
                                <li class="dropdown-header">Your Account <span class="pull-right glyphicons glyphicons-user"></span></li>
                                <li>
                                    <ul class="dropdown-items">

                                        <li class="padding-none">
                                            <div class="dropdown-lockout"><i class="fa fa-lock"></i> <a href="Login.jsp">Screen Lock</a></div>
                                            <div class="dropdown-signout"><i class="fa fa-sign-out"></i> <a href="Login.jsp">Logout</a></div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                        <i class="fa fa-search field-icon-right"></i>
                        <button type="submit" class="btn btn-default hidden"></button>
                    </form>
                    <div class="sidebar-toggle"> <span class="glyphicon glyphicon-resize-horizontal"></span></div>
                </div>
                <!-- Start: Menu -->

                <div id="sidebar-menu">
                    <ul class="nav sidebar-nav">
                        <jsp:include page="./Menu.jsp"></jsp:include>

                        </ul>
                    </div>

                    <!-- End: Menu -->
                </aside>
                <!-- End: Sidebar -->
                <!-- Start: Content -->




                <section id="content">


                <%
                    String isPageAuthorized = "Authorized";
                    if (session.getAttribute("isPageAuthorized") != null) {
                        isPageAuthorized = session.getAttribute("isPageAuthorized").toString();
                    }

    if (!isPageAuthorized.equals("Authorized")) {%>

                <h1>
                    Either this page does not exist or you are not authorized to view.
                </h1>

                <%} else {%>

                <!-- Table display -->
                <jsp:include page="include/BreadCrumb.jsp"></jsp:include>
                <tiles:insertAttribute name="body" />

                <%}%>

            </section>
            <!-- End: Content --> <tiles:insertAttribute name="footer" />
        </div>
        <!-- End: Main -->

        



       
        <!-- /JS -->

    </body>
</html>
