<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="java.util.logging.Level"%>
<%!    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("com.info.wifi.jsp.Login.jsp");


%>

<%
      Result result = null;

    try {
       if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
          
        }
    } catch (Exception ex) {
    }

%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
%>
<html>
    <head>
        <link rel="SHORTCUT ICON" href="fixedtemplate/costa/images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>
                <tiles:insertAttribute name="title" ignore="true" />
            </title>
        </meta>

        <link href="../css/style.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle"><div class="curved_session" style="border-color:red; width:80%">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
                            <tr>
                              <td  align="center" height="30"   >&nbsp;</td>
                            </tr>
                              <tr>
                                <td    align="center" ><img src="fixedtemplate/costa/images/App-error-icon.png" width="72" height="72"  /></td>
                            </tr>
                              <tr>
                                <td  align="center" height="15"></td>
                              </tr>
                            <tr>
                               <td  align="center"   >
                            <div class="error_code" >
                                <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                <%=result.getMessage()%>
                                <%}%>
                            </div></td>
                            </tr>
                            <tr>
                                <td    align="center" ></td>
                            </tr>
                            <tr>
                                <td height="25"    align="center" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center"   ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" style="color:  red"> 
                                                <br />
                                                Please reopen browser window or <a href="http://login.now" class="link2" > Click Here </a> to start new session </td>
                                        </tr>
                                    </table></td>
                            </tr>
                            <tr>
                                <td    align="center" >&nbsp;</td>
                            </tr>
                             <tr>
                                <td    align="right" ><img src="fixedtemplate/costa/images/omantel_logo_session.png" width="98" height="125" /></td>
                            </tr>
                        </table>
                    </div></td>
            </tr>
        </table>
    </body>
</html>
