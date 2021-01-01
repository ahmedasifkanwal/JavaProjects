/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.helper.DateHelper;
import com.info.cms.presentation.entity.PeResult;
import com.info.cms.presentation.entity.PeUsers;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.entity.controller.SysAuthoritiesJpaController;
import com.info.wifi.cms.util.SqlResult;
import java.math.BigDecimal;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author naeem
 */
public class SysAuthorityFacade {

    static final Logger logger = Logger.getLogger(SysAuthorityFacade.class.getName());

    /**
     *
     * @param peUsers
     * @return
     * @throws Exception
     */
    public boolean save(PeUsers peUsers) throws Exception {
        SysAuthoritiesJpaController controller = new SysAuthoritiesJpaController();
        SysAuthorities authorities = new SysAuthorities();
        authorities.setAuthority(peUsers.getAuthority().replace(" ", ""));
        authorities.setCreatedBy(peUsers.getCreatedBy());
        authorities.setCreatedDate(DateHelper.getCurrentDate());
        authorities.setDescription(peUsers.getDescription());
        authorities.setTitle(peUsers.getTitle());
        authorities.setStatus("A");
        controller.create(authorities);
        return true;

    }

    public SqlResult search(PeUsers peUsers) {
        ReportConfiguration reportCon = ReferenceData.getReportConfiguration("AUTHORITY_SQL");
        if (peUsers.getCreatedBy().equals("systemadmin")) {
            reportCon.setSelectSql(reportCon.getSelectSql().replace("Admin", "System"));
        }
        SqlResult result = new SysAuthoritiesJpaController().getAuthority(reportCon.getSelectSql());

        result.setData(UIDataTable.getFormattedTable((List) result.getData(), reportCon.getSelectColumn(), reportCon.getColumnFormat(),reportCon.getReportRequire()));
        return result;
    }

    public void getSelectedAuthority(PeUsers peUsers) {
        SysAuthorities authorities = new SysAuthoritiesJpaController().findSysAuthorities(new BigDecimal(peUsers.getAuthority_id()));
        peUsers.setAuthority(authorities.getAuthority());
        peUsers.setDescription(authorities.getDescription());
        peUsers.setTitle(authorities.getTitle());
        peUsers.setStatus(authorities.getStatus());
    }

    public PeResult edit(PeUsers peUsers) throws Exception {
        PeResult result = new PeResult();
        result.setStatus(false);
        SysAuthorities authorities = new SysAuthoritiesJpaController().findSysAuthorities(new BigDecimal(peUsers.getAuthority_id()));
        result.setData(authorities);
        authorities.setDescription(peUsers.getDescription());
        authorities.setTitle(peUsers.getTitle());
        authorities.setStatus(peUsers.getStatus());
        new SysAuthoritiesJpaController().edit(authorities);
        result.setStatus(true);
        return result;

    }
}
