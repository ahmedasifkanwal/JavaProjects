
<%@page import="com.info.wifi.cms.action.helper.DateHelper"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Log Details</title>
        <sx:head  />
        <link href="../css/style1.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!-- Bread Crumbs -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="breadcrumbleft">&nbsp;</td>
                <td class="breadcrumbmiddle"><table width="45%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="68" align="center" class="breadc1"><strong>Home</strong></td>
                            <td class="breadcrumbdivider"></td>
                            <td width="107" align="center" class="breadc2"><strong>Helpdesk</strong></td>
                            <td class="breadcrumbdivider"></td>
                            <td width="119" align="center"><strong>Error Log Details</strong></td>
                        </tr>
                    </table></td>
                <td class="breadcrumbright">&nbsp;</td>
            </tr>
        </table>
        <!-- Bread Crumbs end -->    
        <br>

        <s:form  action="sup.form.error.log.details.action" method="getErrorDetails" theme="simple" >



            <!-- Table display -->
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="tablebordertopleft"></td>
                    <td class="tablebordertopmiddle"></td>
                    <td class="tablebordertopright"></td>
                </tr>
                <tr>
                    <td class="tableborder_mid_left"></td>
                    <td class="tableborder_middle">

                        <!-- inner Table display -->                      

                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="6" align="left" ><img src="images/inner_tabletop_left.png" /></td>
                                <td class="inner_tabletop_middle"><span class="tabletitle">Error Log Details</span></td>
                                <td width="6" align="right" ><img src="images/inner_tabletop_right.png"  /></td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td colspan="3" class="inner_table_middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">

                                        <tr>
                                            <td colspan="3" class="inner_table_middle">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
                                            <td colspan="3" class="inner_table_middle">
                                               
                                                            <table align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <s:actionerror cssClass="customeActionMessage"/>
                                                                        <s:actionmessage  cssClass="messagebox"/>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>                                                   
                                                    <tr>
                                                        <td class="color-grey"></td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td class="report_topbg1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>

                                                                    <td width="18%" class="formlabels_report_top" ><s:label key="label.date.from"/><span  class="mandatorySymbol">*</span>  </td>
                                                              <td width="18%" align="left" style="padding-left:15px"> 
                                                <sx:datetimepicker name="fromDate"  displayFormat="dd-MM-yyyy"  toggleType="explode"  cssStyle="width:145px" displayWeeks="5" cssClass="logintextboxsmall"   />  
                                                                    </td>
                                                                  <td width="16%"  class="formlabels_report_top">  <s:label key="label.date.to"/> <span  class="mandatorySymbol">*</span>  </td>
                                                              <td width="18%" align="left" style="padding-left:15px">
                                                        <sx:datetimepicker name="toDate"   displayFormat="dd-MM-yyyy" cssClass="logintextboxsmall" cssStyle="width:145px" toggleType="explode"  displayWeeks="5"  />
                                                                    </td>
                                                                  <td width="12%"  class="formlabels_report_top"> <s:label   key="label.location" />  </td>
                                                              <td width="18%" align="center">
                                        <s:select  headerKey="-1" headerValue="All" name="peVlanLoction" list="peVlanLoctionsList" listKey="vlanId" listValue="vlanNameFormatted" cssClass="login_dropdown_small"    ></s:select>                                                                        </td>
                                                          </tr>
                                                                </table></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="report_topbg1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="18%" class="formlabels_report_top" >   <s:label   key="LU01" />                     </td>
                                                                  <td width="18%" align="left" style="padding-left:15px">
                                                    <s:textfield name="userName" cssClass="logintextboxsmall"  maxlength="20"  ></s:textfield>

                                                                        </td>
                                                                      <td width="16%" class="formlabels_report_top"> <s:label   key="label.error.code" /></td>
                                                                  <td width="18%" align="left" style="padding-left:15px"> 
                                                        <s:textfield name="errorCode"  cssClass="logintextboxsmall"   maxlength="5" ></s:textfield>  

                                                                        </td>
                                                                      <td width="12%" class="leftline" ><s:submit  method="getErrorDetails" name="submit" key="BTN02" cssClass="loginbuttonsearch"  /></td>
                                                                    <td width="18%" class="leftline" ></td>

                                                              </tr>
                                                            </table></td>
                                                    </tr>
                                                    <tr>
                                                        <td  class="color-grey"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>

                                                            <s:if test="peErrorDetailsList!=null && peErrorDetailsList.size() > 0 ">



                                                                <display:table id="peErrorDetailsList"  name="peErrorDetailsList" requestURI="sup.form.error.log.details.action" pagesize="50" 
                                                                               cellpadding="0"   cellspacing="1" class="displaytablewidth"   > 
                                                                    <display:column  value="${peErrorDetailsList_rowNum}" title="SN#" sortable="false" headerClass="report_titlebg" > 
                                                                    </display:column>
                                                                    <display:column property="vLanDescription" title="Vlan Name" sortable="false"    headerClass="report_titlebg" /> 
                                                                    <display:column property="errorDescription" title="Error Description" sortable="false"  headerClass="report_titlebg"   /> 
                                                                    <display:column property="dateCreation" title="Date Creation" sortable="false"  format= "<%=DateHelper.DateFormat%>" headerClass="report_titlebg" />                                   
                                                                    <display:column property="userName" title="Username" sortable="false"  headerClass="report_titlebg" /> 
                                                                    <display:column property="remarks" title="Remarks" sortable="false"  headerClass="report_titlebg" /> 
                                                                    <display:setProperty name="css.tr.odd"   value="alternatebg1"/>
                                                                    <display:setProperty name="css.tr.even"   value="alternatebg2"/>
                                                                    <display:setProperty name="paging.banner.placement"   value="bottom"/>

                                                                </display:table>


                                                            </s:if>





                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>

                                    </table></td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="6" ><img src="images/inner_tablebot_left.png" width="6" height="6" /> </td>
                                <td width="100%" background="images/inner_tablebot_middle.png"></td>
                                <td width="6"><img src="images/inner_tablebot_right.png" width="6" height="6" /></td>
                            </tr>
                        </table>

                        <!-- inner Table display ends -->

                    </td>
                    <td class="tableborder_mid_right">&nbsp;</td>
                </tr>
                <tr>
                    <td class="tableborderbottomleft"></td>
                    <td class="tableborderbottom_mid"></td>
                    <td class="tableborderbottomright"></td>
                </tr>
            </table>
            <!-- Table display end -->






        </s:form>









    </body>
</html>
