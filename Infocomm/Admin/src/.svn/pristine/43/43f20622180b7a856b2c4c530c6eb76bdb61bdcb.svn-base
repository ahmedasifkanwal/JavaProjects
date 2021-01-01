/*
 * Name      Date           CR#       Remarks
 * Yaseen    01-Jan-2015              Initial
 * 
 */
package com.info.cms.facade;

import com.info.cms.presentation.entity.PeVlan;
import com.info.wifi.cms.entity.Vlan;
import com.info.wifi.cms.entity.controller.VlanJpaController;
import com.info.wifi.cms.util.SqlResult;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Yaseen
 */
public class VlanFacade {

    public static final Logger logger = Logger.getLogger(VlanFacade.class.getName());

    public void saveVlan(PeVlan peVlan) throws Exception {
        VlanJpaController controller = new VlanJpaController();
        Vlan vlan = peVlan.getVlan();
        //vlan.setStatus(peVlan.getStatus());
        // vlan.setAdvAgencyId(BigDecimal.valueOf(peVlan.getAdvAgencyId()));
        controller.create(vlan);
    }

    public boolean editVlan(PeVlan peVlan) throws Exception {

        VlanJpaController controller = new VlanJpaController();
        Vlan vlan = peVlan.getVlan();
        //  vlan.setId(peVlan.getVlan().getId());
        // vlan.setStatus(peVlan.getStatus());
       // vlan.setDescription(peVlan.getVlan().getDescription());
        // vlan.setAdvAgencyId(BigDecimal.valueOf(peVlan.getAdvAgencyId()));
        try {
            controller.edit(vlan);
        } catch (Exception ex) {
            // Logger.getLogger(CustomerFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;

    }

    public SqlResult getVlan(PeVlan peVlan) {
        int noOfVlan = 0;
        Vlan vlan = peVlan.getVlan();
        //  if (vlan.getVlan() != null) {
        // if (vlan.getVlan().intValue() > 0) {
        //noOfVlan = vlan.getVlan().intValue();
        // }
        // }
        SqlResult result = new SqlResult();
        //  ReportConfiguration reportCon = ReferenceData.getReportConfiguration("SEARCH_VLAN_SQL");
        // List list = new VlanJpaController().searchVlan(peVlan.getStatus(), reportCon.getSelectSql(),
        // noOfVlan, peVlan.getVlan().getDescription(), peVlan.getAdvAgencyId());
        //   String data = UIDataTable.getFormattedTable(list, reportCon.getSelectColumn(), reportCon.getColumnFormat(), reportCon.getReportRequire());
        //   result.setData(data);
        return result;
    }


    public List<Vlan> getVlan() {
        return new VlanJpaController().findVlanEntities();

    }

    public List<Vlan> getVlan(String columnName, String value) {
        return null;// VlanJpaController().findVlanByColumn(columnName, value);

    }

    public List<Vlan> getVlan(String columnName, Long value) {
        return null;//new VlanJpaController().findVlanByColumn(columnName, value);

    }

    public Vlan getVlan(Long id) {
        return null;// new VlanJpaController().findVlan(id);

    }

    public List<Vlan> getVlanByGatewayId(int gatewayId) {

        return null;// VlanJpaController().findVlanByGatewayId(gatewayId);

    }

    public PeVlan getSelectedVlan(PeVlan peVlan) {
        Vlan vlan = null;// new VlanJpaController().findVlan(peVlan.getId());
        /*peVlan.setGatewayId(String.valueOf(vlan.getGatewayId()));
         peVlan.setVlanGroupId(String.valueOf(vlan.getVlanGroupId()));
         peVlan.setName(vlan.getName());
         peVlan.setDescription(vlan.getDescription());
         peVlan.setStatus(vlan.getStatus());
         peVlan.setCreationDate(vlan.getCreationDate());
         peVlan.setCreatedBy(vlan.getCreatedBy());
         peVlan.setUpdatedDate(vlan.getUpdatedDate());
         peVlan.setUpdatedBy(vlan.getUpdatedBy());
         peVlan.setVlanId(String.valueOf(vlan.getVlanId()));*/
        return peVlan;
    }

    public PeVlan getViewVlan(PeVlan peVlan) {
        // Vlan vlan = new VlanJpaController().findVlan(peVlan.getId());
        // Gateway gateway = new GatewayJpaController().findGateway(vlan.getGatewayId());
        // VlanGroup vlanGroup = new VlanGroupJpaController().findVlanGroup(vlan.getVlanGroupId());
        //  mapperJpaEntitiesToPeVlanGroup(peVlan, gateway, vlanGroup, vlan);
        return peVlan;
    }

   // private void mapperJpaEntitiesToPeVlanGroup(PeVlan peVlan, Gateway gateway, VlanGroup vlanGroup, Vlan vlan) {
        /*if (gateway.getId() > 0) {            peVlan.setGatewayName(gateway.getName());
     }
     if (vlanGroup.getId() > 0) {
     peVlan.setVlanGroupName(vlanGroup.getGroupName());
     }
     peVlan.setName(vlan.getName());
     peVlan.setDescription(StringHelper.isNullOrEmpty(vlan.getDescription())
     ? "" : vlan.getDescription());
     peVlan.setStatus(vlan.getStatus());
     peVlan.setCreationDate(vlan.getCreationDate());
     peVlan.setCreatedBy(vlan.getCreatedBy());
     peVlan.setUpdatedDate(vlan.getUpdatedDate());
     peVlan.setUpdatedBy(vlan.getUpdatedBy());
     peVlan.setVlanId(String.valueOf(vlan.getVlanId()));*/
    // }
    public void getVlanById(PeVlan peVlan) {

        //  Vlan vlan = new VlanJpaController().findVlan(peVlan.getVlan().getId());
        //  peVlan.setVlan(vlan);
        //  peVlan.setStatus(vlan.getStatus());

    }

}
