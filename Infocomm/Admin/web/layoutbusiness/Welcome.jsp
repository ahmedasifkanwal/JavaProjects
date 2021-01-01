<%--
    Document   : CreateCategory
    Created on : Apr 28, 2012, 2:13:26 PM
    Author     : naeem
--%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.wifi.cms.entity.SysModules"%>
<%@page import="com.info.wifi.cms.entity.SysAction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />

<div class="container" >
    <div class="row" >
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title">
                        <span class="glyphicon glyphicon-th-large"></span> 
                        <%=session.getAttribute("SELACTIONNAME") == null ? "Dashboard" : session.getAttribute("SELACTIONNAME")%>
                    </div>


                </div>
                <s:form action="dashboard.icms"  theme="simple"   >
                    <jsp:include page="../include/ChartComponents.jsp"/>
                    <%
                        boolean isDash = false;
                        List<SysAction> list = (List<SysAction>) session.getAttribute("Actions");
                        SysUsers user = (SysUsers) session.getAttribute("Users");
                        if (list != null) {
                            for (SysAction p : list) {
                                if (p.getActionName().equals("dashboardbusiness.icms")) {
                                    isDash = true;
                                    break;
                                }
                            }
                        }

                    %>

                    <div class="container" id="saleem" >
                        <%if (isDash) {%>

                        <jsp:include page="../layoutbusiness/ProfileStatictics_Row1.jsp" ></jsp:include>
                        <jsp:include page="../layoutbusiness/DynamicWelcomeCharts.jsp" ></jsp:include>

                        <%if (false) {%>


                        <jsp:include page="../include/DynamicWelcomeCharts.jsp" ></jsp:include>
                        <jsp:include page="../include/LiStatistics_Row4.jsp" ></jsp:include>
                        <%  }%>

                        <%  } else {%>
                        <div class="row">
                            <div class="col-sm-6 col-lg-20">
                                <div class="panel">
                                    <div class="panel-heading">
                                        <div class="panel-title"> Welcome to WiFi Admin 1.1 </div>
                                    </div>
                                    <div class="panel-body">
                                        <p>You do not has permission to see the Dashboard , please contact Administrator for more information.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </s:form>


            </div>
        </div>
    </div>
</div>

                    <script>
    var j = 1;

    $(document).ready(
            function () {

                setInterval(function () {


                    if ($("#movedashboard").is(':checked')) {
                        if (j < 25)
                        {
                            $("#saleem").animate({
                                marginTop: "-=" + j + "px"
                            }, 100);
                        }
                        if (j == 25)
                        {
                            $("#saleem").animate({
                                marginTop: "1px"
                            }, 100);
                            j = 0;

                        }

                        j = j + 1;

                    }

                }, 5000);

                                });
</script>