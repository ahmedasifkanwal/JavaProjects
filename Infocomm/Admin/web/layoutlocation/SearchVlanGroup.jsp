
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script src="js/page/searchvlangroup.js" type="text/javascript"></script>
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
                        <s:form action="searchgroup.icms"  theme="simple"   >

                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">
                            <jsp:include page="../control/InOwnerVlan.jsp"></jsp:include>
                            <div class="row">
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

