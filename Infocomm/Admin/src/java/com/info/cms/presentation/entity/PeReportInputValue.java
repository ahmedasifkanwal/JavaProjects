/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

/**
 *
 * @author mohd rehan
 */
/*

 */
import com.info.cms.helper.StringHelper;
import java.io.Serializable;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author software1
 */
public class PeReportInputValue implements Serializable {

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    private String username = "";
    private String password = "";
    private String repassword = "";
    private String countryCode = "";
    private String mobile = "";
    private String imsi = "";
    private String reportId = "";
    private String reportLink;
    private String durationType;
    private String role;
    private String loggedInUser;
    private String month;
    private String year;
    private String fromDateTime = "";
    private String fromDateTimeMin = "";
    private String toDateTime = "";
    private String toDateTimeMin = "";
    private String useripIp1 = "";
    private String serveripIp2 = "";
    private String macadds = "";
    private String host = "";
    private String uri = "";
    private String location = "";
    private String httpPostGet = "";
    private String pdfsize = "50000";
    private String csvsize = "50000";
    private String reportTypeValue;
    private boolean expired = false;
    private String filterCode;
    private String filterText = "";
    private String searchResult = "";
    private String reportFilterName = "";
    private String status;
    private String ownerName;
    private String batchId;
    private String vlanId;
    private String vlanGroupId;
    private String vlanGroupName;
    private String OSA_SOURCE_IP;
    private String ODA_DEST_IP;
    private String SA_SOURCE_IP;
    private String DA_DESTI_IP;
    private String daterange;
    private String param1;
    private String param2;
    private String param3;
    private String gender;

    public PeReportInputValue(String jsonString) throws ParseException {

        if (!StringHelper.isNullOrEmpty(jsonString)) {

            JSONParser parser = new JSONParser();
            Object objparser = parser.parse(jsonString);
            JSONObject jsonObject = (JSONObject) objparser;
            vlanGroupId = (String) jsonObject.get("vlanGroupId");
            param1 = (String) jsonObject.get("param1");
            param2 = (String) jsonObject.get("param2");
            param3 = (String) jsonObject.get("param3");
            username = (String) jsonObject.get("username");
            mobile = (String) jsonObject.get("mobile");
            imsi = (String) jsonObject.get("imsi");

            password = (String) jsonObject.get("password");
            repassword = (String) jsonObject.get("repassword");
            countryCode = (String) jsonObject.get("countryCode");
            batchId = (String) jsonObject.get("batchId");

            vlanGroupName = (String) jsonObject.get("vlanGroupName");
            filterCode = (String) jsonObject.get("filterCode");
            reportId = (String) jsonObject.get("reportId");
            expired = jsonObject.get("expired") == null ? false : Boolean.parseBoolean(jsonObject.get("expired").toString());
            ownerName = (String) jsonObject.get("ownerName");
            vlanId = (String) jsonObject.get("vlanId");
            daterange = (String) jsonObject.get("daterange");
            status = (String) jsonObject.get("status");
            durationType = (String) jsonObject.get("durationType");
            OSA_SOURCE_IP = (String) jsonObject.get("OSA_SOURCE_IP");
            ODA_DEST_IP = (String) jsonObject.get("ODA_DEST_IP");
            SA_SOURCE_IP = (String) jsonObject.get("SA_SOURCE_IP");
            DA_DESTI_IP = (String) jsonObject.get("DA_DESTI_IP");
            role = (String) jsonObject.get("role");
            month = (String) jsonObject.get("month");
            year = (String) jsonObject.get("year");
            fromDateTime = (String) jsonObject.get("fromDateTime");
            fromDateTimeMin = (String) jsonObject.get("fromDateTimeMin");
            toDateTime = (String) jsonObject.get("toDateTime");
            toDateTimeMin = (String) jsonObject.get("toDateTimeMin");
            useripIp1 = (String) jsonObject.get("useripIp1");
            serveripIp2 = (String) jsonObject.get("serveripIp2");
            macadds = (String) jsonObject.get("macadds");
            host = (String) jsonObject.get("host");
            uri = (String) jsonObject.get("uri");
            location = (String) jsonObject.get("location");
            reportTypeValue = (String) jsonObject.get("reportTypeValue");
            httpPostGet = (String) jsonObject.get("httpPostGet");
            gender = (String) jsonObject.get("gender");
        }

    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile the mobile to set
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * @return the reportId
     */
    public String getReportId() {
        return reportId;
    }

    /**
     * @param reportId the reportId to set
     */
    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    /**
     * @return the reportLink
     */
    public String getReportLink() {
        return reportLink;
    }

    /**
     * @param reportLink the reportLink to set
     */
    public void setReportLink(String reportLink) {
        this.reportLink = reportLink;
    }

    /**
     * @return the message
     */
    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * @return the loggedInUser
     */
    public String getLoggedInUser() {
        return loggedInUser;
    }

    /**
     * @param loggedInUser the loggedInUser to set
     */
    public void setLoggedInUser(String loggedInUser) {
        this.loggedInUser = loggedInUser;
    }

    /**
     * @return the month
     */
    public String getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = month;
    }

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the fromDateTime
     */
    public String getFromDateTime() {
        return fromDateTime;
    }

    /**
     * @param fromDateTime the fromDateTime to set
     */
    public void setFromDateTime(String fromDateTime) {
        this.fromDateTime = fromDateTime;
    }

    /**
     * @return the fromDateTimeMin
     */
    public String getFromDateTimeMin() {
        return fromDateTimeMin;
    }

    /**
     * @param fromDateTimeMin the fromDateTimeMin to set
     */
    public void setFromDateTimeMin(String fromDateTimeMin) {
        this.fromDateTimeMin = fromDateTimeMin;
    }

    /**
     * @return the toDateTime
     */
    public String getToDateTime() {
        return toDateTime;
    }

    /**
     * @param toDateTime the toDateTime to set
     */
    public void setToDateTime(String toDateTime) {
        this.toDateTime = toDateTime;
    }

    /**
     * @return the toDateTimeMin
     */
    public String getToDateTimeMin() {
        return toDateTimeMin;
    }

    /**
     * @param toDateTimeMin the toDateTimeMin to set
     */
    public void setToDateTimeMin(String toDateTimeMin) {
        this.toDateTimeMin = toDateTimeMin;
    }

    /**
     * @return the useripIp1
     */
    public String getUseripIp1() {
        return useripIp1;
    }

    /**
     * @param useripIp1 the useripIp1 to set
     */
    public void setUseripIp1(String useripIp1) {
        this.useripIp1 = useripIp1;
    }

    /**
     * @return the serveripIp2
     */
    public String getServeripIp2() {
        return serveripIp2;
    }

    /**
     * @param serveripIp2 the serveripIp2 to set
     */
    public void setServeripIp2(String serveripIp2) {
        this.serveripIp2 = serveripIp2;
    }

    /**
     * @return the macadds
     */
    public String getMacadds() {
        return macadds;
    }

    /**
     * @param macadds the macadds to set
     */
    public void setMacadds(String macadds) {
        this.macadds = macadds;
    }

    /**
     * @return the host
     */
    public String getHost() {
        return host;
    }

    /**
     * @param host the host to set
     */
    public void setHost(String host) {
        this.host = host;
    }

    /**
     * @return the uri
     */
    public String getUri() {
        return uri;
    }

    /**
     * @param uri the uri to set
     */
    public void setUri(String uri) {
        this.uri = uri;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the httpPostGet
     */
    public String getHttpPostGet() {
        return httpPostGet;
    }

    /**
     * @param httpPostGet the httpPostGet to set
     */
    public void setHttpPostGet(String httpPostGet) {
        this.httpPostGet = httpPostGet;
    }

    /**
     * @return the pdfsize
     */
    public String getPdfsize() {
        return pdfsize;
    }

    /**
     * @param pdfsize the pdfsize to set
     */
    public void setPdfsize(String pdfsize) {
        this.pdfsize = pdfsize;
    }

    /**
     * @return the csvsize
     */
    public String getCsvsize() {
        return csvsize;
    }

    /**
     * @param csvsize the csvsize to set
     */
    public void setCsvsize(String csvsize) {
        this.csvsize = csvsize;
    }

    /**
     * @return the reportTypeValue
     */
    public String getReportTypeValue() {
        return reportTypeValue;
    }

    /**
     * @param reportTypeValue the reportTypeValue to set
     */
    public void setReportTypeValue(String reportTypeValue) {
        this.reportTypeValue = reportTypeValue;
    }

    /**
     * @return the filterCode
     */
    public String getFilterCode() {
        return filterCode;
    }

    /**
     * @param filterCode the filterCode to set
     */
    public void setFilterCode(String filterCode) {
        this.filterCode = filterCode;
    }

    /**
     * @return the filterText
     */
    public String getFilterText() {
        return filterText;
    }

    /**
     * @param filterText the filterText to set
     */
    public void setFilterText(String filterText) {
        this.filterText = filterText;
    }

    /**
     * @return the searchResult
     */
    public String getSearchResult() {
        return searchResult;
    }

    /**
     * @param searchResult the searchResult to set
     */
    public void setSearchResult(String searchResult) {
        this.searchResult = searchResult;
    }

    /**
     * @return the reportFilterName
     */
    public String getReportFilterName() {
        return reportFilterName;
    }

    /**
     * @param reportFilterName the reportFilterName to set
     */
    public void setReportFilterName(String reportFilterName) {
        this.reportFilterName = reportFilterName;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the ownerName
     */
    public String getOwnerName() {
        return ownerName;
    }

    /**
     * @param ownerName the ownerName to set
     */
    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    /**
     * @return the planId
     */
    public String getBatchId() {
        return batchId;
    }

    /**
     * @param planId the planId to set
     */
    public void setBatchId(String batchId) {
        this.batchId = batchId;
    }

    /**
     * @return the vlanId
     */
    public String getVlanId() {
        return vlanId;
    }

    /**
     * @param vlanId the vlanId to set
     */
    public void setVlanId(String vlanId) {
        this.vlanId = vlanId;
    }

    /**
     * @return the OSA_SOURCE_IP
     */
    public String getOSA_SOURCE_IP() {
        return OSA_SOURCE_IP;
    }

    /**
     * @param OSA_SOURCE_IP the OSA_SOURCE_IP to set
     */
    public void setOSA_SOURCE_IP(String OSA_SOURCE_IP) {
        this.OSA_SOURCE_IP = OSA_SOURCE_IP;
    }

    /**
     * @return the ODA_DEST_IP
     */
    public String getODA_DEST_IP() {
        return ODA_DEST_IP;
    }

    /**
     * @param ODA_DEST_IP the ODA_DEST_IP to set
     */
    public void setODA_DEST_IP(String ODA_DEST_IP) {
        this.ODA_DEST_IP = ODA_DEST_IP;
    }

    /**
     * @return the SA_SOURCE_IP
     */
    public String getSA_SOURCE_IP() {
        return SA_SOURCE_IP;
    }

    /**
     * @param SA_SOURCE_IP the SA_SOURCE_IP to set
     */
    public void setSA_SOURCE_IP(String SA_SOURCE_IP) {
        this.SA_SOURCE_IP = SA_SOURCE_IP;
    }

    /**
     * @return the DA_DESTI_IP
     */
    public String getDA_DESTI_IP() {
        return DA_DESTI_IP;
    }

    /**
     * @param DA_DESTI_IP the DA_DESTI_IP to set
     */
    public void setDA_DESTI_IP(String DA_DESTI_IP) {
        this.DA_DESTI_IP = DA_DESTI_IP;
    }

    /**
     * @return the daterange
     */
    public String getDaterange() {
        return daterange;
    }

    /**
     * @param daterange the daterange to set
     */
    public void setDaterange(String daterange) {
        this.daterange = daterange;
    }

    /**
     * @return the durationType
     */
    public String getDurationType() {
        return durationType;
    }

    /**
     * @param durationType the durationType to set
     */
    public void setDurationType(String durationType) {
        this.durationType = durationType;
    }

    /**
     * @return the expired
     */
    public boolean isExpired() {
        return expired;
    }

    /**
     * @param expired the expired to set
     */
    public void setExpired(boolean expired) {
        this.expired = expired;
    }

    /**
     * @return the vlanGroupId
     */
    public String getVlanGroupId() {
        return vlanGroupId;
    }

    /**
     * @param vlanGroupId the vlanGroupId to set
     */
    public void setVlanGroupId(String vlanGroupId) {
        this.vlanGroupId = vlanGroupId;
    }

    /**
     * @return the vlanGroupName
     */
    public String getVlanGroupName() {
        return vlanGroupName;
    }

    /**
     * @param vlanGroupName the vlanGroupName to set
     */
    public void setVlanGroupName(String vlanGroupName) {
        this.vlanGroupName = vlanGroupName;
    }

    /**
     * @return the param1
     */
    public String getParam1() {
        return param1;
    }

    /**
     * @param param1 the param1 to set
     */
    public void setParam1(String param1) {
        this.param1 = param1;
    }

    /**
     * @return the param2
     */
    public String getParam2() {
        return param2;
    }

    /**
     * @param param2 the param2 to set
     */
    public void setParam2(String param2) {
        this.param2 = param2;
    }

    /**
     * @return the param3
     */
    public String getParam3() {
        return param3;
    }

    /**
     * @param param3 the param3 to set
     */
    public void setParam3(String param3) {
        this.param3 = param3;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the repassword
     */
    public String getRepassword() {
        return repassword;
    }

    /**
     * @param repassword the repassword to set
     */
    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    /**
     * @return the countryCode
     */
    public String getCountryCode() {
        return countryCode;
    }

    /**
     * @param countryCode the countryCode to set
     */
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    /**
     * @return the imsi
     */
    public String getImsi() {
        return imsi;
    }

    /**
     * @param imsi the imsi to set
     */
    public void setImsi(String imsi) {
        this.imsi = imsi;
    }

}
