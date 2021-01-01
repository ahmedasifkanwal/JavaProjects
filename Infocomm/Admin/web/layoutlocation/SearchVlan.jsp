
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script src="js/page/searchvlan.js" type="text/javascript"></script>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>
                    <div class="form-group pull-right">
                        <jsp:include flush=""  page="../include/CSVImport.jsp"></jsp:include>

                    </div>
                </div>

                <s:form action="outgoingsms.icms"  theme="simple"   >


                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">
                            <jsp:include page="../control/InOwnerVlan.jsp"></jsp:include>
                                <div class="col-sm-2 col-md-2">
                                    <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Vlan" data-placement="bottom">
                                        <div class="console-icon divider-right" >
                                            <span class="glyphicons glyphicons-clock" ></span> </div>
                                        <div class="console-text">
                                            <div class="console-subtitle pull-right" >
                                            <s:select  headerKey=""  cssStyle="width:120px"  id="status" name="status" headerValue="ALL"  list="# {'A':'Active','I':'IN-Active'}"   cssClass="form-control"></s:select>
                                        </div>
                                    </div>
                                </div>
                            </div>


                                <div class="row">



                                    <div class="col-sm-2 col-md-2">
                                        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:80% " data-toggle="tooltip" title="" data-original-title="Please ADSL No" data-placement="bottom">
                                            <div class="console-icon divider-right" >
                                                <span class="imoon imoon-phone" ></span> </div>
                                            <div class="console-text">
                                                <div class="console-subtitle pull-right" >


                                                <s:textfield  id="mobile"  name="mobile" maxLength="50" cssStyle="width:100px"   cssClass="form-control"    />


                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div >

                                    <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>


                                </div>

                                <jsp:include page="../control/WaitControl.jsp"></jsp:include>
                                </div>
                            </div>
                        </div>

                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel-body">
                                                <div class="table-responsive">

                                            <div class="panel-body padding-bottom-none" >
                                                <table class="table table-striped table-bordered table-hover" id="datatable">


                                                </table></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
        </s:form>



    </div>


</div>

