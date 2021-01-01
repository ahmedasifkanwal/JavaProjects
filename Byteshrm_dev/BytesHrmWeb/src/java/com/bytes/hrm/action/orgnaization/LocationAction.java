package com.bytes.hrm.action.orgnaization;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.orgnaization.LocationDto;
import com.bytes.hrm.service.orgnaization.LocationService;
import com.bytes.hrm.service.orgnaization.LocationServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LocationAction extends MyActionSupport
        implements ModelDriven<LocationDto> {

    private LocationDto locationDto = new LocationDto();
    LocationService locationDtoService = new LocationServiceImpl();

    public LocationAction() {

        initialize();
    }

    public void initialize() {

    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            locationDto.setLocationList(locationDtoService.findAll());

            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(locationDto.getLocation().getName())) {
            addFieldError("name", "Location Required.");
        }
        if (StringHelper.isNullOrEmpty(locationDto.getLocation().getCountryCode().getCouCode())) {
            addFieldError("couCode", "Country Required.");
        }
    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (locationDtoService.create(locationDto.getLocation()) != null) {
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

    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(locationDto.getLocation().getName())) {
            addFieldError("name", "Location Required.");
        }
        if (locationDto.getLocation().getId() == 0) {
            addActionError("Location Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (locationDtoService.update(locationDto.getLocation()) != null) {

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
    public LocationDto getModel() {
        return this.locationDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                locationDto.setLocation(locationDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the locationDto
     */
    public LocationDto getLocationDto() {
        return locationDto;
    }

    /**
     * @param locationDto the locationDto to set
     */
    public void setLocationDto(LocationDto locationDto) {
        this.locationDto = locationDto;
    }
}
