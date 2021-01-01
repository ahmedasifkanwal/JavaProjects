package com.bytes.hrm.action.job;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.job.WorkShiftDto;
import com.bytes.hrm.service.job.WorkShiftService;
import com.bytes.hrm.service.job.WorkShiftServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

public final class WorkShiftAction extends MyActionSupport implements MyOperation,
        ModelDriven< WorkShiftDto> {

    private WorkShiftDto workShiftDto = new WorkShiftDto();
    WorkShiftService workShiftService = new WorkShiftServiceImpl();

    public WorkShiftAction() {

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
            workShiftDto.setWorkShiftList(workShiftService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getName())) {
            addFieldError("name", "Work Shift Name Required.");
        }

        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getStartTime())) {
            addFieldError("Start Time", "Start Time Name Required.");
        }

        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getEndTime())) {
            addFieldError("End Time", "End Time Required.");
        }

        DateTimeFormatter format = DateTimeFormatter
                .ofLocalizedTime(FormatStyle.SHORT);
        LocalTime time1 = LocalTime.parse(workShiftDto.getWorkShift().getStartTime(), format);
        LocalTime time2 = LocalTime.parse(workShiftDto.getWorkShift().getEndTime(), format);
        Duration duration = Duration.between(time1, time2);
        workShiftDto.getWorkShift().setHoursPerDay(new BigDecimal(Math.abs(duration.getSeconds() / (3600 * 24))));

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (workShiftService.create(workShiftDto.getWorkShift()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getName())) {
            addFieldError("name", "Work Shift Name Required.");
        }

        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getStartTime())) {
            addFieldError("Start Time", "Start Time Name Required.");
        }

        if (StringHelper.isNullOrEmpty(workShiftDto.getWorkShift().getEndTime())) {
            addFieldError("End Time", "End Time Required.");
        }
        DateTimeFormatter format = DateTimeFormatter
                .ofLocalizedTime(FormatStyle.SHORT);
        LocalTime time1 = LocalTime.parse(workShiftDto.getWorkShift().getEndTime(), format);
        LocalTime time2 = LocalTime.parse(workShiftDto.getWorkShift().getStartTime(), format);
        Duration duration = Duration.between(time1, time2);
        workShiftDto.getWorkShift().setHoursPerDay(new BigDecimal(Math.abs(duration.getSeconds() / (3600 * 24))));

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (workShiftService.update(workShiftDto.getWorkShift()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public WorkShiftDto getModel() {
        return this.workShiftDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                workShiftDto.setWorkShift(workShiftService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the workShiftDto
     */
    public WorkShiftDto getWorkShiftDto() {
        return workShiftDto;
    }

    /**
     * @param workShiftDto the workShiftDto to set
     */
    public void setWorkShiftDto(WorkShiftDto workShiftDto) {
        this.workShiftDto = workShiftDto;
    }
}
