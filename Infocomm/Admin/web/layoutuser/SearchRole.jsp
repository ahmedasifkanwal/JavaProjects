<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%></div>

                    <div class="mini-action-icons margin-right-sm pull-right">

                        <a href="addrole.icms" >
                            <i class="fa fa-plus-circle" title="Add"></i>

                        </a>

                        <a href="searchusers.icms" >
                            <i class="fa fa-search-plus" title="Search"></i>

                        </a>
                    </div>


                </div>
                <div class="panel-body" >
                    <!-- page content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-visible">
                                    <div class="panel-body padding-bottom-none">

                                        <s:form action="searchrole.tiles" method="search" theme="simple" >
                                                     <!-- Table display end -->
                                        </s:form>
                                        <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="datatable">
                                            <s:property value="searchResult" escapeHtml=""></s:property>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>