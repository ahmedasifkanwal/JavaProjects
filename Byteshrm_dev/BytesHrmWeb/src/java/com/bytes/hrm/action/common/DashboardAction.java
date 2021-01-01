package com.bytes.hrm.action.common;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.dao.entity.EmpPassport;
import com.bytes.hrm.dto.common.DashboardDto;
import com.bytes.hrm.service.leave.LeavesService;
import com.bytes.hrm.service.leave.LeavesServiceImpl;
import com.bytes.hrm.service.pim.EmpPassportService;
import com.bytes.hrm.service.pim.EmpPassportServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class DashboardAction extends MyActionSupport implements MyOperation,
        ModelDriven<DashboardDto> {
      private static DashboardDto dashboardDto = new DashboardDto();
    LeavesService leavesService= new LeavesServiceImpl();
      EmpPassportService empPassportService= new EmpPassportServiceImpl();

    /**
     * @return the dashboardDto
     */
    public static DashboardDto getDashboardDto() {
        return dashboardDto;
    }

    /**
     * @param aDashboardDto the dashboardDto to set
     */
    public static void setDashboardDto(DashboardDto aDashboardDto) {
        dashboardDto = aDashboardDto;
    }

  
   
    public DashboardAction() {

        initialize();
    }

    @Override
    public void initialize() {

    }

    @Override
    public void validateSearchInput() {
    }

    @Override
    public String search() {
        try {

            //Hard Code here the setLeaveList to populate Dummay data
            //Real code will give method to get all expired passport
           //dashboardDto.setLeavesList(leavesService.findAll());  this is not implemented
           dashboardDto.setEmpPassportList(empPassportService.findAll());
           
           
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        
    }

    @Override
    public String save() {
        try {
           

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        

    }

    @Override
    public String edit() {
        try {
            
        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public DashboardDto getModel() {
        return dashboardDto;
    }

    @Override
    public String getSelected() {
        try {
          
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
         }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

   
}
