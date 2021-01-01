/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.common.helper;

import com.bytes.hrm.dao.common.Competency;
import com.bytes.hrm.dao.common.Fluency;
import com.bytes.hrm.dao.common.Gender;
import com.bytes.hrm.dao.common.ImigrationDocType;
import com.bytes.hrm.dao.common.MaritalStatus;
import com.bytes.hrm.dao.common.RelationshipType;
import com.bytes.hrm.dao.common.SysParentAuthority;
import com.bytes.hrm.dao.entity.AstBrand;
import com.bytes.hrm.dao.entity.AstCategory;
import com.bytes.hrm.dao.entity.AstStatus;
import com.bytes.hrm.dao.entity.AstVendor;
import com.bytes.hrm.dao.entity.Country;
import com.bytes.hrm.dao.entity.CurrencyType;
import com.bytes.hrm.dao.entity.Education;
import com.bytes.hrm.dao.entity.EmpReportingMethod;
import com.bytes.hrm.dao.entity.EmploymentStatus;
import com.bytes.hrm.dao.entity.JobCategory;
import com.bytes.hrm.dao.entity.JobTitle;
import com.bytes.hrm.dao.entity.Language;
import com.bytes.hrm.dao.entity.Location;
import com.bytes.hrm.dao.entity.Nationality;
import com.bytes.hrm.dao.entity.PayGrade;
import com.bytes.hrm.dao.entity.Payperiod;
import com.bytes.hrm.dao.entity.Subunit;
import com.bytes.hrm.dao.entity.LeaveEntitlementType;
import com.bytes.hrm.dao.entity.LeaveType;
import com.bytes.hrm.dao.entity.License;
import com.bytes.hrm.dao.entity.Membership;
import com.bytes.hrm.dao.entity.OperationalCountry;
import com.bytes.hrm.dao.entity.Skill;
import com.bytes.hrm.dao.entity.SysAuthorities;
import com.bytes.hrm.dto.common.DayLengthDto;
import com.bytes.hrm.service.common.CountryService;
import com.bytes.hrm.service.common.CountryServiceImpl;
import com.bytes.hrm.service.common.CurrencyTypeService;
import com.bytes.hrm.service.common.CurrencyTypeServiceImpl;
import com.bytes.hrm.service.common.NationalityService;
import com.bytes.hrm.service.common.NationalityServiceImpl;
import com.bytes.hrm.service.job.EmploymentStatusService;
import com.bytes.hrm.service.job.EmploymentStatusServiceImpl;
import com.bytes.hrm.service.job.JobCategoryService;
import com.bytes.hrm.service.job.JobCategoryServiceImpl;
import com.bytes.hrm.service.job.JobTitleService;
import com.bytes.hrm.service.job.JobTitleServiceImpl;
import com.bytes.hrm.service.job.OperationalCountryService;
import com.bytes.hrm.service.job.OperationalCountryServiceImpl;
import com.bytes.hrm.service.job.PayGradeService;
import com.bytes.hrm.service.job.PayGradeServiceImpl;
import com.bytes.hrm.service.job.PayperiodService;
import com.bytes.hrm.service.job.PayperiodServiceImpl;
import com.bytes.hrm.service.leave.LeaveEntitlementTypeServiceImpl;
import com.bytes.hrm.service.leave.LeaveEntitlementTypeService;
import com.bytes.hrm.service.leave.LeaveTypeService;
import com.bytes.hrm.service.leave.LeaveStatusServiceImpl;
import com.bytes.hrm.service.leave.LeaveTypeServiceImpl;
import com.bytes.hrm.service.orgnaization.LocationService;
import com.bytes.hrm.service.orgnaization.LocationServiceImpl;
import com.bytes.hrm.service.pim.EmpReportingMethodService;
import com.bytes.hrm.service.pim.EmpReportingMethodServiceImpl;
import com.bytes.hrm.service.orgnaization.SubunitService;
import com.bytes.hrm.service.orgnaization.SubunitServiceImpl;
import com.bytes.hrm.service.qualification.EducationService;
import com.bytes.hrm.service.qualification.EducationServiceImpl;
import com.bytes.hrm.service.qualification.LanguageService;
import com.bytes.hrm.service.qualification.LanguageServiceImpl;
import com.bytes.hrm.service.qualification.LicenseService;
import com.bytes.hrm.service.qualification.LicenseServiceImpl;
import com.bytes.hrm.service.qualification.MembershipService;
import com.bytes.hrm.service.qualification.MembershipServiceImpl;
import com.bytes.hrm.service.qualification.SkillService;
import com.bytes.hrm.service.qualification.SkillServiceImpl;
import com.bytes.hrm.service.asset.AstBrandService;
import com.bytes.hrm.service.asset.AstBrandServiceImpl;
import com.bytes.hrm.service.asset.AstCategoryService;
import com.bytes.hrm.service.asset.AstCategoryServiceImpl;
import com.bytes.hrm.service.asset.AstVendorService;
import com.bytes.hrm.service.asset.AstVendorServiceImpl;
import com.bytes.hrm.service.asset.AstStatusService;
import com.bytes.hrm.service.asset.AstStatusServiceImpl;

import com.bytes.hrm.service.system.SysAuthoritiesService;
import com.bytes.hrm.service.system.SysAuthoritiesServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class ReferenceData {

    //Fields are pulic so that it can be reset from RefDao
    public static List< CurrencyType> currencyTypeList = new ArrayList<>();
    public static List< Country> countryList = new ArrayList<>();
    public static List< Gender> genderList = new ArrayList<>();
    public static List< Nationality> nationalityList = new ArrayList<>();
    public static List< MaritalStatus> maritalStatusList = new ArrayList<>();
    public static List< RelationshipType> relationshipTypeList = new ArrayList<>();
    public static List< ImigrationDocType> imigrationDocTypeList = new ArrayList<>();
    public static List< JobTitle> jobTitleList = new ArrayList<>();
    public static List< JobCategory> jobCategoryList = new ArrayList<>();
    public static List< EmploymentStatus> employmentStatusList = new ArrayList<>();
    public static List< Location> locationList = new ArrayList<>();
    public static List< Subunit> subunitList = new ArrayList<>();
    public static List< Payperiod> payperiodList = new ArrayList<>();
    public static List< PayGrade> payGradeList = new ArrayList<>();
    public static List< EmpReportingMethod> empReportingMethodList = new ArrayList<>();
    public static List< Membership> membershipList = new ArrayList<>();
    public static List< Fluency> fluencyList = new ArrayList<>();
    public static List< Competency> competencyList = new ArrayList<>();
    public static List< LeaveType> leaveTypeList = new ArrayList<>();
    public static List< LeaveEntitlementType> leaveEntitlementTypeList = new ArrayList<>();
    public static List< Education> educationList = new ArrayList<>();
    public static List< Skill> skillList = new ArrayList<>();
    public static List< Language> languageList = new ArrayList<>();
    public static List< License> licenseList = new ArrayList<>();
    public static List< OperationalCountry> operationalCountryList = new ArrayList<>();
    
    public static List< DayLengthDto> dayLengthList = new ArrayList<>();
    public static List< SysParentAuthority> sysParentAuthorityList = new ArrayList<>();
    public static List< SysAuthorities> sysAuthoritiesList = new ArrayList<>();
    public static List< AstVendor> astVendorList = new ArrayList<>();
    public static List< AstCategory> astCategoryList = new ArrayList<>();
    public static List< AstBrand> astBrandList = new ArrayList<>();
    public static List< AstStatus> astStatusList = new ArrayList<>();
    
    
     

    public static List< SysAuthorities> getSysAuthorities() {
        if (sysAuthoritiesList.isEmpty()) {
            SysAuthoritiesService dao = new SysAuthoritiesServiceImpl();
            sysAuthoritiesList = dao.findAllRole();
        }
        return sysAuthoritiesList;
    }

    public static List< DayLengthDto> getDayLength() {
        if (dayLengthList.isEmpty()) {

            DayLengthDto dayLengthDto = new DayLengthDto();
            dayLengthDto.setLengthHours(8);
            dayLengthDto.setHoliddayLength("Full-Day");
            dayLengthList.add(dayLengthDto);

            dayLengthDto = new DayLengthDto();
            dayLengthDto.setLengthHours(4);
            dayLengthDto.setHoliddayLength("Half-Day");
            dayLengthList.add(dayLengthDto);
        }
        return dayLengthList;
    }

    public static List< SysParentAuthority> getSysParentAuthority() {
        if (competencyList.isEmpty()) {

            SysParentAuthority sysParentAuthority = new SysParentAuthority();

            sysParentAuthority.setCode("Admin");
            sysParentAuthority.setName("Admin");
            sysParentAuthorityList.add(sysParentAuthority);

            sysParentAuthority = new SysParentAuthority();
            sysParentAuthority.setCode("ESS");
            sysParentAuthority.setName("ESS");
            sysParentAuthorityList.add(sysParentAuthority);

        }
        return sysParentAuthorityList;
    }

    public static List< OperationalCountry> getOperationalCountry() {
        if (operationalCountryList.isEmpty()) {
            OperationalCountryService dao = new OperationalCountryServiceImpl();
            operationalCountryList = dao.findAll();
        }
        return operationalCountryList;
    }

    public static List< License> getLicense() {
        if (licenseList.isEmpty()) {
            LicenseService dao = new LicenseServiceImpl();
            licenseList = dao.findAll();
        }
        return licenseList;
    }

    public static List< Language> getLanguage() {
        if (languageList.isEmpty()) {
            LanguageService dao = new LanguageServiceImpl();
            languageList = dao.findAll();
        }
        return languageList;
    }

    public static List< Skill> getSkill() {
        if (skillList.isEmpty()) {
            SkillService dao = new SkillServiceImpl();
            skillList = dao.findAll();
        }
        return skillList;
    }

    public static List< Education> getEducation() {
        if (educationList.isEmpty()) {
            EducationService dao = new EducationServiceImpl();
            educationList = dao.findAll();
        }
        return educationList;
    }

    public static List< LeaveEntitlementType> getLeaveEntitlementType() {
        if (leaveEntitlementTypeList.isEmpty()) {
            LeaveEntitlementTypeService dao = new LeaveEntitlementTypeServiceImpl();
            leaveEntitlementTypeList = dao.findAll();
        }
        return leaveEntitlementTypeList;
    }

    public static List< LeaveType> getLeaveType() {
        if (leaveTypeList.isEmpty()) {
            LeaveTypeService dao = new LeaveTypeServiceImpl();
            leaveTypeList = dao.findAll();
        }
        return leaveTypeList;
    }

    public static List< Competency> getCompetency() {
        if (competencyList.isEmpty()) {

            Competency competency = new Competency();
            short c = 1;
            competency.setCode(c);
            competency.setName("Basic");
            competencyList.add(competency);
            competency = new Competency();
            c = 2;
            competency.setCode(c);
            competency.setName("Normal");
            competencyList.add(competency);
            c = 3;
            competency.setCode(c);
            competency.setName("Expert");
            competencyList.add(competency);

        }
        return competencyList;
    }

    public static List< Fluency> getFluency() {
        if (fluencyList.isEmpty()) {

            Fluency fluency = new Fluency();
            short c = 1;
            fluency.setCode(c);
            fluency.setName("Basic");
            fluencyList.add(fluency);

            fluency = new Fluency();
            c = 1;
            fluency.setCode(c);
            fluency.setName("Normal");
            fluencyList.add(fluency);

            fluency = new Fluency();
            c = 2;
            fluency.setCode(c);
            fluency.setName("Expert");
            fluencyList.add(fluency);

        }
        return fluencyList;
    }

    public static List< Membership> getMembership() {
        if (membershipList.isEmpty()) {
            MembershipService dao = new MembershipServiceImpl();
            membershipList = dao.findAll();
        }
        return membershipList;
    }

    public static List< EmpReportingMethod> getEmpReportingMethod() {
        if (empReportingMethodList.isEmpty()) {
            EmpReportingMethodService dao = new EmpReportingMethodServiceImpl();
            empReportingMethodList = dao.findAll();
        }
        return empReportingMethodList;
    }

    public static List< JobTitle> getJobTitle() {
        if (jobTitleList.isEmpty()) {

            JobTitleService dao = new JobTitleServiceImpl();
            jobTitleList = dao.findAll();
        }
        return jobTitleList;
    }

    public static List< JobCategory> getJobCategory() {
        if (jobCategoryList.isEmpty()) {

            JobCategoryService dao = new JobCategoryServiceImpl();
            jobCategoryList = dao.findAll();
        }
        return jobCategoryList;
    }

    public static List< EmploymentStatus> getEmploymentStatus() {
        if (employmentStatusList.isEmpty()) {

            EmploymentStatusService dao = new EmploymentStatusServiceImpl();
            employmentStatusList = dao.findAll();
        }
        return employmentStatusList;
    }

    public static List< Location> getLocation() {
        if (locationList.isEmpty()) {

            LocationService dao = new LocationServiceImpl();
            locationList = dao.findAll();
        }
        return locationList;
    }

    public static List< Subunit> getSubunit() {
        if (subunitList.isEmpty()) {

            SubunitService dao = new SubunitServiceImpl();
            subunitList = dao.findAll();
        }
        return subunitList;
    }

    public static List< RelationshipType> getRelationshipType() {
        if (relationshipTypeList.isEmpty()) {

            RelationshipType relationshipType = new RelationshipType();
            relationshipType.setCode("Spouse");
            relationshipType.setName("Spouse");
            relationshipTypeList.add(relationshipType);

            relationshipType = new RelationshipType();
            relationshipType.setCode("Child");
            relationshipType.setName("Child");
            relationshipTypeList.add(relationshipType);

            relationshipType = new RelationshipType();
            relationshipType.setCode("Others");
            relationshipType.setName("Others");
            relationshipTypeList.add(relationshipType);

        }
        return relationshipTypeList;
    }

    public static List< MaritalStatus> getMaritalStatus() {
        if (maritalStatusList.isEmpty()) {

            MaritalStatus maritalStatus = new MaritalStatus();
            maritalStatus.setCode("Single");
            maritalStatus.setName("Single");
            maritalStatusList.add(maritalStatus);
            maritalStatus = new MaritalStatus();
            maritalStatus.setCode("Married");
            maritalStatus.setName("Married");
            maritalStatusList.add(maritalStatus);

        }
        return maritalStatusList;
    }

    public static List<ImigrationDocType> getImigrationDocType() {
        if (imigrationDocTypeList.isEmpty()) {
            ImigrationDocType imigrationDocType = new ImigrationDocType();
            imigrationDocType.setCode("Passport");
            imigrationDocType.setName("Passport");
            imigrationDocTypeList.add(imigrationDocType);
            imigrationDocType = new ImigrationDocType();
            imigrationDocType.setCode("Visa");
            imigrationDocType.setName("Visa");
            imigrationDocTypeList.add(imigrationDocType);
        }
        return imigrationDocTypeList;
    }

    public static List< Gender> getGender() {
        if (genderList.isEmpty()) {

            Gender gender = new Gender();
            short c = 1;
            gender.setCode(c);
            gender.setName("Male");
            genderList.add(gender);

            gender = new Gender();
            c = 0;
            gender.setCode(c);
            gender.setName("Female");
            genderList.add(gender);

        }
        return genderList;
    }

    public static List< CurrencyType> getCurrencyType() {
        if (currencyTypeList.isEmpty()) {

            CurrencyTypeService dao = new CurrencyTypeServiceImpl();
            currencyTypeList = dao.findAll();
        }
        return currencyTypeList;
    }

    public static List< Country> getCountry() {
        if (countryList.isEmpty()) {

            CountryService dao = new CountryServiceImpl();
            countryList = dao.findAll();
        }
        return countryList;
    }

    public static List< Nationality> getNationality() {
        if (nationalityList.isEmpty()) {
            NationalityService dao = new NationalityServiceImpl();
            nationalityList = dao.findAll();
        }
        return nationalityList;
    }

    public static List< Payperiod> getPayperiod() {
        if (payperiodList.isEmpty()) {
            PayperiodService dao = new PayperiodServiceImpl();
            payperiodList = dao.findAll();
        }
        return payperiodList;
    }

    public static List<PayGrade> getPayGrade() {
        if (payGradeList.isEmpty()) {
            PayGradeService dao = new PayGradeServiceImpl();
            payGradeList = dao.findAll();
        }
        return payGradeList;
    }
    
    public static List< AstBrand> getAstBrand() {
        if (astBrandList.isEmpty()) {

            AstBrandService dao = new AstBrandServiceImpl();
            astBrandList = dao.findAll();
        }
        return astBrandList;
    }
    
    public static List< AstCategory> getAstCategory() {
        if (astCategoryList.isEmpty()) {

            AstCategoryService dao = new AstCategoryServiceImpl();
            astCategoryList = dao.findAll();
        }
        return astCategoryList;
    }
    
    public static List< AstVendor> getAstVendor() {
        if (astVendorList.isEmpty()) {

            AstVendorService dao = new AstVendorServiceImpl();
            astVendorList = dao.findAll();
        }
        return astVendorList;
    }
    
    public static List< AstStatus> getAstStatus() {
        if (astStatusList.isEmpty()) {

            AstStatusService dao = new AstStatusServiceImpl();
            astStatusList = dao.findAll();
        }
        return astStatusList;
    }

}
