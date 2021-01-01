
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<meta http-equiv="refresh" content="600">
<sx:head />

<!-- Bread Crumbs -->

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%></div>
                </div>
                <div class="panel-body" >
                    <!-- page content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-visible">
                                    <div class="panel-body padding-bottom-none">
                                        <s:form action="terminalstatus.icms"  theme="simple"  >
                                            <s:hidden name="reportFilterName" value="SYS_KIOSK_REPORT" />
                          <div class="container">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <style>
                                                                    .terminalActive {background-color: #3f9d00;}
                                                                    .terminal {background-color: #c91618;}
                                                                    
                                                                </style>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal1Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal1" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal1" />
                                                                    </s:else>
                                                                     <p>Terminal-1</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal2Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal2" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal2" />
                                                                    </s:else>
                                                                        <p>Terminal-2</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal3Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal3" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal3" />
                                                                    </s:else>
                                                                        <p>Terminal-3</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal4Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal4" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal4" />
                                                                    </s:else>
                                                                        <p>Terminal-4</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal5Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal5" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal5" />
                                                                    </s:else>
                                                                        <p>Terminal-5</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal6Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal6" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal6" />
                                                                    </s:else>
                                                                        <p>Terminal-6</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal7Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal7" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal7" />
                                                                    </s:else>
                                                                        <p>Terminal-7</p>
                                                                </div>
                                                                <div class="col-md-1"><s:if  test="peKiosk.peTerminalStatus.terminal8Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal8" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal8" />
                                                                    </s:else>
                                                                        <p>Terminal-8</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal9Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal9" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal9" />
                                                                    </s:else>
                                                                     <p>Terminal-9(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal10Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal10" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal10" />
                                                                    </s:else>
                                                                     <p>Terminal-10(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal11Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal11" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal11" />
                                                                    </s:else>
                                                                     <p>Terminal-11(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal12Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal12" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal12" />
                                                                    </s:else>
                                                                     <p>Terminal-12(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal13Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal13" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal13" />
                                                                    </s:else>
                                                                     <p>Terminal-13(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal14Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal14" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal14" />
                                                                    </s:else>
                                                                     <p>Terminal-14(Not Configured)</p>
                                                                </div>
                                                                <div class="col-md-1" style="display: none"><s:if  test="peKiosk.peTerminalStatus.terminal15Status.equals(\"A\")">
                                                                      <img src="img/kiosk_active.gif" class="img-responsive " alt="terminal15" />
                                                                    </s:if> 
                                                                    <s:else>
                                                                     <img src="img/kiosk_error_1.gif" class="img-responsive " alt="terminal15" />
                                                                    </s:else>
                                                                     <p>Terminal-15(Not Configured)</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <br>
                                         
                                        </s:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>