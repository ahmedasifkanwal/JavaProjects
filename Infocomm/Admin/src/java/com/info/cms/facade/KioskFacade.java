/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.helper.DateHelper;
import com.info.cms.presentation.entity.PeAuditLog;
import com.info.cms.presentation.entity.PeKiosk;
import com.info.cms.presentation.entity.PeTerminalStatus;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.cms.entity.KioskTerminal;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.controller.AuditLogJpaController;
import com.info.wifi.cms.entity.controller.KioskTerminalJpaController;
import com.info.wifi.cms.util.SqlResult;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author naeem
 */
public class KioskFacade {

    /**
     *
     * @param @return @throws ParseException
     */
    public void getKioskTerminalStatus(PeKiosk peKiosk) {

        List list = new KioskTerminalJpaController().getActiveKioskTerminal();
        PeTerminalStatus peTerminalStatus = new PeTerminalStatus();
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                String  data =  list.get(j).toString().trim();

                if (data.equalsIgnoreCase("TERMINAL1")) {
                    peTerminalStatus.setTerminal1Status("A");
                }

                if (data.equalsIgnoreCase("TERMINAL2")) {
                    peTerminalStatus.setTerminal2Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL3")) {
                    peTerminalStatus.setTerminal3Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL4")) {
                    peTerminalStatus.setTerminal4Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL5")) {
                    peTerminalStatus.setTerminal5Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL6")) {
                    peTerminalStatus.setTerminal6Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL7")) {
                    peTerminalStatus.setTerminal7Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL8")) {
                    peTerminalStatus.setTerminal8Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL9")) {
                    peTerminalStatus.setTerminal9Status("A");
                }

                if (data.equalsIgnoreCase("TERMINAL10")) {
                    peTerminalStatus.setTerminal10Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL11")) {
                    peTerminalStatus.setTerminal11Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL12")) {
                    peTerminalStatus.setTerminal12Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL13")) {
                    peTerminalStatus.setTerminal13Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL14")) {
                    peTerminalStatus.setTerminal14Status("A");
                }
                if (data.equalsIgnoreCase("TERMINAL15")) {
                    peTerminalStatus.setTerminal15Status("A");
                }

            }

        }

        peKiosk.setPeTerminalStatus(peTerminalStatus);
       
    }

    public void getKioskTerminalDetails(PeKiosk peKiosk) throws ParseException {
       
        List<KioskTerminal> kioskTerminalList = new ArrayList<KioskTerminal>();
        List list = new KioskTerminalJpaController().getKioskTerminal(peKiosk.getFromToDateBetween());

        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                Object[] data = (Object[]) list.get(j);
                KioskTerminal kioskTerminal = new KioskTerminal();
                kioskTerminal.setId(new Long(data[0].toString()));
                kioskTerminal.setTerminalName(data[1] == null ? "" : data[1].toString());
                kioskTerminal.setTerminalTime(data[2] == null ? "" : data[2].toString());
                kioskTerminal.setServiceDelay(data[3] == null ? "" : data[3].toString());
                kioskTerminalList.add(kioskTerminal);

            }

        }
         peKiosk.setKioskTerminalList(kioskTerminalList);
         getKioskTerminalStatus( peKiosk);
        
    }
}
