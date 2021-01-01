
<%@page import="org.apache.tomcat.jni.Local"%>
<%@page import="java.util.Map"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="com.info.wifi.business.facade.CountryFacade"%>
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.facade.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:include page="../layout/Style.jsp"></jsp:include>









  <body id="page_home" class="hhotelrevamp">
        
    <jsp:include page="../layout/Header.jsp"></jsp:include>    

<div id="topbuttonpanel" class="wl-container2">
  <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"     >
    <tr>
      <td height="10px;"></td>
    </tr>
    <tr>
      <td > 
              
              <!--------------- Content 1 --------------->
                
              
              
              
              

            <%
                String styleExistigUser = "";
                String controller = "", controllerpage = "", mobileNumber = "", verificationToken = "", countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
                Result result = null;
                Map errorMap = null;
                PropertyEncoder appMsg = null;
                java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Header");
                PeLogin peLogin = null;
                try {
                    peLogin = (PeLogin) session.getAttribute("peLogin");
                    peLogin.setLocale(new java.util.Locale(""));
                    styleExistigUser = peLogin.getPaymentMethodName().equals(WIFIConstants.UAM_TILES_FX.prepaid.name()) ? "style=\"display: inline\"" : "style=\"display: none\"";
                    peLogin = (PeLogin) session.getAttribute("peLogin");
                    controller = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/controller/UserWithSecurityCodeController.jsp?lang=en";
                    controllerpage = request.getContextPath() + "/fixedtemplate/" + peLogin.OWNERNAME_NOSPACE() + "/" + peLogin.LANGFIXED() + "common/";

                    appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
                    countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
                    mobileNumber = !StringUtil.isNullOrEmpty(peLogin.getMobileNo()) ? peLogin.getMobileNo() : "";
                    verificationToken = !StringUtil.isNullOrEmpty(peLogin.getVerificationToken()) ? peLogin.getVerificationToken() : "";
                    if (session.getAttribute("Result") != null) {
                        result = (Result) session.getAttribute("Result");
                        errorMap = result.getExceptionMessages();
                    }


            %>


           
<form name="theform" id="theform" action="<%=controller%>"    method="post" theme="simple"   >
                <INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="ENTER"/>
            

                    
                      <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"     >
                   
                   <% if (result != null && !StringUtil.isNullOrEmpty(result.getMessage())) {%>
                        <div class="error_code_main" > <%=result.getMessage()%></div>
                        <%}%>
                    
                  <tr>
                    <td  width="30%" style="text-align:right"> <%=appMsg.getString("f.country.code")%> </td>
                    <td   align="center" class="formlabels" width="70%"   >
                      <div class="error_code">
                            <%if (errorMap != null) {%>
                            <%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
                            <%}%>
                        </div>
                 <select    id="countryCode"  name="countryCode" tabindex="1"  class="loginsel"     >
                                <option value="">Select Country</option>
                                <%try {
                                        List<Country> countryList = new CountryFacade().getCountryCode();
                                        for (int j = 0; j < countryList.size(); j++) {

                                            {
                                                if (countryCode.equals(countryList.get(j).getCountryCode())) {
                                                    out.print("<option selected value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getCountryName() + " - " + countryList.get(j).getCountryCode() + "</option>");
                                                } else {
                                                    out.print("<option value=\"" + countryList.get(j).getCountryCode() + "\">" + countryList.get(j).getCountryName() + " - " + countryList.get(j).getCountryCode() + "</option>");
                                                }
                                            }
                                        }
                                    } catch (Exception ex) {
                                        logger.log(Level.SEVERE, "Exception :" + ex);
                                        out.print("<option value=\"0\">None</option>");
                                    }
                                %>
                            </select>
                    
                    </td>
                  </tr>
                              <tr>
                    <td style="text-align:right"><%=appMsg.getString("f.mobile.no")%>  </td>
                    <td   align="center" class="formlabels">   <div class="error_code">
                            <%if (errorMap != null) {%>
                            <%=errorMap.containsKey("mobileNumber") ? errorMap.get("mobileNumber") : ""%>
                            <%}%>
                        </div> 
                     <input name="mobileNumber" type="text" class="login" id="mobileNumber" maxlength="12" value="<%=mobileNumber%>"/>
                    </td>
                  </tr>
                    
                    
                       <tr>
                    <td style="text-align:right"> <%=appMsg.getString("f.auth.code")%>  </td>
                    <td   align="center" class="formlabels">    <div class="error_code">
                            <%if (errorMap != null) {%>
                            <%=errorMap.containsKey("verificationToken") ? errorMap.get("verificationToken") : ""%>
                            <%}%>
                        </div>
                     <input name="verificationToken" type="text" class="login" id="userName" maxlength="15" value="<%=verificationToken%>"/>
                    </td>
                  </tr>
                      </table>
                    
                     <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"    >
                  <tr>
                    <td   align="center" class="formlabels"   >
    <input id="Enter" name="Enter" type="submit"  align="center" value="<%=appMsg.getString("f.enter")%>" class="general-button"  />                    
    </td>
                  </tr>
                </table>
              
                
               <div class="button1"  <%=styleExistigUser%> >
                        <input    id="Existing_User" name="Existing_User" type="submit" align="center" value=" <%=appMsg.getString("f.existing.user.login")%>" class="general-button" style="width:98%;"    />
                    </div>
                    <div class="button1">
                        <input id="Register_New" name="Register_New" type="submit"  align="center" value=" <%=appMsg.getString("f.register.new.account")%>" class="general-button" style="width:98%;"  />
                    </div>
              

     


              
                </form>

        
        
   
              
              <!--------------- Content 1 End ---------------> 
       </td>
    </tr>
    <tr>
      <td   align="center" class="formlabels"   ><div  > </div></td>
    </tr>
  </table>
  <table width="95%"  border="0" align="center" cellpadding="2" cellspacing="0"    >
    <tr>
      <td   align="center" class="formlabels"   ><div  > </div></td>
    </tr>
  </table>
</div>

<!-- /booking-mask -->


<jsp:include page="../layout/Footer.jsp"></jsp:include>


      

    </body>






















     

      
            
            
            
            
            
            
            
            
            
            
            

   



<%
    } catch (Exception ex) {

        logger.log(Level.ALL, ex.getMessage());
        response.sendRedirect(controllerpage + "Error.jsp");  return ;
    }


%>