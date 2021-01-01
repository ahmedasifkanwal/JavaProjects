<%--
    Document   : CreateCategory
    Created on : Apr 28, 2012, 2:13:26 PM
    Author     : naeem
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>

<sx:head  />
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="panel">
        <div class="panel-heading">
          <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>
        </div>
        
        <!-- page content -->
        <s:form  id="form1" action="resetpassword.icms"  name="form1"  method="POST" enctype="multipart/form-data"  theme="simple" Class="form-horizontal" >
          <div class="panel-body">
            <jsp:include page="../include/CustomMessage.jsp"></jsp:include>
            <div class="form-group">
              <s:label   key="LU01" cssClass="col-lg-2 control-label"  />
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
                <s:label   key="LVU01"   />
              </div>
            </div>
            <div class="form-group" >
              <s:label   cssClass="col-lg-2 control-label" />
              <div class="col-lg-10" style="text-align: center">
                  <s:submit  method="reSetPassword"   key="BTN03" cssClass= "btn btn-info ladda-button" data-style="expand-left" />
              </div>
            </div>
            <!-- Table display end --> 
            
          </div>
        </s:form>
      </div>
    </div>
  </div>
</div>
