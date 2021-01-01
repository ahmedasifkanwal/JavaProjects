/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Date helper class to Manipulate dates
 *
 * @author Saleem Javed
 */
public class DateHelper {
    public static SimpleDateFormat yyyyMMddhhmmssFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
    public static final SimpleDateFormat TIME_FORMAT_H_MM_AMPM = new SimpleDateFormat("h:mm a");
    public static final String SQL_BACKUP_FORMAT_LI_TABLE = "_yyyy_MMM_dd";
    public static final String SQL_BACKUP_FORMAT_SESSION_LOG_TABLE = "_MM_yyyy";
    public static SimpleDateFormat BACKUP_TABLE_SESSION_Format = new SimpleDateFormat(SQL_BACKUP_FORMAT_SESSION_LOG_TABLE);
    public static SimpleDateFormat BACKUP_TABLE_yyyy_MMM_ddFormat = new SimpleDateFormat(SQL_BACKUP_FORMAT_LI_TABLE);
    public static SimpleDateFormat SMS_DATE_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static SimpleDateFormat EEEdMMMyyyyHHmmssZ = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
     public static SimpleDateFormat dd_MMM_yyyy_FORMAT = new SimpleDateFormat("dd-MMM-yyyy");
    
    
//2017-08-21 13:33:41.0"
    /**
     * getCurrentDate
     *
     * @return current date
     */
    public static java.util.Date getCurrentDate() {
        Calendar calendar = Calendar.getInstance();
        return calendar.getTime();
    }
    public static String[] MONTH_NAME = {"January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"};
    static final Logger logger = Logger.getLogger(DateHelper.class.getName());
    public static final String DATETIME_FORMAT_yyyy_MM_dd_HHmmss = "yyyy_MM_dd_HHmmss";
    /**
     * Date format from UI components
     */
    public static SimpleDateFormat INPUT_DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
    /**
     * Date Time format from UI components
     */
    public static SimpleDateFormat INPUT_DATETIME_FORMAT = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    /**
     * Date time format stored in DB
     */
    public static SimpleDateFormat DB_DATETIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static SimpleDateFormat DB_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    /**
     * Time format in 24 Hours Format:HH:mm:ss
     */

    public static SimpleDateFormat TIME_FORMAT_HH_MM_SS = new SimpleDateFormat("HH:mm:ss");
    public static SimpleDateFormat TIME_FORMAT_MINUTES = new SimpleDateFormat("mm");

    public static SimpleDateFormat DATE_FORMAT_ddMMyy = new SimpleDateFormat("ddMMyy");
    public static SimpleDateFormat DATE_FORMAT_MMM = new SimpleDateFormat("MMM");
    public static SimpleDateFormat DATE_FORMAT_MM = new SimpleDateFormat("MM");
    public static SimpleDateFormat DATE_FORMAT_YYYY = new SimpleDateFormat("yyyy");
    /**
     * Date format to display in UI Tables
     */
    public static SimpleDateFormat DATE_FORMAT_DISPLAY = new SimpleDateFormat("dd-MM-yyyy");
    /**
     * Date time format to display in UI Tables
     */
    public static final String DATETIME_FORMAT_DISPLAY = "{0,date,dd-MM-yyyy  HH:mm:ss}";

    /**
     * To find current time in HH:mm:ss format
     *
     * @return
     */
    public static String getCurrentTime() {
        return TIME_FORMAT_HH_MM_SS.format(new Date());
    }

    public static String getCurrentYYMMDD() {
        return DATE_FORMAT_ddMMyy.format(new Date());
    }

    static DateFormat dfm = new SimpleDateFormat("yyyyMMddHHmm");
    static long unixtime;

    /**
     * Check the date is greater than current date.
     *
     * @param fromDt
     * @param toDt
     * @return true
     */
    public static boolean isFromGreaterToDate(String fromDt, String toDt) {
        try {

            Date fromDate = DateHelper.INPUT_DATETIME_FORMAT.parse(fromDt + " " + DateHelper.getCurrentTime());
            Date toDate = DateHelper.INPUT_DATETIME_FORMAT.parse(toDt + " " + DateHelper.getCurrentTime());

            if (toDate != null) {
                logger.log(Level.INFO, " To date:{0} from date {1}", new Object[]{toDate, fromDate});
                if (fromDate.compareTo(toDate) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
            return false;
        }
        return false;

    }

    public static boolean isBillingDateGreaterToRegDateDate(Date billingDate, Date regDate) {
        try {

            if (billingDate != null) {
                logger.log(Level.INFO, " To billingDate date:{0} from regDate date {1}", new Object[]{billingDate, regDate});
                if (billingDate.compareTo(regDate) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
            return false;
        }
        return true;

    }

    public static boolean isFromGreaterToDate(Date fromDate, Date toDate) {
        try {

            if (toDate != null) {
                logger.log(Level.INFO, " To date:{0} from date {1}", new Object[]{toDate, fromDate});
                if (fromDate.compareTo(toDate) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
            return false;
        }
        return false;

    }

    /**
     * Check the date is greater than current date.
     *
     * @param toDate
     * @return true
     */
    public static boolean isGreaterToCurrentDate(Date toDate) {
        try {
            if (toDate != null) {
                logger.log(Level.INFO, " To date:{0} from date {1}", new Object[]{toDate, getCurrentDate()});
                if (toDate.compareTo(getCurrentDate()) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
            return false;
        }
        return false;

    }

    public static boolean isGreaterEqualToCurrentDate(Date toDate) {
        try {
            if (toDate != null) {
                logger.log(Level.INFO, " To date:{0} from date {1}", new Object[]{toDate, getCurrentDate()});
                if (toDate.compareTo(getCurrentDate()) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
            return false;
        }
        return false;

    }

    /**
     * Date Type
     */
    public enum DATE_TYPE {

        /**
         * Time for start time
         */
        BEGIN(" 00:00:00"),
        /**
         * Time for end time
         */
        END(" 23:59:59");
        /**
         * Getting the value
         */
        public final String value;

        private DATE_TYPE(String value) {
            this.value = value;
        }
    }

    public static String getSearchFormated(String dateInput, String dtType) {

        String dateTime = null;
        try {
            if (!StringHelper.isNullOrEmpty(dateInput)) {

                dateTime = DateHelper.DB_DATETIME_FORMAT.format(DateHelper.INPUT_DATETIME_FORMAT.parse(dateInput + dtType));
            }
        } catch (Exception ex) {

            logger.log(Level.SEVERE, ex.getMessage());
        }
        return dateTime;
    }

    /**
     * Date format for Search parameters
     *
     * @param dateInput
     * @param dtType
     * @return
     */
    public static String getSearchFormated(String dateInput, DATE_TYPE dtType) {

        String dateTime = null;
        try {
            if (!StringHelper.isNullOrEmpty(dateInput)) {

                dateTime = DateHelper.DB_DATETIME_FORMAT.format(DateHelper.INPUT_DATETIME_FORMAT.parse(dateInput + dtType.value));
            }
        } catch (Exception ex) {

            logger.log(Level.SEVERE, ex.getMessage());
        }
        return dateTime;
    }

    /**
     * Get previous month
     */
    public static String gePreviousMonthDate(int ellapeMonth) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -ellapeMonth * (calendar.getActualMaximum(Calendar.DAY_OF_MONTH)));
        Date currentDate = calendar.getTime();

        try {
            return INPUT_DATE_FORMAT.format(currentDate);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
        }
        return null;
    }

    public static String gePreviousDayDate(int ellapeDay) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -ellapeDay);

        Date currentDate = calendar.getTime();

        try {
            return INPUT_DATE_FORMAT.format(currentDate);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, ex.getMessage());
        }
        return null;
    }

    /**
     * Get Previous date by month
     */
    public enum PREVIOUS_DATE_BY_MONTH {

        CURRENT_DATE(0),
        /**
         * Start date from last 1 month
         */
        START_LAST_1_MONTH(1),
        /**
         * Start date from last 2 month
         */
        START_LAST_2_MONTH(2),
        /**
         * Start date from last 3 month
         */
        START_LAST_3_MONTH(3),
        END_DATE(0);
        /**
         * Getting the value
         */
        public final String value;

        private PREVIOUS_DATE_BY_MONTH(int month) {
            this.value = gePreviousMonthDate(month);
        }
    }

    public static int getCurrentHours() {
        Calendar currentDate = Calendar.getInstance();
        return currentDate.get(Calendar.HOUR_OF_DAY);

    }

    public static Date INPUT_DATETIME_FORMAT(String dateddMMyyyyHHmmssFormat) throws ParseException {
        return DateHelper.INPUT_DATETIME_FORMAT.parse(dateddMMyyyyHHmmssFormat + " " + DateHelper.getCurrentTime());

    }

    public static Date INPUT_DATETIME_FORMAT_DAY_END(String dateddMMyyyyHHmmssFormat) throws ParseException {
        return DateHelper.addDayHourMinuteSecond(DateHelper.INPUT_DATETIME_FORMAT.parse(dateddMMyyyyHHmmssFormat + " " + DateHelper.getCurrentTime()), 0, 23, 59, 59, 999);
    }

    public static Date getLastDateOfTheMonth(int ciphir) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -ciphir * (calendar.getActualMaximum(Calendar.DAY_OF_MONTH)));
        calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date currentDate = calendar.getTime();
        return currentDate;
    }

    public static int getNoOfDay(Date fromDate, Date toDate) {
        Date aDate = fromDate;
        Date bDate = toDate;
        Calendar with = Calendar.getInstance();
        with.setTime(aDate);
        Calendar to = Calendar.getInstance();
        to.setTime(bDate);
        to.set(Calendar.YEAR, with.get(Calendar.YEAR));
        int withDAY = with.get(Calendar.DAY_OF_YEAR);
        int toDAY = to.get(Calendar.DAY_OF_YEAR);
        return (toDAY - withDAY);

    }

    public static int getNoOfDay(Date mydate) {

        Calendar with = Calendar.getInstance();
        with.setTime(mydate);
        int numberOfDays = with.getActualMaximum(Calendar.DAY_OF_MONTH);
        return numberOfDays;

    }

    public static int getCurrentMinute() {

        Calendar with = Calendar.getInstance();
        with.setTime(new Date());
        int numberOfDays = with.get(Calendar.MINUTE);
        return numberOfDays;

    }

    public static Date addHourMinuteSecond(Date fromDate, int hour, int minute, int second, int millisecond) {
        Date dateBefore = null;
        try {
            // timestamp now
            Calendar cal = Calendar.getInstance();       // get calendar instance
            cal.setTime(fromDate);                           // set cal to date
            cal.set(Calendar.HOUR_OF_DAY, hour);            // set hour to midnight
            cal.set(Calendar.MINUTE, minute);                 // set minute in hour
            cal.set(Calendar.SECOND, second);                 // set second in minute
            cal.set(Calendar.MILLISECOND, millisecond);            // set millis in second
            dateBefore = cal.getTime();
            logger.info("Date in addHourMinuteSecond:" + dateBefore);
        } catch (Exception ex) {
            logger.severe("addHourMinuteSecond:" + ex.getMessage());
        }
        return dateBefore;
    }

    public static Date addDayHourMinuteSecond(Date fromDate, int day, int hour, int minute, int second, int millisecond) {
        Date dateBefore = null;
        try {
            // timestamp now
            Calendar cal = Calendar.getInstance();       // get calendar instance
            cal.setTime(fromDate);                           // set cal to date
            cal.add(Calendar.DATE, day);
            cal.set(Calendar.HOUR_OF_DAY, hour);            // set hour to midnight
            cal.set(Calendar.MINUTE, minute);                 // set minute in hour
            cal.set(Calendar.SECOND, second);                 // set second in minute
            cal.set(Calendar.MILLISECOND, millisecond);            // set millis in second
            dateBefore = cal.getTime();
            logger.info("Date in addHourMinuteSecond:" + dateBefore);
        } catch (Exception ex) {
            logger.severe("addHourMinuteSecond:" + ex.getMessage());
        }
        return dateBefore;
    }

    public static Date getLastDayOfMonth() {
        Date lastDayOfMonth = null;
        Date today = new Date();
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);
            calendar.add(Calendar.MONTH, 1);
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            calendar.add(Calendar.DATE, -1);
            calendar.set(Calendar.HOUR_OF_DAY, 23);            // set hour to midnight
            calendar.set(Calendar.MINUTE, 59);                 // set minute in hour
            calendar.set(Calendar.SECOND, 59);                 // set second in minute
            calendar.set(Calendar.MILLISECOND, 999);
            lastDayOfMonth = calendar.getTime();
        } catch (Exception ex) {
            logger.severe("Sever Error in Date Parsing:" + ex.getMessage());
        }

        return lastDayOfMonth;
    }

    public static Date getLastDayOfMonth(Date today) {
        Date lastDayOfMonth = null;
        // Date today = new Date();
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);
            calendar.add(Calendar.MONTH, 1);
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            calendar.add(Calendar.DATE, -1);
            calendar.set(Calendar.HOUR_OF_DAY, 23);            // set hour to midnight
            calendar.set(Calendar.MINUTE, 59);                 // set minute in hour
            calendar.set(Calendar.SECOND, 59);                 // set second in minute
            calendar.set(Calendar.MILLISECOND, 999);
            lastDayOfMonth = calendar.getTime();
        } catch (Exception ex) {
            logger.severe("Sever Error in Date Parsing:" + ex.getMessage());
        }

        return lastDayOfMonth;
    }

    public static int getFirstDayOfMonth() {
        Integer firstDayOfMonth = null;
        Date today = new Date();
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);
            firstDayOfMonth = calendar.get(calendar.DAY_OF_MONTH);
        } catch (Exception ex) {
            logger.severe("Sever Error in Date Parsing:" + ex.getMessage());
        }
        return firstDayOfMonth;
    }

    public static Date getBillInvoiceGenerateDate(Date today, int days) {
        Date lastDayOfMonth = new Date();
        //Date today = new Date();
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(today);
            calendar.add(Calendar.DATE, days);
            calendar.set(Calendar.HOUR_OF_DAY, 23);            // set hour to midnight
            calendar.set(Calendar.MINUTE, 59);                 // set minute in hour
            calendar.set(Calendar.SECOND, 59);                 // set second in minute
            calendar.set(Calendar.MILLISECOND, 999);
            lastDayOfMonth = calendar.getTime();
        } catch (Exception ex) {
            logger.severe("Sever Error in Date Parsing:" + ex.getMessage());
        }
        return lastDayOfMonth;
    }
    public static SimpleDateFormat ddMMyyyyFormat = new SimpleDateFormat("dd-MM-yyyy");

     public static SimpleDateFormat ddMMyyyyFormatNew = new SimpleDateFormat("ddMMyyyyhhmmssSSS");
     public static SimpleDateFormat MMMddYYhhmmssSSSFormat = new SimpleDateFormat("MMM_dd_yyyy_hhmmssSSS");
    /**
     *
     * @param argv
     * @throws ParseException
     */
    public static Date INPUT_DATE_FORMAT(String dateddMMyyyyHHmmssFormat) throws ParseException {
        return DateHelper.INPUT_DATE_FORMAT.parse(dateddMMyyyyHHmmssFormat);

    }

    public static long timeConversion(Date time) throws Exception {
        dfm.setTimeZone(TimeZone.getTimeZone("GMT+4:00"));//Specify your timezone 
        try {
            unixtime = time.getTime();
            unixtime = unixtime / 1000;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        return unixtime;
    }

    public static boolean isTodateGreaterEqualsFromdate(String fromDate, String toDate) {

        try {

            if (!StringHelper.isNullOrEmpty(fromDate) && !StringHelper.isNullOrEmpty(toDate)) {
                Date from = new Date();
                Date to = new Date();
                from = INPUT_DATETIME_FORMAT.parse(fromDate);
                to = INPUT_DATETIME_FORMAT.parse(toDate);
                logger.info("todate:" + to);
                logger.info("fromDate:" + from);
                logger.info("to.compareTo(from):" + to.compareTo(from));
                if (to.compareTo(from) >= 0) {
                    return true;
                }

            }
        } catch (Exception ex) {
            return false;
        }
        return false;

    }
    public static String DefaultEndDate() {
        Date currentDate = new Date();
        String dateString = null;
        try {
            dateString = ddMMyyyyFormat.format(currentDate);
        } catch (Exception ex) {
        }
        return dateString;
    }
    public static int getNoOfDaysInDateRange(String daterange) throws ParseException {
        int noOfday = 0;
        String[] dd = daterange.split(" to ");
        String fromDate = DateHelper.getSearchFormated(dd[0], DateHelper.DATE_TYPE.BEGIN);
        Date from = DateHelper.DB_DATETIME_FORMAT.parse(fromDate);
        String toDate = DateHelper.getSearchFormated(dd[1], DateHelper.DATE_TYPE.END);
        Date to = DateHelper.DB_DATETIME_FORMAT.parse(toDate);
        noOfday = Math.round((to.getTime() - from.getTime()) / 86400000);
        //Set only gateway wise VLAN;
//01-06-2015 to 07-07-2015
        return noOfday;
    }

    public static void main(String argv[]) throws ParseException {
        int day = DateHelper.getNoOfDaysInDateRange("07-06-2015 to 07-07-2015");
        Date dt = new Date();

        String time = TIME_FORMAT_H_MM_AMPM.format(dt);

        String dt2 = TIME_FORMAT_HH_MM_SS.format(TIME_FORMAT_H_MM_AMPM.parse(time));

        // END(" 23:59:59");
        // 2015-04-15 13:30:52.0
        //  2015-04-15 13:24:01.0
        //  2015-04-15 13:23:07.0
        //  2015-04-15 13:22:42.0
        // 2015-03-14 13:30:54.0
        String start = "2015-03-14 13:30:54.0";
        Date dstrat = DateHelper.DB_DATETIME_FORMAT.parse(start);
        String end = "2015-04-15 13:30:52.0";
        Date dtend = DateHelper.DB_DATETIME_FORMAT.parse(end);

        long diff = dtend.getTime() - dstrat.getTime();
        long diffSeconds = diff / 1000;
        long diffMinutes = diffSeconds / (60);
        long diffHours = diffMinutes / (60 * 60);

        long hours = 0, minute = 0, second = 0;
        if (diffSeconds > 3600) {
            hours = diffSeconds / 3600;
            long Rem = diffSeconds % 3600;
            if (Rem > 60) {
                minute = Rem / 60;
                second = Rem % 60;
            }

        } else if (diffSeconds > 60) {

            if (diffSeconds > 60) {
                minute = diffSeconds / 60;
                second = diffSeconds % 60;
            }

        } else if (diffSeconds < 60) {
            second = diffSeconds;
        }

        String Diif = hours + " Hours " + minute + " Minutes " + second + " Seconds";

    }
    
    
     public static String FILENAMERANDOM() {
        Calendar calendar = Calendar.getInstance();

        Date currentDate = calendar.getTime();
        String dateString = null;
        try {
            SimpleDateFormat MMMddYYhhmmssSSSFormat = new SimpleDateFormat("MMM_dd_yyyy_hhmmssSSS");
            dateString = MMMddYYhhmmssSSSFormat.format(currentDate);
        } catch (Exception ex) {
        }
        return dateString;
    }
     
     
    public static String todayDateFormatMMMddYYhhmmssSSS() {
        Date currentDate = new Date();
        String dateString = null;
        try {
            dateString = MMMddYYhhmmssSSSFormat.format(currentDate);
        } catch (Exception ex) {
             logger.info("todayDateFormatddMMyyyy:" + ex.getMessage());
        }
        return dateString;
    }

    public static Date addNoOfDays(Date fromDate, int days) {
        Date dateBefore = fromDate;
        try {

            GregorianCalendar gc = new GregorianCalendar();
            gc.setTime(fromDate);
            gc.add(GregorianCalendar.DAY_OF_YEAR, days);
            dateBefore = gc.getTime();
            logger.info("Add Day:" + fromDate);
            logger.info("dateBefore:" + dateBefore);

        } catch (Exception ex) {
            logger.severe("substractDay:" + ex.getMessage());
        }
        return dateBefore;
    }
}
