/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 *
 * @author SALEEM
 */
public class UIChartBase {

    public String getChartColor() {
        return "var Colors =['#5bc0de', '#428bca', '#5cb85c', '#d9534f', '#f0ad4e', '#7857ca', '#efcf1d'];";
    }
    public static String getChartLayout(String layoutName) throws FileNotFoundException {
        String path[] = UIChartBase.class.getProtectionDomain().getCodeSource().getLocation().getPath().toLowerCase().split("web-inf");
        String graphPath = "";//UIConstants.GRAPH_PATH
        graphPath = path[0] + File.separator + "hicharts" + File.separator + "icmschart" + File.separator + layoutName;
        String base = new Scanner(new java.io.File(graphPath)).useDelimiter("\\Z").next();
        return base;
    }

}
