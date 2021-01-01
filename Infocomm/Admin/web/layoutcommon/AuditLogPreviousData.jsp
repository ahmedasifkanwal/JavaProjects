<%-- 
    Document   : Previous Data 
    Created on : Apr 10, 2013, 10:18:33 AM
    Author     : naeem
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Previous Data Page</title>
        <sx:head  />

         <style type="text/css">
          
            
              @import url(css/borders_common.css);
               @import url(css/layout.css);
                @import url(css/colors_common.css);
                 @import url(css/style1.css);
                 
             
             
        

        </style>       
    </head>
    <body>
 <!-- Bread Crumbs -->
       
        <!-- Bread Crumbs end -->    
        <br>

        <s:form action="common.audit.log.previous.data.action"   theme="simple" >


             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="tablebordertopleft"></td>
                    <td class="tablebordertopmiddle"></td>
                    <td class="tablebordertopright"></td>
                </tr>
                <tr>
                    <td class="tableborder_mid_left"></td>
                    <td class="tableborder_middle"><!-- inner Table display -->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="6" align="left" ><img src="images/inner_tabletop_left.png" /></td>
                                <td class="inner_tabletop_middle"><span class="tabletitle">Previous Data</span></td>
                                <td width="6" align="right" ><img src="images/inner_tabletop_right.png"  /></td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                 <td colspan="3" class="color-grey"></td>
                               </tr>

                                        <tr class="table_tr_bg">
                                <td width="30%" class="formlabels">
                                    <s:label  key="label.previousdata"/>
                               </td>
                               <td  class="textbox_borderleft" style="font-weight:bold">
                                   <s:property value="previousData"  />                         
                               </td>
                               <td  align="left"><s:fielderror   fieldName="previousData" cssClass="customeError"/></td>
                            </tr>  
                           
                            <tr class="table_tr_bg">
                                <td class="formlabels">   </td>
                                <td class="textbox_borderleft" ><s:submit  key="Close"   onclick="javascript:window.close()" cssClass="loginbutton" /> </td>
                               
                               

                            </tr>
                                       
                                    </table>

                                </td>
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
        </s:form>


    </body>
</html>