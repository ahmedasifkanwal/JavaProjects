/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.info.cms.helper;

import java.util.Locale;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author software
 */
public class ResourceBundleUtil {
    static final Logger logger = Logger.getLogger(ResourceBundleUtil.class.getName());
    /**
     * This list maintains list of loaded resource bundles
     */
    private static final Map<String, ResourceBundle> resourceBundleMap = new TreeMap<String, ResourceBundle>();
    /**
     * This is an object of Locale.ENGLISH
     */
    public static final Locale ENGLISH = Locale.ENGLISH;
    /**
     * This is an object of Locale("ar", "AE")
     */
    public static final Locale ARABIC = new Locale("ar", "AE");

    /**
     * This 
     * @param resource Name of the resource
     * @param locale Locale of the resource
     * @return Object of ResourceBundle
     */
    private static ResourceBundle loadResourceBundle(String resource, Locale locale) {
        logger.log(Level.FINEST, "loadResourceBundle called with parameters: resource={0}, locale={1}", new Object[]{resource, locale});
        ResourceBundle resourceBundle = null;
        try {
            resourceBundle = ResourceBundle.getBundle(resource, locale);
        } catch (MissingResourceException e) {
            //try by replacing / by . and first / by space
            if (resource.startsWith("/")) {
                resource = resource.substring(1);
            }
            resource = resource.replaceAll("/", ".");
            resourceBundle = ResourceBundle.getBundle(resource, locale);
        }
        logger.log(Level.FINEST, "resourceBundle={0}", resourceBundle);
        if (resourceBundle != null) {
          resourceBundleMap.put(resource + ":" + locale.toString(), resourceBundle);
        }
        return resourceBundle;
    }

    /**
     * This method returns specified resource for English locale
     * @param resource Name of the resource
     * @return Object of the ResourceBundle
     */
    public static synchronized ResourceBundle getResourceBundle(String resource) {
        logger.log(Level.FINEST, "getResourceBundle called with parameters: resource={0}", resource);
        return getResourceBundle(resource, ENGLISH);
    }

    /**
     *
     * @param resource
     * @param locale
     * @return
     */
    public static synchronized ResourceBundle getResourceBundle(String resource, Locale locale) {
        
        if (locale==null)
        {
        locale=new Locale("en");
        }
        logger.log(Level.FINEST, "getResourceBundle called with parameters: resource={0}, locale={1}", new Object[]{resource, locale});
        logger.finest("Getting Resource Bundle from resourceBundleMap");
        ResourceBundle resourceBundle = resourceBundleMap.get(resource + ":" + locale.toString());
        logger.log(Level.FINE, "Resource bundle from Map: {0}", resourceBundle);
        if (resourceBundle == null) {
            logger.log(Level.FINE, "No ResourceBundle in the resourceBundleMap for : {0}:{1}", new Object[]{resource, locale.toString()});
            logger.log(Level.FINE, "resourceBundleMap : {0}", resourceBundleMap);
            //load resource
            resourceBundle = loadResourceBundle(resource, locale);
        }
        return resourceBundle;
    }

    /**
     *
     * @param locale
     * @return
     */
    public static synchronized ResourceBundle getCommonResourceBundle(Locale locale) {
        return getResourceBundle("/resources/common", locale);
    }

    /**
     *
     * @return
     */
    public static synchronized ResourceBundle getCommonResourceBundle() {
        return getCommonResourceBundle(ENGLISH);
    }

    /**
     * This method can be called to clear resource bunder cache.
     * This method can be called in resource file
     * has been updated and new contents should be read
     */
    public static void clearCache(){
        resourceBundleMap.clear();
    }

    /**
     *
     * @param argv
     */
    public static void main(String argv[]) {
        //ResourceBundle rb = ResourceBundleUtil.getResourceBundle("com.comtech.mparking.resources.role");
        ResourceBundle rb = getCommonResourceBundle();
        System.out.println("role.rb: " + rb);
        System.out.println("role.rb.welcome: " + rb.getString("welcome"));
        System.out.println("role.rb.links.search.user: " + rb.getString("links.search.user"));
    /*
    rb = ResourceBundleUtil.getResourceBundle("test", new Locale("ar", "AE"));
    System.out.println("test.ar_AE.rb: " + rb);
    System.out.println("test.ar_AE.rb.key1: " + rb.getString("key1"));
    System.out.println("test.ar_AE.rb.key2: " + rb.getString("key2"));
    rb = ResourceBundleUtil.getResourceBundle("test", new Locale("ar", "SA"));
    System.out.println("test.ar_SA.rb: " + rb);
    System.out.println("test.ar_SA.rb.key1: " + rb.getString("key1"));
    System.out.println("test.ar_SA.rb.key2: " + rb.getString("key2"));
     */
    }
}
