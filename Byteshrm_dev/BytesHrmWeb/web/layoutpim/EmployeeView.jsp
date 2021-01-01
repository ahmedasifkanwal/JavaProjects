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
        <title>      
            <jsp:include page="../layout/_inc_page_title.jsp"/></title>
            <%@include file="../layout/_inc_head.jsp" %>


        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->



    </head>
    <!-- END HEAD -->

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

                        <s:form  id="mEmployeeView" action="mEmployeeView.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >
                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>        
                            <s:hidden name="empEmergencyContacts.empEmergencyContactsPK.empNumber"  value="%{employee.empNumber}" id="empEmergencyContactsPK.empNumber"></s:hidden>

                                <div class="portlet-body">
                                    <div class="timeline">
                                        <!-- TIMELINE ITEM -->
                                        <div class="timeline-item">
                                            <div class="timeline-badge">
                                                <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_1.jpg"> </div>
                                            <div class="timeline-body">
                                                <div class="timeline-body-arrow"> </div>
                                                <div class="timeline-body-head">
                                                    <div class="timeline-body-head-caption">
                                                        <a href="javascript:;" class="timeline-body-title font-blue-madison">Personal Details</a>
                                                    </div>
                                                    <div class="timeline-body-head-actions"> </div>
                                                </div>
                                                <div class="timeline-body-content">
                                                    <span class="font-grey-cascade">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <strong>Employee ID:</strong>
                                                            <s:label id="employeeId" value="%{employee.employeeId}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Other ID:</strong>
                                                            <s:label id="empOtherId" value="%{employee.empOtherId}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Name:</strong>
                                                            <s:label id="empFirstname" value="%{employee.empFirstname}"/>
                                                            <s:label id="empMiddleName" value="%{employee.empMiddleName}"/>
                                                            <s:label id="empLastname" value="%{employee.empLastname}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong></strong>
                                                            <s:label id="" value=""/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>License Number:</strong>
                                                            <s:label id="empDriLiceNum" value="%{employee.empDriLiceNum}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>License Expiry Date:</strong>
                                                            <s:label id="empDriLiceExpDate" value="%{employee.empDriLiceExpDate}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Gender:</strong>
                                                            <s:label id="empGender" value="%{employee.empGender.name}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Marital Status:</strong>
                                                            <s:label id="empMaritalStatus" value="%{employee.empMaritalStatus}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Nationality:</strong>
                                                            <s:label id="nationCode.name" value="%{employee.nationCode.name}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Date of Birth:</strong>
                                                            <s:label id="empBirthday" value="%{employee.empBirthday}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>License Number:</strong>
                                                            <s:label id="empDriLiceNum" value="%{employee.empDriLiceNum}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>License Expiry Date:</strong>
                                                            <s:label id="empFirstname" value="%{employee.empDriLiceExpDate}"/>
                                                        </div>
                                                    </div>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Contact Details</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Address Street 1:</strong>
                                                            <s:label id="empStreet1" value="%{employee.empStreet1}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Address Street 2:</strong>
                                                            <s:label id="empStreet2" value="%{employee.empStreet2}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>City:</strong>
                                                            <s:label id="cityCode" value="%{employee.cityCode}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>State/Province:</strong>
                                                            <s:label id="provinCode" value="%{employee.provinCode}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Zip/Postal Code:</strong>
                                                            <s:label id="empZipcode" value="%{employee.empZipcode}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Country:</strong>
                                                            <s:label id="counCode" value="%{employee.counCode.name}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <strong>Telephone:</strong>
                                                            <s:label id="empHmTelephone" value="%{employee.empHmTelephone}"/>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <strong>Mobile:</strong>
                                                            <s:label id="empMobile" value="%{employee.empMobile}"/>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <strong>Work Telephone:</strong>
                                                            <s:label id="empWorkTelephone" value="%{employee.empWorkTelephone}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <strong>Work E-Mail:</strong>
                                                            <s:label id="empWorkEmail" value="%{employee.empWorkEmail}"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <strong>Other E-Mail:</strong>
                                                            <s:label id="empOthEmail" value="%{employee.empOthEmail}"/>
                                                        </div>
                                                    </div>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Emergency Contacts</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover" id="sample_1">
                                                        <thead>
                                                            <tr>
                                                                <th> SN# </th>
                                                                <th> Dependent Name</th>
                                                                <th> Relationship </th>
                                                                <th> Home Telephone</th>
                                                                <th> Mobile </th>
                                                                <th> Work Telephone</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" value="employee.empEmergencyContactsCollection">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="%{#}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{eecName}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{eecRelationship}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{eecHomeNo}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{eecMobileNo}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{eecOfficeNo}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
                                                </span>
                                            </div> 
                                        </div>
                                    </div>
                                    <!-- TIMELINE ITEM -->
                                    <div class="timeline-item">
                                        <div class="timeline-badge">
                                            <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_1.jpg"> </div>
                                        <div class="timeline-body">
                                            <div class="timeline-body-arrow"> </div>
                                            <div class="timeline-body-head">
                                                <div class="timeline-body-head-caption">
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Dependents</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover" id="sample_1">
                                                        <thead>
                                                            <tr>
                                                                <th> SN# </th>
                                                                <th> Dependent Name</th>
                                                                <th> Relationship Type </th>
                                                                <th>Relationship</th>
                                                                <th> Birthday </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" value="employee.empDependentsCollection">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="%{id}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{edName}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{edRelationshipType}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{edRelationship}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{edDateOfBirth}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
                                                </span>
                                            </div> 
                                        </div>
                                    </div>
                                    <!-- TIMELINE ITEM -->
                                    <div class="timeline-item">
                                        <div class="timeline-badge">
                                            <img class="timeline-badge-userpic" src="assets/pages/media/users/avatar80_1.jpg"> </div>
                                        <div class="timeline-body">
                                            <div class="timeline-body-arrow"> </div>
                                            <div class="timeline-body-head">
                                                <div class="timeline-body-head-caption">
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Immigration</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                        <thead>
                                                            <tr>

                                                                <th> SN# </th>
                                                                <th> Passport No</th>
                                                                <th> Country </th>
                                                                <th> Issue Date </th>
                                                                <th> Expiry Date</th>
                                                                <th> Status </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" value="employee.empPassportCollection">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="%{id}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epPassportNum}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{couCode}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epPassportissueddate}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{epPassportexpiredate}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epI9Status}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Job</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                        <thead>
                                                            <tr>

                                                                <th> SN# </th>
                                                                <th> Job Title</th>
                                                                <th> Employment Status </th>
                                                                <th> Job Category</th>
                                                                <th> Joined Date </th>
                                                                <th> Sub Unit</th>
                                                                <th> Location </th>
                                                                <th> Action </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" status="rowCount" value="employee">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="#rowCount.count" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{jobTitleCode.name}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{empStatus.name}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{eeoCatCode.name}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{joinedDate}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{workStation.name}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{locationCollection[0].location.name}" />
                                                                    </td>

                                                                    <td>
                                                                        <a href="#.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
                                                                            <i class="fa fa-edit"></i> Edit </a>
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Salary</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                        <thead>
                                                            <tr>

                                                                <th> SN# </th>
                                                                <th> Pay Grade</th>
                                                                <th> Salary Grade </th>
                                                                <th>Salary Component</th>
                                                                <th> Basic Salary </th>
                                                                <th> Currency </th>
                                                                <th> Comments </th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" status="rowCount" value="employee.empBasicsalaryCollection">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="#rowCount.count" />
                                                                    </td>


                                                                    <td>
                                                                        <s:property value="%{payperiodCode.payperiodName}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{salGrdCode.name}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{salaryComponent}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{ebsalBasicSalary}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{currencyId.currencyName}" />
                                                                    </td>



                                                                    <td>
                                                                        <s:property value="%{salaryComponent}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">Report-To</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                        <thead>
                                                            <tr>

                                                                <th> SN# </th>
                                                                <th> Manager</th>
                                                                <th> Subordinate </th>
                                                                <th> Reporting Method </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p"  status="rowCount" value="employee.empPassportCollection">
                                                                <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="#rowCount.count" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epPassportNum}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{couCode}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epPassportissueddate}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{epPassportexpiredate}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{epI9Status}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
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
                                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">MemberShip</a>
                                                </div>
                                                <div class="timeline-body-head-actions"> </div>
                                            </div>
                                            <div class="timeline-body-content">
                                                <span class="font-grey-cascade">
                                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                        <thead>
                                                            <tr>

                                                                <th> SN# </th>
                                                                <th> Employee</th>
                                                                <th> Membership</th>
                                                                <th> Subs Paid By </th>
                                                                <th>Subs Amount</th>
                                                                <th> Currency </th>
                                                                <th> Subs Commence Date </th>
                                                                <th> Subs Renewal Date </th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <s:iterator var="p" status="rowCount" value="empMemberDetailList">
                                                                <tr class="odd gradeX">
                                                                    <td> <s:property value="#rowCount.count" /></td>
                                                                    <td>
                                                                        <s:property value="%{employee.empFirstname}" />
                                                                        &nbsp;  <s:property value="%{employee.empLastname}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{membership.name}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{employee.empFirstname}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{emembSubscriptAmount}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{emembSubsCurrency}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{emembCommenceDate}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{emembRenewalDate}" />
                                                                    </td>
                                                                </tr>
                                                            </s:iterator>
                                                        </tbody>
                                                    </table>
                                                </span>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </s:form>
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