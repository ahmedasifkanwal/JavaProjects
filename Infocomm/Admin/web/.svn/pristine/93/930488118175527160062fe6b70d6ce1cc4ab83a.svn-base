<%--
    Document   : CreateCategory
    Created on : Apr 28, 2012, 2:13:26 PM
    Author     : naeem
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<sx:head  />
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="panel">
        <div class="panel-heading">
            <div class="panel-title"> <span class="glyphicons glyphicons-parents"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>

          <div class="mini-action-icons margin-right-sm pull-right">

              <a href="createsysuser.icms" >
                  <i class="fa fa-plus-circle" title="Add"></i>

              </a>

              <a href="searchusers.icms" >
                  <i class="fa fa-search-plus" title="Search"></i>

              </a>
          </div>

        </div>

        <!-- page content -->
        <s:form  id="form1" action="createsysuser.icms"  name="form1"  method="POST" enctype="multipart/form-data"  theme="simple" Class="form-horizontal" >
          <div class="panel-body">
            <jsp:include page="../include/CustomMessage.jsp"></jsp:include>
            <jsp:include page="../include/RoleWithAdvertiser.jsp"></jsp:include>
            <div class="form-group">
              <s:label   key="User ID:" cssClass="col-lg-2 control-label"  />
              <div class="star1"><span class="mandatorySymbol">*</span></div>
              <div class="col-lg-8">
                <s:textfield name="username" maxLength="50"   cssClass="form-control"    />
                <s:fielderror   fieldName="username" />
              </div>
            </div>
            <div class="form-group">
              <s:label   key="LE14" cssClass="col-lg-2 control-label"  />
              <div class="star1"><span class="mandatorySymbol">*</span></div>
              <div class="col-lg-8">
                <s:password  name="password" maxLength="50"   cssClass="form-control"    />
                <s:fielderror   fieldName="password" />
                <span class="help-block margin-top-sm" ><i class="fa fa-bell" ></i>  <s:label   key="LVU01"     /></span>
               
              </div>
            </div>
            <div class="form-group">
              <s:label   key="LE15"  cssClass="col-lg-2 control-label" for="chosen-list2" />
              <div class="star1"><span class="mandatorySymbol">*</span></div>
              <div class="col-lg-8">
                <s:password  name="rePassword" maxLength="50"   cssClass="form-control"    />
                <s:fielderror   fieldName="rePassword" />
              </div>
            </div>
            <div class="form-group">
              <s:label   key="LV03" cssClass="col-lg-2 control-label"  />
              <div class="star1"></div>
              <div class="col-lg-8">
                <s:textfield name="userFullName" maxLength="100"   cssClass="form-control"    />
              </div>
            </div>
            <div class="form-group">
              <s:label   key="LB06" cssClass="col-lg-2 control-label"  />
              <div class="star1"><span class="mandatorySymbol">*</span></div>
              <div class="col-lg-8">
                <s:textfield name="email" maxLength="50"   cssClass="form-control"    />
                <s:fielderror   fieldName="email" />
              </div>
            </div>
            <div class="form-group">
              <s:label   key="Account Validity:" cssClass="col-lg-2 control-label"  />
              <div class="col-md-8">
                <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
                  <s:textfield  name="toDate" id="toDate" cssClass="form-control datepicker margin-top-none" />
                  <s:fielderror   fieldName="todate" />
                </div>
              </div>
            </div>
            <div class="form-group" >
              <s:label   cssClass="col-lg-2 control-label" />
              <div class="col-lg-10" style="text-align: center"  >
                <s:submit method="save"   key="BTN08"   cssClass= "btn btn-info ladda-button" data-style="expand-left" />
              </div>
            </div>
            <!-- Table display end --> 
          </div>
        </s:form>
      </div>
    </div>
  </div>
</div>
