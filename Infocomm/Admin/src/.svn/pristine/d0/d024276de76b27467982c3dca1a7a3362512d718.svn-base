/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;
import com.info.wifi.cms.entity.ErrorLog;
import com.info.wifi.cms.entity.controller.ErrorLogJpaController;
import com.info.wifi.cms.util.StringUtil;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 *
 * @author software1
 */
public class SSGAPI {

    /**
     * @return the SSG_URL
     */
    public String getSSGURL() {
        return SSGURL;
    }

    /**
     * @param expiryDate the _expiryDate to set
     */
    public void setExpiryDate(Date expiryDate) {
        this._expiryDate = expiryDate;
        _expiryDateFormated = DateHelper.yyyyMMddhhmmssFormat.format(expiryDate);
    }

    /**
     * @return the _expiryDate
     */
    public Date getExpiryDate() {
        return _expiryDate;
    }

    private SSGAPIResult populateResult(String reply) {
        SSGAPIResult result = new SSGAPIResult();

        /* reply = "op = Omantel_account_delete\n"
         + "version = 1.0.0\n"
         + "result = ok\n"
         + "resultcode =0\n"
         + "deleted = 1\n"
         + "results = ok|ok\n";*/
        if (!StringUtil.isNullOrEmpty(reply)) {

            String[] repls = reply.split("\n");
            for (int j = 0; j < repls.length; j++) {
                String[] values = repls[j].trim().split("=");

                if (values[0].trim().equals("op")) {
                    result.setOperation(values[1].trim());
                } else if (values[0].trim().equals("version")) {
                    result.setVersion(values[1].trim());
                } else if (values[0].trim().equals("result")) {
                    result.setResult(values[1].trim());
                } else if (values[0].trim().equals("resultcode")) {
                    result.setResultcode(values[1].trim());
                } else if (values[0].trim().equals("deleted")) {
                    result.setNoofdeleteduser(values[1].trim());
                } else if (values[0].trim().equals("created")) {
                    result.setNoofusercreated(values[1].trim());
                } else if (values[0].trim().equals("results")) {
                    result.setMultiResults(values[1].trim());
                } else if (values[0].trim().equals("userid")) {
                    result.setUserid(values[1]);
                } else if (values[0].trim().equals("password")) {
                    result.setPassword(values[1].trim());
                }
                if (values[0].trim().equals("error")) {
                    result.setErrorMessage(values[1].trim());
                }

            }
        }

        return result;
    }
//https://212.72.1.141/api/?op=user_get&api_password=admin&userid=lydyymlql%40om"

    private enum API_OPERATION {

        omantel_account_add, omantel_account_update, omantel_account_delete, auth_logout, user_get
    }
    private static final Logger logger = Logger.getLogger(SSGAPI.class.getName());
    private String _username = "";// max 64 chars, min 3, valid chars: A-Z a-z 0-9 - . _ @, pipe separated multi in case of delete
    private String _password = "";//
    private String _userType = "";// 0 – Stored duration; 1 – Fixed duration;2 – Stored Volume
    private String _accessType = "";// 0 – Pre-paid; 1 – Post-paid
    private String _expiryDateFormated = "";//account expiry date, valid date time string
    private Date _expiryDate;
    private String _timeLeft = "";//for stored duration value
    private String _volumeLeft = "";// for stored volume value
    private String _vlan = "";// location or VLAN ID
    private String _mobileNo = "";// subscriber mobile number
    private String _ownerName = "";//
    private String _newPassword = "";// new password
    private String SSGURL = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("ApplicationResources", null)).getString("ssg.api.url");
    private String SSGSSGURL = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("ApplicationResources", null)).getString("ssg.ssg.api.url");

    /**
     * @return max 64 chars, min 3, valid chars: A-Z a-z 0-9 - . _ @, pipe
     * separated multi in case of delete
     */
    public String getUsername() {
        return _username;
    }

    /**
     * @param max 64 chars, min 3, valid chars: A-Z a-z 0-9 - . _ @, pipe
     * separated multi in case of delete
     */
    public void setUsername(String username) {
        this._username = username;
    }

    /**
     * @return the _password
     */
    public String getPassword() {
        return _password;
    }

    /**
     * @param password the _password to set
     */
    public void setPassword(String password) {
        this._password = password;
    }

    /**
     * @return 0 – Stored duration; 1 – Fixed duration;2 – Stored Volume
     */
    public String getUserType() {
        return _userType;
    }

    /**
     * @param 0 – Stored duration; 1 – Fixed duration;2 – Stored Volume
     */
    public void setUserType(String userType) {
        this._userType = userType;
    }

    /**
     * @return the _accessType
     */
    public String getAccessType() {
        return _accessType;
    }

    /**
     * @param accessType the _accessType to set
     */
    public void setAccessType(String accessType) {
        this._accessType = accessType;
    }

    /**
     * @return the _timeLeft
     */
    public String getTimeLeft() {
        return _timeLeft;
    }

    /**
     * @param timeLeft the _timeLeft to set
     */
    public void setTimeLeft(String timeLeft) {
        this._timeLeft = timeLeft;
    }

    /**
     * @return the _volumeLeft
     */
    public String getVolumeLeft() {
        return _volumeLeft;
    }

    /**
     * @param volumeLeft the _volumeLeft to set
     */
    public void setVolumeLeft(String volumeLeft) {
        this._volumeLeft = volumeLeft;
    }

    /**
     * @return the _vlan
     */
    public String getVlan() {
        return _vlan;
    }

    /**
     * @param vlan the _vlan to set
     */
    public void setVlan(String vlan) {
        this._vlan = vlan;
    }

    /**
     * @return the _mobileNo
     */
    public String getMobileNo() {
        return _mobileNo;
    }

    /**
     * @param mobileNo the _mobileNo to set
     */
    public void setMobileNo(String mobileNo) {
        this._mobileNo = mobileNo;
    }

    /**
     * @return the _ownerName
     */
    public String getOwnerName() {
        return _ownerName;
    }

    /**
     * @param ownerName the _ownerName to set
     */
    public void setOwnerName(String ownerName) {
        this._ownerName = ownerName;
    }

    /**
     * @return the _newPassword
     */
    public String getNewPassword() {
        return _newPassword;
    }

    /**
     * @param newPassword the _newPassword to set
     */
    public void setNewPassword(String newPassword) {
        this._newPassword = newPassword;
    }

    public SSGAPIResult logout(String client_mac) throws MalformedURLException, IOException {

        SSGAPIResult result = new SSGAPIResult();
        String url1 = SSGSSGURL + "op=" + API_OPERATION.auth_logout + "&api_password=admin"
                + "&client_mac=" + client_mac;
        URL url = new URL(url1);
        result = callSSGAPI(url);

        logger.info("Add: API URL" + url);
        return result;
    }

    public SSGAPIResult add() throws MalformedURLException, IOException {

        //volume let shuld go as in tin api  
        double d = Double.parseDouble(_volumeLeft);
        String volumeLeft = String.valueOf(((int) d));

        SSGAPIResult result = new SSGAPIResult();
        String url1 = SSGURL + "op=" + API_OPERATION.omantel_account_add + "&api_password=admin"
                + "&username=" + URLEncoder.encode(_username, "UTF-8")
                + "&password=" + URLEncoder.encode(_password, "UTF-8")
                + "&user_type=" + URLEncoder.encode(_userType, "UTF-8")
                + "&access_type=" + URLEncoder.encode(_accessType, "UTF-8")
                + "&expiry_date=" + URLEncoder.encode(_expiryDateFormated, "UTF-8")
                + "&time_left=" + URLEncoder.encode(_timeLeft, "UTF-8")
                + "&volume_left=" + URLEncoder.encode(volumeLeft, "UTF-8")
                + "&vlan=" + URLEncoder.encode(_vlan, "UTF-8")
                + "&mobile_no=" + URLEncoder.encode(_mobileNo, "UTF-8")
                + "&owner_name=" + URLEncoder.encode(_ownerName, "UTF-8");

        // String url1 = ("https://10.237.139.95/api/?op=Omantel_account_add&api_password=admin&username=guunvotj&password=passs&user_type=2&access_type=0&expiry_date=2012-06-30 10:03:17&time_left=3600&volume_left=0&vlan=9&mobile_no=9715021001&owner_name=Omantel");
        // String encodedUrl=  URLEncoder.encode(url1,"UTF-8");
        logger.info(url1);
        URL url = new URL(url1);

        //URL url = new URL( "");
        result = callSSGAPI(url);
        try {
            if (!result.getResult().toLowerCase().equals("ok")) {
                logAPICallError(result, API_OPERATION.omantel_account_add);
            }
        } catch (Exception ex) {
            logger.info("Add: API URL:" + ex.getMessage());
        }

        return result;
    }

    private void logAPICallError(SSGAPIResult result, API_OPERATION op) {
        try {
            ErrorLogJpaController cont = new ErrorLogJpaController();
            ErrorLog msg = new ErrorLog();
            msg.setErrorcode(result.getResultcode());
            msg.setDateCreation(DateHelper.getCurrentDate());
            msg.setPassword(_password);
            msg.setUsername(_username);
            msg.setVlanid(_vlan);
            msg.setCreatedby("API:" + op);
            msg.setRemarks("API Call Failed");
            cont.create(msg);

        } catch (Exception ex) {
            logger.info("Add: API URL" + ex.getMessage());
        }
    }

    public SSGAPIResult updatePasswordByEncryption() throws MalformedURLException, IOException {
        SSGAPIResult result = new SSGAPIResult();
        //&encryption=MD5
        String url1 = SSGURL + "op=" + API_OPERATION.omantel_account_update + "&api_password=admin"
                + "&username=" + URLEncoder.encode(_username, "UTF-8")
                + "&current_password=" + URLEncoder.encode(_password, "UTF-8")
                + "&password=" + URLEncoder.encode(_newPassword, "UTF-8")
                + "&user_type=" //+ _userType
                + "&access_type="// + _accessType
                + "&expiry_date=" //+ _expiryDateFormated
                + "&time_left="// + _timeLeft
                + "&volume_left="// + _volumeLeft
                + "&vlan=" //+ _vlan
                + "&mobile_no=" //+ _mobileNo
                + "&owner_name=";//+ _ownerName;
        URL url = new URL(url1);
        //URL url = new URL( "");
        result = callSSGAPI(url);
        try {
            if (!result.getResult().toLowerCase().equals("ok")) {
                logAPICallError(result, API_OPERATION.omantel_account_update);
            }
        } catch (Exception ex) {
            logger.info("Update: API URL:" + ex.getMessage());
        }

        return result;
    }
    /*
     public SSGAPIResult updatePassword() throws MalformedURLException, IOException {
     //https://10.237.139.95/api/?api_password=admin&op=Omantel_account_update&username=abc123&current_password=abc123&password=123abc&user_type=&access_type=&expiry_date=&time_left=&volume_left=&vlan=&mobile_no=&owner_name=
     SSGAPIResult result = new SSGAPIResult();
     String url1 = SSGURL + "op=" + API_OPERATION.Omantel_account_update + "&api_password=admin"
     + "&username=" + URLEncoder.encode(_username, "UTF-8")
     + "&current_password=" + URLEncoder.encode(_password, "UTF-8")
     + "&password=" + URLEncoder.encode(_newPassword, "UTF-8")
     + "&user_type=" //+ _userType
     + "&access_type="// + _accessType
     + "&expiry_date=" //+ _expiryDateFormated
     + "&time_left="// + _timeLeft
     + "&volume_left="// + _volumeLeft
     + "&vlan=" //+ _vlan
     + "&mobile_no=" //+ _mobileNo
     + "&owner_name=";//+ _ownerName;
     URL url = new URL(url1);
     //URL url = new URL( "");
     result = callSSGAPI(url);
     try {
     if (!result.getResult().toLowerCase().equals("ok")) {
     logAPICallError(result, API_OPERATION.Omantel_account_update);
     }
     } catch (Exception ex) {
     logger.info("Update: API URL:" + ex.getMessage());
     }



     return result;
     }
     */

    public SSGAPIResult updateExpiryDate() throws MalformedURLException, IOException {
//https://10.237.139.95/api/?api_password=admin&op=Omantel_account_update&username=abc123&current_password=abc123&password=123abc&user_type=&access_type=&expiry_date=&time_left=&volume_left=&vlan=&mobile_no=&owner_name=
        SSGAPIResult result = new SSGAPIResult();
        String url1 = SSGURL + "op=" + API_OPERATION.omantel_account_update + "&api_password=admin"
                + "&username=" + URLEncoder.encode(_username, "UTF-8")
                + "&current_password=" //+ URLEncoder.encode(_password, "UTF-8")
                + "&password=" //+ URLEncoder.encode(_newPassword, "UTF-8")
                + "&user_type=" //+ _userType
                + "&access_type="// + _accessType
                + "&expiry_date=" + URLEncoder.encode(_expiryDateFormated, "UTF-8")
                + "&time_left="// + _timeLeft
                + "&volume_left="// + _volumeLeft
                + "&vlan=" //+ _vlan
                + "&mobile_no=" //+ _mobileNo
                + "&owner_name=";//+ _ownerName;
        URL url = new URL(url1);
        //URL url = new URL( "");
        result = callSSGAPI(url);
        try {
            if (!result.getResult().toLowerCase().equals("ok")) {
                logAPICallError(result, API_OPERATION.omantel_account_update);
            }
        } catch (Exception ex) {
            logger.info("Update: API URL:" + ex.getMessage());
        }

        return result;
    }

    public SSGAPIResult delete() throws MalformedURLException, IOException {

        SSGAPIResult result = new SSGAPIResult();
        String url1 = SSGURL + "op=" + API_OPERATION.omantel_account_delete
                + "&username=" + _username;
        URL url = new URL(url1);
        result = callSSGAPI(url);

        logger.info("Add: API URL" + url);
        return result;
    }

    public static void disableCertificateValidation() {
        // Create a trust manager that does not validate certificate chains
        TrustManager[] trustAllCerts = new TrustManager[]{
            new X509TrustManager() {

                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }

                public void checkClientTrusted(X509Certificate[] certs, String authType) {
                }

                public void checkServerTrusted(X509Certificate[] certs, String authType) {
                }
            }};

        // Ignore differences between given hostname and certificate hostname
        HostnameVerifier hv = new HostnameVerifier() {

            public boolean verify(String hostname, SSLSession session) {
                return true;
            }
        };

        // Install the all-trusting trust manager
        try {
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
            HttpsURLConnection.setDefaultHostnameVerifier(hv);
        } catch (Exception e) {
        }
    }

    private SSGAPIResult callSSGAPI(URL url) throws IOException {
        SSGAPIResult result = new SSGAPIResult();
        if (UIConstants.IS_ON_STAGING.equals("Yes")) {
            result.setResult("Ok");
            return result;

        }
        disableCertificateValidation();

        //result = populateResult("");
        logger.info("url: " + url);
        //HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setDoInput(true);

        // conn.setAllowUserInteraction(true);
        logger.info("conn status: " + conn);
        OutputStream outs = conn.getOutputStream();
        PrintWriter out = new PrintWriter(outs);
        System.out.println("PrintWriter : " + out);

        System.out.println("creating InputStream: ");
        InputStream ins = conn.getInputStream();
        logger.info("InputStream: " + ins);
        BufferedReader in = new BufferedReader(new InputStreamReader(ins));
        logger.info("BufferedReader: " + in);
        StringBuffer reply = new StringBuffer();

        logger.info("Reading data: ");
        String message = "";
        while ((message = in.readLine()) != null) {
            System.out.println(message);
            logger.info("line: " + message);
            reply.append(message + "\n");
        }
        System.out.println("Received SSG String :" + reply.toString());
        logger.info("Closing stream");
        in.close();

        result = populateResult(reply.toString());

        return result;

    }

    public SSGAPIResult Update() {

        SSGAPIResult result = new SSGAPIResult();

        return result;
    }

    public SSGAPIResult Delete() {

        SSGAPIResult result = new SSGAPIResult();
        return result;
    }

    public static void main(String argv[]) throws MalformedURLException, IOException {

        String https_url = "https://10.237.139.95/api/?op=Omantel_account_add&api_password=admin&username=guunvotj&password=10c918193756208b88359901baa5d854&user_type=2&access_type=0&expiry_date=27-Jul-20122004:03:17&time_left=3600&volume_left=0&vlan=9&mobile_no=9715021001&owner_name=Omantel";
        URL url;
        try {
            url = new URL(https_url);
            new SSGAPI().callSSGAPI(url);

            System.setProperty("sun.security.ssl.allowUnsafeRenegotiation", "true");

            //
            System.setProperty("com.sun.net.ssl.checkRevocation", "false");


            // System.out.println("getHostnameVerifier: " + con.getHostnameVerifier());
//            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//
//            String input;
//
//            while ((input = br.readLine()) != null) {
//                System.out.println(input);
//            }
//            br.close();
            //dumpl all cert info
            //print_https_cert(con);
            //dump all the content
            //print_content(con);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public SSGAPIResult getLivedata() {

        String s;
        Process p;
        SSGAPIResult result = new SSGAPIResult();
        try {
            p = Runtime.getRuntime().exec("snmpget    -v 2c  -c public1  212.72.30.57  .1.3.6.1.4.1.12902.1.1.2.1.1.2");
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(p.getInputStream()));
            while ((s = br.readLine()) != null) {
                System.out.println("line: " + s);
                System.out.println("LOGGEG IN USER: " + s.split("INTEGER:")[1].trim());
                result.setLiveLogginUser(s.split("INTEGER:")[1].trim());

            }

            p = Runtime.getRuntime().exec("snmpget    -v 2c  -c public1  212.72.30.57  .1.3.6.1.4.1.12902.1.1.2.1.1.1");
            br = new BufferedReader(
                    new InputStreamReader(p.getInputStream()));
            while ((s = br.readLine()) != null) {
                System.out.println("CON line: " + s);
                result.setLiveConnectedDevice(s.split("INTEGER:")[1].trim());

            }

            p.waitFor();
            System.out.println("exit: " + p.exitValue());
            p.destroy();
        } catch (Exception ex) {

            logger.log(Level.SEVERE, "Update: API URL:" + ex.getMessage());
        }

        return result;
    }

}
