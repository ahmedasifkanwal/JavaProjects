
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>

<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@page import="java.util.logging.Logger" %>
<%!    Logger logger = Logger.getLogger(this.getClass().getName());
%>

<%

    PropertyEncoder appMsg = null;

    PeLogin peLogin = null;
    Result result = null;
    try {

        if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
        }
        if (session.getAttribute("peLogin") != null) {

            peLogin = (PeLogin) session.getAttribute("peLogin");
            appMsg = WIFILayoutManager.getApplicationMsg(peLogin.getLocale());

        }
    } catch (Exception ex) {
        ex.getMessage();
        out.print("Error in success form=" + ex.getMessage());
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <jsp:include page="../layout/Style.jsp"></jsp:include>
        </head>





        <body id="page_home" class="hhotelrevamp">

        <jsp:include page="../layout/Header.jsp"></jsp:include>    

            <div id="topbuttonpanel" class="wl-container2">



                <table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0" style="font-size:16px">

                    <tr>
                        <td align="center" class="success">



                            <table width="90%"  border="0" align="center" cellpadding="2" cellspacing="0" style="font-size:16px">
                                <tr>
                                    <td class="heading">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" class="title"><table width="95%" border="0" align="center" cellpadding="3" cellspacing="3" class="tableborder" style="border-radius: 8px 8px 0px 0px;">
                                            <tbody><tr>
                                                    <td><div class="alert-success1">
                                                            <h2  ><%=appMsg.getString("info.logout.msg")%></h2>
                                                    </div></td>
                                            </tr>

                                            <tr>

                                                <td  align="center">
                                                    <div class="error_code" title="<%=   peLogin.getMobileNoFormated()%>">
                                                        <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                                                        <%=result.getMessage()%>
                                                        <%}%>
                                                    </div></td>
                                            </tr> 
                                        </tbody></table></td>
                            </tr>


                        </table>

                    </td>
                </tr>
                <tr>
                    <td align="center" class="click_here"  ><%=appMsg.getString("info.logout.msg.c1")%>&nbsp;<%=appMsg.getString("info.logout.msg.c2")%> </td>
                </tr>

                <tr>
                    <td align="center" class="click_here"  ><%=appMsg.getString("link.login.now.message")%> </td>
                </tr>

                <tr>
                    <td  >&nbsp;</td>
                </tr>
                <tr class="click_here">
                    <td align="center"  ><%=appMsg.getString("f.help.message")%></td>
                </tr>
                <tr>
                    <td  >&nbsp;</td>
                </tr>

            </table>


        </div>

        <!-- /booking-mask -->


        <jsp:include page="../layout/Footer.jsp"></jsp:include>




    </body>











</html>






