package com.bytes.hrm.action.qualification;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.qualification.MembershipDto;
import com.bytes.hrm.service.qualification.MembershipService;
import com.bytes.hrm.service.qualification.MembershipServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class MembershipAction extends MyActionSupport
        implements ModelDriven<MembershipDto> {

    private MembershipDto membershipDto = new MembershipDto();
    MembershipService membershipDtoService = new MembershipServiceImpl();

    public MembershipAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            membershipDto.setMembershipList(membershipDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(membershipDto.getMembership().getName())) {
            addFieldError("name", "Membership Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (membershipDtoService.create(membershipDto.getMembership()) != null) {
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

    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(membershipDto.getMembership().getName())) {
              addFieldError("name", "Membership Required.");
        }
        if (membershipDto.getMembership().getId()==0) {
            addActionError("Membership Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (membershipDtoService.update(membershipDto.getMembership()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public MembershipDto getModel() {
        return this.membershipDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                membershipDto.setMembership(membershipDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the membershipDto
     */
    public MembershipDto getMembershipDto() {
        return membershipDto;
    }

    /**
     * @param membershipDto the membershipDto to set
     */
    public void setMembershipDto(MembershipDto membershipDto) {
        this.membershipDto = membershipDto;
    }
}
