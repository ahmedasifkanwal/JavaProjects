<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.rad.entity.Accountuser"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.logging.Logger" %>
<%!    Logger logger = Logger.getLogger(this.getClass().getName());
%>
<%
    Integer timeleft = 0;
    PropertyEncoder appMsg = null;
    Accountuser accountuser = null;
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

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:include page="../layout/Style.jsp"></jsp:include>







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
                <td><div class="alert-failure">
                    <h2> Login Failure</h2>
                </div></td>
              </tr>
           <tr>
                    <td  align="center"><div class="error_code" title="<%=   peLogin.getMobileNoFormated()%>">
                            <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                            <%=result.getMessage()%>
                            <%}%>
                        </div>
                    </td>
                </tr> 
      </tbody></table></td>
            </tr>
           
           
        </table>
                    
                    </td>
                </tr>
               <tr>
                    <td align="center" ><%=appMsg.getString("link.login.now.message")%>
                    </td>
                </tr>   <tr>
                    <td height="10"> </td>
                </tr>
                <tr class="click_here">
                    <td align="center"  ><%=appMsg.getString("f.help.message")%> </td>
                </tr>


            </table>


        </div>
    
    <!-- /booking-mask -->


    <jsp:include page="../layout/Footer.jsp"></jsp:include>




    </body>
    
    
    
    
    
    
    
    
    
    
    
    
    
 


<%} catch (Exception ex) {
        ex.getMessage();
        out.print("Error in fail form=" + ex.getMessage());
    }%>