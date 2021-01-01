
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <!-- Mirrored from admindesigns.com/stardom/blank.html by HTTrack Website Copier/3.x [XR&CO'2008], Mon, 02 Jun 2014 10:48:56 GMT -->
    <head>
        <!-- Meta, title, CSS, favicons, etc. -->
       
        <title>WiFi Admin 1.1</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script language="JavaScript" type="text/javascript" src="js/common.js"></script>
        <!-- Font CSS  -->
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700">
        <!-- Core CSS  -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/icomoon/style.min.css">

        <!-- Dynamic table start -->
        <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/css/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/datatables/extras/TableTools/media/css/TableTools.css">
        <link rel="stylesheet" type="text/css" href="vendor/editors/xeditable/css/bootstrap-editable.css">
        <!-- Dynamic end start -->

        <link rel="stylesheet" type="text/css" href="vendor/plugins/dynatree/skin-vista/ui.dynatree.css">

        <!-- Plugin CSS -->

        <link rel="stylesheet" type="text/css" href="vendor/plugins/chosen/chosen.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/timepicker/bootstrap-timepicker.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/colorpicker/colorpicker.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/datepicker/datepicker.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/daterange/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/formswitch/css/bootstrap-switch.css">
        <link rel="stylesheet" type="text/css" href="vendor/plugins/tags/tagmanager.css">

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
    </head>
    <%
        SysUsers users = (SysUsers) session.getAttribute("Users");
        String name = users.getUsername() == null ? "" : users.getUsername();
        String fullName = users.getUserFullName() == null ? users.getUsername() : users.getUserFullName();


    %>
    <body  class="<%=session.getAttribute("SIDE_BAR_TOGGLE")%>">
        
        
        <script> var boxtest = localStorage.getItem('boxed');
            if (boxtest === 'true') {
                document.body.className += ' boxed-layout';
            }</script>
        <!-- Start: Theme Preview Pane -->

        <!-- End: Theme Preview Pane -->

        <!-- Start: Header -->

        <tiles:insertAttribute name="header" />

        <!-- End: Header -->
        <!-- Start: Main -->
        <div id="main" >
            <!-- Start: Sidebar -->
            <aside id="sidebar">
                <div id="sidebar-search">
                    <form role="search">
                        <div class="btn-group user-menu" >
                            <div style="padding-left:5px;"><span class="glyphicons glyphicons-user"></span> <b title="<%=fullName%>"><%=name%></b> </div>
                        </div>
                        <i class="fa fa-search field-icon-right" ></i>
                        <button type="submit" class="btn btn-default hidden" ></button>
                    </form>
                    <div title="<%= users.getUserAuthority()%>,  <%=fullName%>" class="sidebar-toggle" onclick="setSideBarToggle()"> <span class ="glyphicon glyphicon-resize-horizontal"></span></div>
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

if (!isPageAuthorized.equals("Authorized") && !session.getAttribute("SCREEN_ID").toString().equals("dashboard.icms")) {%>
                <jsp:include page="include/AuthorizationMessage.jsp"/>
                <%} else {%>

                <!-- Table display -->
                <jsp:include page="include/BreadCrumb.jsp"></jsp:include>
                <tiles:insertAttribute name="body" />
                <%}%>
                </section>
                <!-- End: Content -->
                <tiles:insertAttribute name="footer" />
        </div>
        <div id="feet">
		<div class="copy1">
		  
          ©  Infocomm <script language="JavaScript">
var d=new Date(); 
yr=d.getFullYear();

document.write(yr);
</script>  All Rights Reserved.</div>
		<ul class="feet-links">
			 
			<li><a href="http://www.i-grp.com" title="" target="_blank"><img src="img/logos/powered.png"></a></li>
		</ul>
	</div>
        <!-- End: Main -->
 <div class="modal fade" id="alertModal" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title text-center">Are you sure that's what you want?</h4>
      </div>
      <div class="modal-body">
        <p class="margin-bottom-lg"> It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
        <div class="form-group text-center">
          <button type="button" class="btn btn-success btn-gradient margin-right-sm" data-dismiss="modal"><i class="fa fa-check"></i> Of course I am</button>
          <button type="button" class="btn btn-danger btn-gradient" data-dismiss="modal"><i class="fa fa-warning"></i> No nevermind</button>
        </div>
      </div>
    </div>
  </div>
</div>
        <script src="libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script><!-- Plugins -->

        <!-- Dynamic table start -->
        <script type="text/javascript" src="js/plugins/charts/jquery.sparkline.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/datatables/js/datatables.js"></script>
        <script type="text/javascript" src="vendor/plugins/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/datatables/extras/TableTools/media/js/ZeroClipboard.js"></script>
        <script type="text/javascript" src="vendor/editors/xeditable/js/bootstrap-editable.js"></script>
        <!-- Dynamic table end -->

        <script type="text/javascript" src="vendor/plugins/globalize/globalize.js"></script>
        <script type="text/javascript" src="vendor/plugins/chosen/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/daterange/moment.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/daterange/daterangepicker.js"></script>
        <script type="text/javascript" src="vendor/plugins/colorpicker/bootstrap-colorpicker.js"></script>
        <script type="text/javascript" src="vendor/plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/datepicker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="vendor/plugins/formswitch/js/bootstrap-switch.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/jquerymask/jquery.maskedinput.min.js"></script>
        <script type="text/javascript" src="vendor/plugins/tags/tagmanager.js"></script>
        <script type="text/javascript" src="vendor/plugins/dynatree/jquery.cookie.js"></script>
        <script type="text/javascript" src="vendor/plugins/dynatree/jquery.dynatree.js"></script>
        <script type="text/javascript" src="vendor/plugins/jquerydial/jquery.knob.js"></script>
        <!-- Theme Javascript -->
        <script type="text/javascript" src="js/uniform.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
        <script type="text/javascript">


              function setSideBarToggle() {



                  $.ajax({
                      type: "GET",
                      url: "json/JsonGeneric.jsp?action=SIDE_BAR_TOGGLE",
                      success: function(data) {
                          var output = $.parseJSON(data);

                      }
                  });
              }



              jQuery(document).ready(function() {

                  // Init Theme Core
                  Core.init();




                  // --- Initialize first Dynatree -------------------------------------------
                  $("#tree").dynatree({
                      fx: {height: "toggle", duration: 100},
                      autoCollapse: true,
                      onActivate: function(node) {
                          if (node.data.isFolder == true) {
                              return;
                          }
                          $('.tree-content-example .tab-pane').hide();
                          $('div[data-id="' + node.data.key + '"').fadeIn();
                      },
                      persist: true
                  });

                  // --- Initialize Draggable Dynatree -------------------------------------------
                  $("#tree2").dynatree({
                      fx: {height: "toggle", duration: 100},
                      autoCollapse: true,
                      dnd: {
                          preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
                          onDragStart: function(node) {
                              /** This function MUST be defined to enable dragging for the tree.
                               *  Return false to cancel dragging of node.
                               */
                              return true;
                          },
                          onDragEnter: function(node, sourceNode) {
                              /** sourceNode may be null for non-dynatree droppables.
                               *  Return false to disallow dropping on node. In this case
                               *  onDragOver and onDragLeave are not called.
                               *  Return 'over', 'before, or 'after' to force a hitMode.
                               *  Return ['before', 'after'] to restrict available hitModes.
                               *  Any other return value will calc the hitMode from the cursor position.
                               */
                              // Prevent dropping a parent below another parent (only sort
                              // nodes under the same parent)
                              if (node.parent !== sourceNode.parent) {
                                  return false;
                              }
                              // Don't allow dropping *over* a node (would create a child)
                              return ["before", "after"];
                          },
                          onDrop: function(node, sourceNode, hitMode, ui, draggable) {
                              /** This function MUST be defined to enable dropping of items on
                               *  the tree.
                               */
                              sourceNode.move(node, hitMode);
                          }
                      }
                  });

                  // --- Initialize DynaTrees 3-6 -----------------------------------------------
                  var treeList = ["#tree3", "#tree4", "#tree5", "#tree6"];
                  $.each(treeList, function(i, ele) {

                      // Attach the dynatree widget to an existing <div id="tree"> element
                      // and pass the tree options as an argument to the dynatree() function:
                      $(ele).dynatree({
                          fx: {height: "toggle", duration: 100},
                          autoCollapse: true,
                          onActivate: function(node) {
                              // A DynaTreeNode object is passed to the activation handler
                              // Note: we also get this event, if persistence is on, and the page is reloaded.
                              //alert("You activated " + node.data.title);
                          },
                          persist: true
                      });
                  });








                  // Init Datatables with Tabletools Addon  table dynamic script start
                  $('#datatable').dataTable({
                      "aoColumnDefs": [{'bSortable': false, 'aTargets': [-1]}],
                      "oLanguage": {"oPaginate": {"sPrevious": "", "sNext": ""}},
                      "iDisplayLength": 25,
                      "aLengthMenu": [[25, 100, 200, 500, -1], [25, 100, 200, 500, "All"]],
                      "sDom": 'T<"panel-menu dt-panelmenu"lfr><"clearfix">tip',
                      "oTableTools": {
                          "sSwfPath": "vendor/plugins/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
                      }
                  });

                  // Add Placeholder text to datatables filter bar
                  $('.dataTables_filter input').attr("placeholder", "Enter Filter Terms Here....");

                  // Manually Init Chosen on Datatables Filters
                  $("select[name='datatable_length']").chosen();

                  // Init Xeditable Plugin
                  $.fn.editable.defaults.mode = 'popup';
                  $('.xedit').editable();

                  // table dynamic script end

                  // On Load knob animation
                  $({value: 0}).delay(800).animate({value: 75}, {
                      duration: 2000,
                      easing: 'swing',
                      step: function()
                      {
                          $('.knob').val(Math.ceil(this.value)).trigger('change');
                      }
                  });



        // Init knobs
                  $(".knob").knob({
                      change: function(value) {
                          //console.log("change : " + value);
                      },
                      release: function(value) {
                          //console.log(this.$.attr('value'));
                          console.log("release : " + value);
                      },
                      cancel: function() {
                          console.log("cancel : ", this);
                      },
                      draw: function() {

                          // "tron" case
                          if (this.$.data('skin') == 'tron') {

                              var a = this.angle(this.cv)  // Angle
                                      , sa = this.startAngle          // Previous start angle
                                      , sat = this.startAngle         // Start angle
                                      , ea                            // Previous end angle
                                      , eat = sat + a                 // End angle
                                      , r = 1;

                              this.g.lineWidth = this.lineWidth;

                              this.o.cursor
                                      && (sat = eat - 0.3)
                                      && (eat = eat + 0.3);

                              if (this.o.displayPrevious) {
                                  ea = this.startAngle + this.angle(this.v);
                                  this.o.cursor
                                          && (sa = ea - 0.3)
                                          && (ea = ea + 0.3);
                                  this.g.beginPath();
                                  this.g.strokeStyle = this.pColor;
                                  this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
                                  this.g.stroke();
                              }

                              this.g.beginPath();
                              this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
                              this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
                              this.g.stroke();

                              this.g.lineWidth = 2;
                              this.g.beginPath();
                              this.g.strokeStyle = this.o.fgColor;
                              this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
                              this.g.stroke();

                              return false;
                          }
                      }
                  });



                  //Init jquery Date Picker
                  $('.datepicker').datepicker()


                  //Init jquery Date Range Picker
                  $('input[name="daterange"]').daterangepicker();
                  $('input[name="daterange"]').keypress(function(event) {
                      event.preventDefault();
                  });

                  //Init jquery Color Picker
                  $('.colorpicker').colorpicker()
                  $('.rgbapicker').colorpicker()

                  //Init jquery Time Picker
                  $('.timepicker').timepicker();
                  $('.timepicker1').timepicker();

                  //Init jquery Tags Manager
                  $(".tm-input").tagsManager({
                      tagsContainer: '.tag-container',
                      prefilled: ["Miley Cyrus", "Apple", "Wow This is a really Long tag", "Na uh"],
                      tagClass: 'tm-tag-info',
                  });

                  //Init jquery spinner init - default
                  $(".checkbox").uniform();
                  $(".radio").uniform();

                  //Init jquery spinner init - default
                  $("#chosen-list1").chosen();
                  $("#chosen-list2").chosen();


                  //Init jquery spinner init - default
                  $("#spinner1").spinner();

                  //Init jquery spinner init - currency
                  $("#spinner2").spinner({
                      min: 5,
                      max: 2500,
                      step: 25,
                      start: 1000,
                      //numberFormat: "C"
                  });

                  //Init jquery spinner init - decimal
                  $("#spinner3").spinner({
                      step: 0.01,
                      numberFormat: "n"
                  });

                  //Init jquery time spinner
                  $.widget("ui.timespinner", $.ui.spinner, {
                      options: {
                          // seconds
                          step: 60 * 1000,
                          // hours
                          page: 60
                      },
                      _parse: function(value) {
                          if (typeof value === "string") {
                              // already a timestamp
                              if (Number(value) == value) {
                                  return Number(value);
                              }
                              return +Globalize.parseDate(value);
                          }
                          return value;
                      },
                      _format: function(value) {
                          return Globalize.format(new Date(value), "t");
                      }
                  });
                  $("#spinner4").timespinner();

                  //Init jquery masked inputs
                  $('.date').mask('99/99/9999');
                  $('.time').mask('99:99:99');
                  $('.date_time').mask('99/99/9999 99:99:99');
                  $('.zip').mask('99999-999');
                  $('.phone').mask('(999) 999-9999');
                  $('.phoneext').mask("(999) 999-9999 x99999");
                  $(".money").mask("999,999,999.999");
                  $(".product").mask("999.999.999.999");
                  $(".tin").mask("99-9999999");
                  $(".ssn").mask("999-99-9999");
                  $(".ip").mask("9ZZ.9ZZ.9ZZ.9ZZ");
                  $(".eyescript").mask("~9.99 ~9.99 999");
                  $(".custom").mask("9.99.999.9999");

              });
        </script>
        <script type="text/javascript">

            function findpdf() {
                //alert('download');
                $("#downloadIcon").css("display", "inline");



                var data =
                        {
                            'fromDate': $("#datepicker-icon").val(),
                            'fromDateTime': $("#fromDateTime").val(),
                            'fromDateTimeMin': $("#fromDateTimeMin").val(),
                            'toDate': $("#datepicker-icon1").val(),
                            'toDateTime': $("#toDateTime").val(),
                            'toDateTimeMin': $("#toDateTimeMin").val(),
                            'username': $("#username").val(),
                            'useripIp1': $("#useripIp1").val(),
                            'serveripIp2': $("#serveripIp2").val(),
                            'macadds': $("#macadds").val(),
                            'host': $("#host").val(),
                            'uri': $("#uri").val(),
                            'location': $("#location").val(),
                            'reportTypeValue': $("#reportTypeValue").val(),
                            'peVlanLoction': $("#peVlanLoction").val(),
                            'httpPostGet': $("#httpPostGet").val(),
                            //'format': format,
                            'reportId': $("#reportId").val(),
                            'role': $("#CURRENT_ROLE").val(),
                            'pdfsize': $("#pdfsize").val(),
                            'csvsize': $("#csvsize").val(),
                            'month': $("#month").val(),
                            'year': $("#year").val(),
                            'filterCode': $("#filterCode").val(),
                            'filterText': $("#filterText").val(),
                            'gateway_id': $("#gateway_id").val(),
                            'pms_id': $("#pms_id").val(),
                            'billpackage_id': $("#billpackage_id").val(),
                            'billplan_id': $("#billplan_id").val(),
                            'gateway_ip': $("#gateway_ip").val(),
                            'searchResult': $("#searchResult").val(),
                            'reportFilterName': $("#reportFilterName").val(),
                            'fromToDateBetween': $("#fromToDateBetween").val(),
                            'customerIdSearch': $("#customerIdSearch").val(),
                            'isEditRequired': $("#isEditRequired").val(),
                            'subscriberId': $("#subscriberId").val(),
                            'subscriberNo': $("#subscriberNo").val(),
                            'subscriberNo': $("#subscriberNo").val(),
                                    'status': $("#status").val(),
                            'paymentNo': $("#paymentNo").val()
                        };
                $.ajax({
                    type: "POST",
                    url: "json/JsonReportBase.jsp?data=" + JSON.stringify(data),
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function(data) {
                        var output = $.parseJSON(data);
                        //alert(output.reportLink);
                        $("#downloadIcon").css("display", "none");
                        if (output.reportLink == null)
                        {
                            //alert(output.message);
                            return false;
                        }

                        // window.open(output.reportLink, "yyyyy", "width=480,height=360,resizable=no,toolbar=no,menubar=no,location=no,status=no");

                    }
                });
                return false;
            }

        </script>
         
        <div style="background-color: #3f0a0a">.</div>
        <!-- /JS -->

    </body>
</html>
