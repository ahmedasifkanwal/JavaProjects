/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.common.helper;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Date helper class to Manipulate dates
 *
 * @author Saleem Javed
 */
public class DateHelper {

    public static int getCurrentHours() {
        Calendar currentDate = Calendar.getInstance();
        return currentDate.get(Calendar.HOUR_OF_DAY);

    }

    public static Date getFormatString(String date) {
        try {
            SimpleDateFormat MMddyyyy = new SimpleDateFormat("MM-dd-yyyy");
            return MMddyyyy.parse(date);
        } catch (Exception ex) {
            
        }
        return null;
    }

    public static int getCurrentYear() {
        Calendar currentDate = Calendar.getInstance();
        return currentDate.get(Calendar.YEAR);

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

    public static boolean isGreaterToCurrentDate(Date toDate) {
        try {
            if (toDate != null) {

                if (toDate.compareTo(getCurrentDate()) > 0) {
                    return true;
                }
            }
        } catch (Exception ex) {

            return false;
        }
        return false;
    }

    public static java.util.Date getCurrentDate() {
        Calendar calendar = Calendar.getInstance();
        return calendar.getTime();
    }

    public static int getNoOfDays(Date fromDate, Date toDate) {
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

    public static java.util.Date getDateAfterDays(int days) {

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, days);
        return c.getTime();
    }

    public static java.util.Date getDateAfterMonth(int months) {

        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, months);
        return c.getTime();
    }
}
