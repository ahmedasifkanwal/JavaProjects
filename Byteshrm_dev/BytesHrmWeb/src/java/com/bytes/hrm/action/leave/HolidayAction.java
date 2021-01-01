package com.bytes.hrm.action.leave;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;

import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.leave.HolidayDto;

import com.bytes.hrm.service.leave.HolidayService;
import com.bytes.hrm.service.leave.HolidayServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class HolidayAction extends MyActionSupport implements MyOperation,
         ModelDriven<HolidayDto> {

    private HolidayDto holidayDto = new HolidayDto();
   HolidayService holidayService = new HolidayServiceImpl();

    public HolidayAction() {

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
            holidayDto.setHolidayList(holidayService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(holidayDto.getHoliday().getDescription())) {
            addFieldError("holiday", "Leave Type Required.");
          
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (holidayService.create(holidayDto.getHoliday()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }finally
        {
          new RefDto().resetReferenceData(holidayDto.getHoliday().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(holidayDto.getHoliday().getDescription())) {
            addFieldError("holiday", "Leave Type Required.");
        }
      

        if (holidayDto.getHoliday().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (holidayService.update(holidayDto.getHoliday()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }finally
        {
          new RefDto().resetReferenceData(holidayDto.getHoliday().getClass());
        }
        return SUCCESS;
    }

    @Override
    public HolidayDto getModel() {
        return this.holidayDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                holidayDto.setHoliday(holidayService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the holidayDto
     */
    public HolidayDto getHolidayDto() {
        return holidayDto;
    }

    /**
     * @param holidayDto the holidayDto to set
     */
    public void setHolidayDto(HolidayDto holidayDto) {
        this.holidayDto = holidayDto;
    }
}
