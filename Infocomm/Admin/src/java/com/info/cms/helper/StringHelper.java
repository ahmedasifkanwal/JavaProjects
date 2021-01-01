/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

import static com.info.cms.facade.ReferenceData.getNationality;
import com.info.wifi.cms.entity.Country;
import java.beans.XMLEncoder;
import java.io.ByteArrayOutputStream;
import java.text.ParseException;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author software1
 */
public class StringHelper {

    /**
     *
     * @param stringToVerify
     * @return
     */
    public static boolean isNullOrEmpty(String stringToVerify) {
        if (stringToVerify == null) {
            return true;
        }
        if (stringToVerify.trim().equals("")) {
            return true;
        }

        return stringToVerify.trim().length() < 1;
    }

    /**
     *
     * @param numberString
     * @return
     */
    public static boolean isNumber(String numberString) {
        boolean result = true;
        if (isNullOrEmpty(numberString)) {
            return false;
        }

        try {
            Long val = Long.parseLong(numberString);

        } catch (Exception ex) {
            result = false;
        }

        return result;

    }

    /**
     *
     * @param email
     * @return
     */
    public static boolean isValidEmail(final String email) {
        Pattern pattern;
        Matcher matcher;
        String EMAIL_PATTERN = UIConstants.REGULAR_EXP.EMAIL_EXP.value;
        pattern = Pattern.compile(EMAIL_PATTERN);
        matcher = pattern.matcher(email);
        return matcher.matches();

    }

    /**
     *
     * @param stringToVerify
     * @return
     */
    public static boolean isNullOrEmptyObject(Object stringToVerify) {
        if (stringToVerify == null) {
            return true;
        }
        if (stringToVerify.toString().trim().equals("")) {
            return true;
        }
        return stringToVerify.toString().trim().length() < 1;
    }

    /**
     *
     * @param numberString
     * @return
     */
    public static boolean isReal(String numberString) {
        boolean result = true;
        if (isNullOrEmpty(numberString)) {
            return false;
        }

        try {
            Double val = Double.parseDouble(numberString);
            System.out.print(val);

        } catch (Exception ex) {
            result = false;
        }

        return result;

    }

    /**
     *
     * @param input
     * @return
     */
    public static String getXMLFromObject(Object input) {

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        XMLEncoder xmlEncoder = new XMLEncoder(baos);
        xmlEncoder.writeObject(input);
        xmlEncoder.close();

        return baos.toString();

    }

    /**
     *
     * @param fileName
     * @param fullFileName
     * @return
     */
    public static String getFileName(String fileName, String fullFileName) {

        String fileNameNew = fileName + fullFileName.substring(fullFileName.lastIndexOf("."));

        return fileNameNew;
    }

    /**
     *
     * @param fullFileName
     * @return
     */
    public static String getFileExtension(String fullFileName) {
        // int index = fullFileName.lastIndexOf(".");

        String ext = fullFileName.substring(fullFileName.lastIndexOf(".") + 1);

        return ext;
    }
    
     /**
     *
     * @param fullFileName
     * @return
     */
    public static String getFileSubName(String fullFileName) {
        // int index = fullFileName.lastIndexOf(".");

        String subFileName = fullFileName.substring(0, fullFileName.indexOf("."));

        return subFileName;
    }

    /**
     *
     * @param input
     * @return
     */
    public static String buildHtmlEntityCode(String input) {
        StringBuilder output = new StringBuilder(input.length() * 2);

        int len = input.length();
        int code, code1, code2, code3, code4;
        char ch;

        for (int i = 0; i < len;) {
            code1 = input.codePointAt(i);
            if (code1 >> 3 == 30) {
                code2 = input.codePointAt(i + 1);
                code3 = input.codePointAt(i + 2);
                code4 = input.codePointAt(i + 3);
                code = ((code1 & 7) << 18) | ((code2 & 63) << 12) | ((code3 & 63) << 6) | (code4 & 63);
                i += 4;
                output.append("&#").append(code).append(";");
            } else if (code1 >> 4 == 14) {
                code2 = input.codePointAt(i + 1);
                code3 = input.codePointAt(i + 2);
                code = ((code1 & 15) << 12) | ((code2 & 63) << 6) | (code3 & 63);
                i += 3;
                output.append("&#").append(code).append(";");
            } else if (code1 >> 5 == 6) {
                code2 = input.codePointAt(i + 1);
                code = ((code1 & 31) << 6) | (code2 & 63);
                i += 2;
                output.append("&#").append(code).append(";");
            } else {
                code = code1;
                i += 1;

                ch = (char) code;
                if (ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' || ch >= '0' && ch <= '9') {
                    output.append(ch);
                } else {
                    output.append("&#").append(code).append(";");
                }
            }
        }

        return output.toString();
    }

    /**
     *
     * @param msg
     * @return
     */
    public static String getDecimalEntities(String msg) {
        if (msg == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < msg.length(); i++) {
            if (msg.charAt(i) < 127) {
                sb.append(msg.charAt(i));
            } else {
                String c = "" + (int) msg.charAt(i);
                //prepend 0 and make it 5 digit long
                while (c.length() < 5) {
                    c = "0" + c;
                }
                sb.append("&#").append(c).append(";");
            }
        }
        return sb.toString();
    }

    /**
     *
     * @param s
     * @param encript
     * @return
     */
    public static String paasordEncodeMD5(String s, String encript) {

        if (!isNullOrEmpty(encript) && encript.equalsIgnoreCase("yes")) {
            return DigestUtils.md5Hex(s);
        } else {
            return s;
        }
    }

    public static String genRandonNo() {
        Random r = new Random(System.currentTimeMillis());
        return Integer.toString((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));

    }
    public static int randInt(int min, int max) {

    // NOTE: Usually this should be a field rather than a method
        // variable so that it is not re-seeded every call.
        Random rand = new Random();

    // nextInt is normally exclusive of the top value,
        // so add 1 to make it inclusive
        int randomNum = rand.nextInt((max - min) + 1) + min;

        return randomNum;
    }

    public static String getTextOfBytes(Long _byte) {
        String data = "";
        if (_byte == 0) {
            return "NA";
        }
        long _gb = _byte / (1024l * 1024l * 1024l);
        data = _gb == 0 ? data + "" : data + _gb + " Gb ";
        long remBytes = (_byte % (1024l * 1024l * 1024l));//bytes
        long _mb = remBytes / (1024l * 1024l);
        data = _mb == 0 ? data + "" : data + _mb + " Mb ";
        long remByte = remBytes % (1024l * 1024l);
        long _kb = remByte / 1024l;
        data = _kb == 0 ? data + "" : data + _kb + " Kb ";
        long _byt = remByte % 1024l;
        data = _byte == 0 ? data + "" : data + _byt + " Byte ";
        return data;
    }

    public static String getTextOfMinutes(Long _minutes) {
        String data = "";
        if (_minutes == 0) {
            return "NA";
        }
        long _day = _minutes / (60l * 24l);
        data = _day == 0 ? data + "" : data + _day + " Day ";
        long remMinutes = (_minutes % (60l * 24l));//minutes
        long _hours = remMinutes / (60l);
        data = _hours == 0 ? data + "" : data + _hours + " Hour ";
        long remMi = remMinutes % (60l);
        long _minu = remMi;
        data = _minu == 0 ? data + "" : data + _minu + " Minute ";
       
        return data;
    }
    /**
     *
     * @param argv
     */
    public static void main(String argv[]) throws ParseException {

  Country   c    = getNationality("OM");
        //  new PrepaidbatchJpaController()
        ///   .getActivePlan(UIConstants.PLAN_TYPE.PLAN_TYPE_SINGLE_USER.value,
        ///   new Date(), "OAMC");

    }
}
