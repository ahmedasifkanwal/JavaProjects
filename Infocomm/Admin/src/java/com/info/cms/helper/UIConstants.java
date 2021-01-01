/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

/**
 *
 * @author software1
 */
public class UIConstants {

    /**
     *
     */
    public static String GLOBAL_ERROR = "GLOBALERROR";
    private static final String REG_EXP_EMAIL = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("REG.EXP.EMAIL");
    private static final String REG_EXP_USER_PASSWORD = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("REG.EXP.USER.PASSWORD");
    public static final String IS_ON_STAGING = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("IS_ON_STAGING");
    public static final String GRAPH_PATH = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("graph.path");
    public static final String SUBSCRIBER_PREFIX = "CUST";
    public static final String TXN_TYPE_CREDIT = "CREDIT";
    public static final String TXN_TYPE_DEBIT = "DEBIT";
    public static final String ENABLE_MSG_SENT = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("enabled.msg.sent");
    public static final String ENABLE_EMAIL_SENT = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("enabled.email.sent");

    public static final String WIFI_SMS = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("wifi.password.acivation.security.code1");
    public static final String CAMPAIGN_BANNER_IMAGE_FILE_PATH = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("campaign.banner.image.path");
    public static final String WSM_THREAD_ENABLED = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("message")).getString("wsm.thread.enabled");
    
    /**
     *
     */
    public static final int PAGING_SIZE_SMALL = 50;

    public static final int LIMIT_SEARCH_RESULT = 10000;

    /**
     *
     */
    public static final int MAX_WIDTH_STATISCTIC_REPORT = 500;

    /**
     *
     */
    public static final String[] COLOR_STATISCTIC_REPORT = {"#0033FF", "#33CCFF", "#006666", "#00FF66", "#9999FF", "#006600", "#993399", "#FFCC00",
        "#CC9900", "#CCCC00", "#993300", "#CC00##", "#330033", "#FFFF99", "#6666FF", "#000000",
        "#00CC66", "#33CCFF", "#006699", "#FFCC00", "#00FF66", "#006666", "#33CCFF", "#003FF"};

    /**
     *
     */
    public static final String CURRENCY_NAME = "OMR";
    public static String SEARCH = "SEARCH";
    public static String FILTER = "FILTER";
    public static String SQL = "SQL";

    /**
     *
     */
    public static final int THREE_WEEK_PASSWORD = 21;
    public static String DATE_SEPRATOR = " to ";

    /**
     *
     */
    public enum OPERATION {

        /**
         *
         */
        SEARCH("Search"),
        /**
         *
         */
        ADD("Add"),
        /**
         *
         */
        DELETE("Delete"),
        STATUS_CHANGE("Status Changed"),
        MAC_REFRESH("Mac Refresh"),
        /**
         *
         */
        UPDATE("Update"), FORCED_LOGOUT("Forced Logout"),
        /**
         *
         */
        CHANGE_PASSWORD("Change Password"),
        CHANGE_LOGIN_PASSWORD("Change Login Password");

        /**
         *
         */
        public final String value;

        private OPERATION(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum REGULAR_EXP {

        /**
         *
         */
        PASSWORD_EXP(REG_EXP_USER_PASSWORD),
        /**
         *
         */
        EMAIL_EXP(REG_EXP_EMAIL);

        /**
         *
         */
        public final String value;

        private REGULAR_EXP(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum MAIL_CONFIG {

        /**
         *
         */
        SENDER("internet@shenglitelecom.in"),
        /**
         *
         */
        SUBJECT("You have a mail from iCMS"), SUBJECT_MAIL_CHNAGE("You have a mail from iCMS:Security Code");

        /**
         *
         */
        public final String value;

        private MAIL_CONFIG(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum STATUS_CODE {

        /**
         *
         */
        PENDING("P"),
        /**
         *
         */
        CLOSED("C"),
        /**
         *
         */
        SUSPEND("S"),
        /**
         *
         */
        ACTIVE("A"),
        /**
         *
         */
        IN_ACTIVE("I"),
        ERROR("E"),
        DONE("D"),
        REJECTED("R"),
        UPDATE("U"),
        EXTENDED("X");

        /**
         *
         */
        public final String value;

        private STATUS_CODE(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum STATUS_CODE_DESC {

        /**
         *
         */
        PENDING("Pending"),
        /**
         *
         */
        CLOSED("Closed"),
        /**
         *
         */
        SUSPENDED("Suspended"),
        SUSPEND("Suspend"),
        /**
         *
         */
        ACTIVE("Active"),
        APPROVED("Approved"),
        APPROVE("Approve"),
        /**
         *
         */
        IN_ACTIVE("In-Active"),
        COMPLETE("Complete"),
        DOWNLOAD_START("Download Start"),
        DOWNLOADED("Downloaded"),
        DOWNLOADED_ERROR("Downloaded Error"),
        RUNNING("Running"),
        PARSING("Parsing"),
        NO_CHNAGE("No Change"),
        REJECTED("Rejected"),
        REJECTET("Reject");

        /**
         *
         */
        public final String value;

        private STATUS_CODE_DESC(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum STATUS_CODE_VALUE {

        /**
         *
         */
        P("PENDING"),
        /**
         *
         */
        C("CLOSED"),
        /**
         *
         */
        S("SUSPEND"),
        /**
         *
         */
        A("ACTIVE"),
        /**
         *
         */
        I("IN_ACTIVE"),
        R("REJECTED");

        /**
         *
         */
        public final String value;

        private STATUS_CODE_VALUE(String value) {
            this.value = value;
        }
    }

    
    
    
    
    /**
     *
     */
    public enum FILE_SIZE_BYTE {

        /**
         *
         */
        KB_1(1024),
        /**
         *
         */
        MB_1(FILE_SIZE_BYTE.KB_1.value * 1024),
        /**
         *
         */
        MB_2(2 * FILE_SIZE_BYTE.MB_1.value),
        /**
         *
         */
        MB_3(3 * FILE_SIZE_BYTE.MB_1.value),
        /**
         *
         */
        MB_4(4 * FILE_SIZE_BYTE.MB_1.value),
        /**
         *
         */
        MB_5(5 * FILE_SIZE_BYTE.MB_1.value),
        /**
         *
         */
        MB_10(10 * FILE_SIZE_BYTE.MB_1.value),
        /**
         *
         */
        GB_1(1024 * FILE_SIZE_BYTE.MB_1.value);

        /**
         *
         */
        public final long value;

        private FILE_SIZE_BYTE(long value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum MEDIA_TYPE {

        /**
         *
         */
        IMAGE("Image"),
        /**
         *
         */
        VIDEO("Video");

        /**
         *
         */
        public final String value;

        private MEDIA_TYPE(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum ROLES {

        /**
         *
         */
        ADMIN("Admin"), USER("User"), SYSTEM("System");

        /**
         *
         */
        public final String value;

        private ROLES(String value) {
            this.value = value;
        }
    }

    /**
     *
     */
    public enum REPORT_CONG_TYPE {

        /**
         *
         */

       
        PYRAMID("PYRAMID"), FUNNEL("FUNNEL"), FILTER("FILTER"), LINE("LINE"), PIE("PIE"), SQL("SQL"), BAR("BAR"), DONUTS("DONUTS"), SNMP("SNMP"), SPEEDO("SPEEDO");


        /**
         *
         */
        public final String value;

        private REPORT_CONG_TYPE(String value) {
            this.value = value;
        }
    }

    public enum BILL_ENTITY_TYPE {

        BILL_PAYEMENT_METHOD("bill_payment_method"), BILL_SETUP_FEE("bill_setup_fee"), BILL_IDENTITY_DOC("bill_identity_doc"), BILL_PLAN("bill_plan"), BILL_PACKAGE("bill_package");

        public final String value;

        private BILL_ENTITY_TYPE(String value) {
            this.value = value;
        }
    }

    public enum REFERENCE_LIST_NAME {

        /**
         *
         */
        BILL_ENTITY("bill_entity");

        /**
         *
         */
        public final String value;

        private REFERENCE_LIST_NAME(String value) {
            this.value = value;
        }
    }

    public enum CATEGORY_TYPE {

        CATEGORY("Category"), NATIONALITY("Nationality"), AGE_GROUP("Age Group"), GENDER("Gender");
        
        public final String value;

        private CATEGORY_TYPE(String value) {
            this.value = value;
        }
    }

    public enum ON_OFF {

        ON("on"), OFF("off");
        ;

        public final String value;

        private ON_OFF(String value) {
            this.value = value;
        }
    }

    public enum BAND_WIDTH {

        MBPS("mbps"), KBPS("kbps");

        public final String value;

        private BAND_WIDTH(String value) {
            this.value = value;
        }
    }

    public enum BAND_WIDTH_VALUE {

        GB("1024"), MBPS("1");

        public final String value;

        private BAND_WIDTH_VALUE(String value) {
            this.value = value;
        }
    }

    public enum RENEWAL_MONTH_VALUE {


          One("1"),Two("2"),Three("3"),Four("4"),Five("5"),Six("6"),Seven("7"),Eight("8"),Nine("9"),Ten("10"),Eleven("11"),Twelve("12");       


        public final String value;

        private RENEWAL_MONTH_VALUE(String value) {
            this.value = value;
        }
    }

    public enum DOC_TYPE {

        Identity("Identity"), Address("Address");
        ;

        public final String value;

        private DOC_TYPE(String value) {
            this.value = value;
        }
    }

    public enum CAMPAIGN_TYPE {

        LOC("Location Based"), LOC_CAT("Location/Category"), CAT("Category Based"), ON_BROWSING("On Browsing"),;

        public final String value;
        private CAMPAIGN_TYPE(String value) {
            this.value = value;
        }
    }

    public enum SMS_FREQUENCY {

        WEEKLY("Weekly"), MONTHLY("Monthly"), Daily("Daily"), Once("Once");
        public final String value;
        private SMS_FREQUENCY(String value) {
            this.value = value;
        }
    }


    public enum GENDER {

        M("Male"), F("Female");
        

        public final String value;

        private GENDER(String value) {
            this.value = value;
        }
    }

    public enum ACCESS_TYPE {

        POSTPAID("0"), PREPAID("1");

        public final String value;

        private ACCESS_TYPE(String value) {
            this.value = value;
        }
    }

    public enum INVOICE_TYPE {

        SETUP_FEE("0"), PREPAID_INVOICE("1"), POSTPAID_INVOICE("2");

        public final String value;

        private INVOICE_TYPE(String value) {
            this.value = value;
        }
    }

    public enum RADIO_LIST {

        Activate("A"), Reject("R"), Edit("E"), Print("P");

        public final String value;

        private RADIO_LIST(String value) {
            this.value = value;
        }
    }

    public enum VOLUME_ACTION {

        Throttle("change"), Logout("logout");

        public final String value;

        private VOLUME_ACTION(String value) {
            this.value = value;
        }
    }
    // public static final String SUBSCRIBER_PREFIX = "CUST";
    public static final String INVOICE_PREFIX = "INVC";
    public static final String PAYMENT_PREFIX = "PAYM";
    public static final String TXN_PREFIX = "TXN";
    public static final String ADVERTISER_AUTHORITY = "Advertiser";

    public enum INVOICE_REMARKS {

        INVOICE("INVOICE"), PLAN_RENEWAL("PLAN_RENEWAL"), PLAN_CHANGE("PLAN_CHANGE"),
        PLAN_CHANGE_REFUND("PLAN_CHANGE_REFUND"), ALREADY_BILLED("ALREADY_BILLED"),
        ERROR_MULTI_PLAN("ERROR_MULTI_PLAN"), SETUP_FEE("SETUP-FEE"),
        REGISTRATION_AMOUNT("REGISTRATION_AMOUNT"),TOPUP("TOPUP"),CUSTOMER_REJECT_REFUND("CUSTOMER_REJECT_REFUND");
        

        public final String value;

        private INVOICE_REMARKS(String value) {
            this.value = value;
        }
    }

    public enum CUSTOMER_ACCESS_LAVEL {

        NONE("None"), FULL("Full"), LIMITED("Limited");

        public final String value;

        private CUSTOMER_ACCESS_LAVEL(String value) {
            this.value = value;
        }
    }

    public enum EMAIL_SERVICE_REF_DOC {

        FORGOT_PASSWORD("FORGOT_PASSWORD"), CHANGE_CUSTOMER_EMAIL_TEMPLATE("CHANGE_CUSTOMER_EMAIL_TEMPLATE");

        public final String value;

        private EMAIL_SERVICE_REF_DOC(String value) {
            this.value = value;
        }
    }
    
    //Created By Yaseen
    public enum PAGE_CODE {
        PAGE1("P1"),  PAGE2("P2"),PAGE3("P3");
        public final String value;
        private PAGE_CODE(String value) {
            this.value = value;
        }
    }
    
    public enum PAGE_VALUE {
        PAGE1("Landing Page"),  PAGE2("Register Profile Page"),PAGE3("Session Start Page");
        public final String value;
        private PAGE_VALUE(String value) {
            this.value = value;
        }
    }
    
     public enum INVENTRY_SPACE_CODE {
         SPACE1("S1"), SPACE2("S2"), SPACE3("S3"), SPACE4("S4");
        public final String value;
        private INVENTRY_SPACE_CODE(String value) {
            this.value = value;
        }
    }
    
    public enum INVENTRY_SPACE_VALUE {
        ADINVENTRY_SPACE1("Header Banner"), ADINVENTRY_SPACE2("Middle Banner"),
        ADINVENTRY_SPACE3("Bottom Left Banner"), ADINVENTRY_SPACE4("Bottom Right Banner");
        public final String value;
        private INVENTRY_SPACE_VALUE(String value) {
            this.value = value;
        }
    }

    //End
    public static final String OFF_STATUS_INACTIVE = "INACTIVE";
    public static final String OFF_STATUS_ACTIVE = "ACTIVE";
    public static char STATUS_YES = 'Y';
    public static char STATUS_NO = 'N';
    public static final String USER_NAME = "Username";
    public static char STATUS_ACTIVE = 'A';
    public static char STATUS_IN_ACTIVE = 'I';
    public static String TABLE_PREFIX = "LI_LOG";
    public static final int PAGING_SIZE_LARGE = 2000000;
    public static final int PAGING_SIZE_MEDIUM = 2000000;

    public static final String USER_DEFAULT_STATUS_ACTIVE = "Active";
    public static final String USER_STATUS_INACTIVE = "In Active";
    public static final String ACCESS_TYPE_BUSINESS = "Business";
    public static final String ACCESS_TYPE_WIFI = "WiFi";
    public static final String USER_TYPE_STORED = "Stored Value";
    public static final String USER_TYPE_FIXED = "Fixed Value";
    public static final String USER_TYPE_FIXED_VOLUME = "Fixed  Volume Fair Used";
    public static final String BATCH_TYPE_Omantel = "Omantel Subscriber";
    public static final String BATCH_TYPE_PREPAID = "Prepaid";
    public static final String BATCH_TYPE_POSTPAID = "Postpaid";
    public static final float OCT_TO_MB_DENOMINATOR = 1024 * 1024;
    public static final float OCT_TO_GB_DENOMINATOR = 1024 * 1024 * 1024;

    public static final float MAX_HEIGHT_STATISCTIC_REPORT = 210;
    public static final String[] COLOR_LIST = {"#FF4A4A", "#22FF22"};
    /**
     * Red,Green
     */
    public static final String ACTIVE_STATUS = "A";
    public static final String IN_ACTIVE_STATUS = "I";
    public static final String SUPER_ADMIN = "Omantel";
    public static final String ADMIN = "Admin";
    public static final String HOTSPOT_TRA = "Hotspot TRA";
    public static final String HOTSPOT_DESIGNER = "Hotspot Designer";
    public static final String CYBERCAFE_TRA = "Cybercafe TRA";
    public static final String OFFLOAD_TRA = "Offload TRA";
    public static final String OFFLOAD_HELPDESK = "Offload Helpdesk";
    public static final String OFFLOAD_ADMIN = "Offload Admin";
    public static final String CYBERCAFE_SUP_ADMIN = "Cybercafe Super Admin";
    public static final String HOTSPOT_SUP_ADMIN = "Hotspot Super Admin";
    public static final String OFFLOAD_SUP_ADMIN = "Offload Super Admin";
    public static final String HELPDESK = "Help Desk";
    public static final String ISS = "ISS";
    public static final String ENGLISH_LANG = "English";
    public static final String ARABIC_LANG = "Arabic";
    public static final String BUSINESS_OWNER_Omantel = "Omantel";
    public static final String ADD = "Add";
    public static final String UPDATE = "Update";
    public static final String DELETE = "Delete";
    public static final String USER_DELETE_STATUS = "X";
    public static final String USER_ACTIVE_STATUS = "A";
    public static final char USER_ACTIVE_STATUS_CHAR = 'A';
    public static final String USER_BLOCKED_STATUS = "Y";
    public static final String ADD_UNALLOCATE_BATCH_STATUS = "P";
    public static final String ADD_BATCH_TLV = "0";
    public static final String BATCH_STATUS_PENDING = "Pending";
    public static final String ADD_BATCH_CREATED_TYPE = "Omantel";
    public static final String BATCH_STATUS_DONE = "Done";
    public static final String PLAN_STATUS_EXPIRED = "Expired";
    public static final String UAM_ACCESS_STATUS_A = "A";
    public static final String UAM_ACCESS_STATUS_I = "I";
    public static final String UAM_ACCESS_STATUS_ACTIVE = "Active";
    public static final String UAM_ACCESS_STATUS_INACTIVE = "In Active";
    public static final String MESSAGE_PROCESSED = "Processed";
    public static final String MESSAGE__NOT_PROCESSED = "Not Processed";
    public static final String MESSAGE_ERROR = "Error";
    public static final String MESSAGE_ERROR_STATUS = "E";
    public static final String FILE_EXT_TYPE_JPG = "JPG";
    public static final String FILE_EXT_TYPE_JPEG = "JPEG";
    public static final String FILE_EXT_TYPE_GIF = "GIF";
    public static final String FILE_EXT_TYPE_PNG = "PNG";
    public static final String FILE_EXT_TYPE_PJPEG = "PJPEG";
    public static final String FILE_EXT_TYPE_X_JPG = "X-JPG";
    public static final String NA = "NA";
    public static final String WIFI_USER_NOT_BLOCK_STATUS = "N";
    public static final String SUPER_ADMIN_VALUE = "1";
    public static final String PAGINATION_LIST = "paginationList";

    public static final String USER_TYPE_STORED_VOLUME = "Stored Volume";
    public static String MAIL_SMTP_HOST = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.smtp.host");
    public static String MAIL_SMTP_HOST_NAME = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.smtp.host.ip");
    public static String MAIL_SENDER_EMAIL = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.sender");
    public static String MAIL_AUTH_USERNAME = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.auth.username");
    public static String MAIL_AUTH_PASSWORD = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.auth.password");
    public static String MAIL_DEFAULT_RECIPIENT_CC = new PropertyEncoder(ResourceBundleUtil.getResourceBundle("mail")).getString("mail.default.recipients.cc");
    public static final String ENGLISH_LANG_STATUS = "E";
    public static final String ARABIC_LANG_STATUS = "A";

    public static final String REPLACE_AT_THE_RATE = "@";
    public static final String REPLACE_AT_THE_RATE_HTML_ENTITY = "&#064;";
    public static final String ACCCESS_TYPE_3G = "3G Offloading";
    public static final String BATCH_TYPE_3G = "3G";
    public static final String REPLACE_UNDER_SCORE = "_";
    public static final String LOCATION_ID = "Location Id";
    public static final String LOCATION_ID_VLAN = "Location Id(VLAN)";
    public static final String LOCATION_NAME = "Location Name";
    public static final String OWNER_NAME = "Owner Name";
    public static final String ICMP_PROTOCOL = "ICMP";
    public static final String TCP_PROTOCOL = "TCP";
    public static final String UDP_PROTOCOL = "UDP";
    public static final String PACKAGE_NAME = "Package Name";
    public static final String SUBSCRIPTION_TYPE = "Subscription Type";
    public static final String PAYMENT_TYPE = "Payment Type";
    public static final String MSISDN = "Msisdn";
    public static final int BATCH_TYPE_CYBER_CAFE_FIXED = 10;
    public static final int DOWNLOAD_10000_LI_LOG_RECORD = 1000;
    public static final int DOWNLOAD_100_LI_LOG_RECORD = 500;
    public static final String BILING_TYPE_PREPAID = "PREPAID";
    public static final String BILING_TYPE_POSTPAID = "POSTPAID";
    public static final int ACCESS_TYPE_POSTPAID = 1;
    public static final int BATCH_TYPE_EXCEPT_VOUCHER = 0;
    public static final int BATCH_TYPE_EXCEPT_VOUCHERLESS = 8;
    public static final int BATCH_TYPE_EXCEPT_OLDOmantelPLAN = 9;
    public static final int USER_TYPE_FIXED_FOR_VOUCHERLESS = 1;
    public static final String RPT_TYPE_EXPIRED_CODE = "E";
    public static final String RPT_TYPE_EXPIRED_VALUE = "Expired User";
    public static final String RPT_TYPE_ACTIVE_CODE = "A";
    public static final String RPT_TYPE_ACTIVE_VALUE = "Active User";

    public static enum PLAN_TYPE {

        PLAN_TYPE_VOUCHER(0), PLAN_TYPE_SINGLE_USER(1), PLAN_TYPE_WIMAX_ACCOUNT_BALANC(2),
        PLAN_TYPE_MOUSBAK(3), PLAN_TYPE_PREPAID(4), PLAN_TYPE_FREE_HOUR(5), PLAN_TYPE_POSTPAID(6),
        PLAN_TYPE_CHARGE_WIMAX_BILL(7), PLAN_TYPE_VOUCHER_LESS(8), PLAN_TYPE_OLD_PLAN(9);
        public final int value;

        private PLAN_TYPE(int value) {
            this.value = value;
        }
    }

    public static enum USER_TYPE {

        STORED_VALUE(0), FIXED_VALUE(1), STORED_VOLUME(2), FIXED_VOLUME_FAILR_USE(3), UNLIMITED(4);
        public final int value;

        private USER_TYPE(int value) {
            this.value = value;
        }
    }
    public static final String SUPER_CYBERCAFE_ADMIN = "Cybercafe Super Admin";
    public static final String CYBERCAFE_ADMIN = "Cybercafe Admin";
    public static final String CYBERCAFE_HELPDESK = "Cybercafe Helpdesk";
    public static final String SUPER_HOTSPOT_ADMIN = "Hotspot Super Admin";
    public static final String HOTSPOT_ADMIN = "Hotspot Admin";
    public static final String HOTSPOT_HELPDESK = "Hotspot Helpdesk";
    public static final String SUPER_OFFLOAD_ADMIN = "Offload Super Admin";
    public static final String SUPER_HELPDESK = "Offload Helpdesk";

    public static enum TEMPLATE_TYPE_CODE {

        CY, DY, FX, OF, OM
    }


    

    /**
     *
     * @param argv
     */
    public static void main(String argv[]) {

    }
}
