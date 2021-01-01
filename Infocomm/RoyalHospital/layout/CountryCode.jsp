

<%@page import="com.info.wifi.business.facade.CountryFacade"%>
<%@page import="com.info.wifi.cms.entity.Country"%>
<%@page import="com.info.wifi.cms.util.StringUtil"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.PropertyEncoder"%>
<%@page import="com.info.wifi.facade.util.Result"%>
<%@page import="com.info.wifi.facade.util.WIFIConstants"%>
<%@page import="java.util.List"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Level"%>
<%

    String countryCode = WIFIConstants.DEFAULT_COUNTRY_CODE;
    Result result = null;
    java.util.Map errorMap = null;
    PropertyEncoder appMsg = null;
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("WelcomeForm");
    PeLogin peLogin = null;
    peLogin = (PeLogin) session.getAttribute("peLogin");
    appMsg = WIFILayoutManager.getMsgByLang(peLogin.getLocale());
    countryCode = !StringUtil.isNullOrEmpty(peLogin.getCountryCode()) ? peLogin.getCountryCode() : WIFIConstants.DEFAULT_COUNTRY_CODE;
    if (session.getAttribute("Result") != null) {
            result = (Result) session.getAttribute("Result");
            errorMap = result.getExceptionMessages();
        }

%>

<%if (errorMap != null) {%>
<%=errorMap.containsKey("countryCode") ? errorMap.get("countryCode") : ""%>
<%}%> 
<div class="wh90percent textleft"> <span class="opensans size13"><b> <%=appMsg.getString("f.country.code")%></b></span>
    <select    id="countryCode"  name="countryCode" tabindex="1"  class="form-control "  >

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
</div>