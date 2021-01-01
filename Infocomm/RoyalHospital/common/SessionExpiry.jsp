<%@page import="java.util.logging.Level"%>
<%!    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("com.info.wifi.jsp.Login.jsp");


%>

<%
    String css_border = "";

    try {
        //CSS Section Initialization
        // css_border = "style='border-color:yellow'";
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
                <td valign="middle"><div class="curved_session" style=" width:80%">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  >
                            <tr>
                                <td height="40"    align="center" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td    align="center" >
                                    
                                    <img src="../images/Time-Zones-icon.png"  width="72" height="72"  alt=""/>
                                    
                                   </td>
                            </tr>
                            <tr>
                                <td height="25"    align="center" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center"   ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center">Your session has been expired. <br />
                                                <br />
                                                Please reopen browser window or <a href="http:\\login.now" class="link2" > Click Here </a> to start new session </td>
                                        </tr>
                                    </table></td>
                            </tr>
                            <tr>
                                <td    align="center" >&nbsp;</td>
                            </tr>
                            <tr>
                                <td    align="right" ><img src="../images/logo.jpg" alt="" style="max-width: 100%; height: 60px;"/></td>
                                
                            </tr>
                        </table>
                    </div></td>
            </tr>
        </table>
    </body>
</html>
