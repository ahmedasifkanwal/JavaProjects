/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.common.helper.ReferenceData;
import com.bytes.hrm.dao.common.Competency;
import com.bytes.hrm.dao.common.Fluency;
import com.bytes.hrm.dao.common.Gender;
import com.bytes.hrm.dao.common.ImigrationDocType;
import com.bytes.hrm.dao.common.MaritalStatus;
import com.bytes.hrm.dao.common.RelationshipType;
import com.bytes.hrm.dao.common.SysParentAuthority;
import com.bytes.hrm.dao.entity.Country;
import com.bytes.hrm.dao.entity.CurrencyType;
import com.bytes.hrm.dao.entity.Education;
import com.bytes.hrm.dao.entity.EmpReportingMethod;
import com.bytes.hrm.dao.entity.EmploymentStatus;
import com.bytes.hrm.dao.entity.JobCategory;
import com.bytes.hrm.dao.entity.JobTitle;
import com.bytes.hrm.dao.entity.Language;
import com.bytes.hrm.dao.entity.LeaveEntitlementType;
import com.bytes.hrm.dao.entity.LeaveType;
import com.bytes.hrm.dao.entity.License;
import com.bytes.hrm.dao.entity.Location;
import com.bytes.hrm.dao.entity.Membership;
import com.bytes.hrm.dao.entity.Nationality;
import com.bytes.hrm.dao.entity.OperationalCountry;
import com.bytes.hrm.dao.entity.PayGrade;
import com.bytes.hrm.dao.entity.Payperiod;
import com.bytes.hrm.dao.entity.Skill;
import com.bytes.hrm.dao.entity.Subunit;

import com.bytes.hrm.dao.entity.AstBrand;
import com.bytes.hrm.dao.entity.AstCategory;
import com.bytes.hrm.dao.entity.AstVendor;
import com.bytes.hrm.dao.entity.AstStatus;

import com.bytes.hrm.dao.entity.SysAuthorities;

import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class RefDto implements Serializable {

    /**
     * @return the sysAuthoritiesList
     */
    public List< SysAuthorities> getSysAuthoritiesList() {
        return sysAuthoritiesList;
    }

    /**
     * @param sysAuthoritiesList the sysAuthoritiesList to set
     */
    public void setSysAuthoritiesList(List< SysAuthorities> sysAuthoritiesList) {
        this.sysAuthoritiesList = sysAuthoritiesList;
    }

    /**
     * @return the dayLengthList
     */
    public List< DayLengthDto> getDayLengthList() {
        return dayLengthList;
    }

    /**
     * @param dayLengthList the dayLengthList to set
     */
    public void setDayLengthList(List< DayLengthDto> dayLengthList) {
        this.dayLengthList = dayLengthList;
    }

    /**
     * @return the sysParentAuthorityList
     */
    public List< SysParentAuthority> getSysParentAuthorityList() {
        return sysParentAuthorityList;
    }

    /**
     * @param sysParentAuthorityList the sysParentAuthorityList to set
     */
    public void setSysParentAuthorityList(List< SysParentAuthority> sysParentAuthorityList) {
        this.sysParentAuthorityList = sysParentAuthorityList;
    }

    /**
     * @return the skillList
     */
    public List< Skill> getSkillList() {
        return skillList;
    }

    /**
     * @param skillList the skillList to set
     */
    public void setSkillList(List< Skill> skillList) {
        this.skillList = skillList;
    }

    /**
     * @return the educationList
     */
    public List< Education> getEducationList() {
        return educationList;
    }

    /**
     * @param educationList the educationList to set
     */
    public void setEducationList(List< Education> educationList) {
        this.educationList = educationList;
    }

    /**
     * @return the leaveEntitlementTypeList
     */
    public List< LeaveEntitlementType> getLeaveEntitlementTypeList() {
        return leaveEntitlementTypeList;
    }

    /**
     * @param leaveEntitlementTypeList the leaveEntitlementTypeList to set
     */
    public void setLeaveEntitlementTypeList(List< LeaveEntitlementType> leaveEntitlementTypeList) {
        this.leaveEntitlementTypeList = leaveEntitlementTypeList;
    }

    /**
     * @return the leaveTypeList
     */
    public List< LeaveType> getLeaveTypeList() {
        return leaveTypeList;
    }

    /**
     * @param leaveTypeList the leaveTypeList to set
     */
    public void setLeaveTypeList(List< LeaveType> leaveTypeList) {
        this.leaveTypeList = leaveTypeList;
    }

    /**
     * @return the fluencyList
     */
    public List< Fluency> getFluencyList() {
        return fluencyList;
    }

    /**
     * @param fluencyList the fluencyList to set
     */
    public void setFluencyList(List< Fluency> fluencyList) {
        this.fluencyList = fluencyList;
    }

    /**
     * @return the competencyList
     */
    public List< Competency> getCompetencyList() {
        return competencyList;
    }

    /**
     * @param competencyList the competencyList to set
     */
    public void setCompetencyList(List< Competency> competencyList) {
        this.competencyList = competencyList;
    }

    /**
     * @return the membershipList
     */
    public List< Membership> getMembershipList() {
        return membershipList;
    }

    /**
     * @param membershipList the membershipList to set
     */
    public void setMembershipList(List< Membership> membershipList) {
        this.membershipList = membershipList;
    }

    /**
     * @return the payGradeList
     */
    public List< PayGrade> getPayGradeList() {
        return payGradeList;
    }

    /**
     * @param payGradeList the payGradeList to set
     */
    public void setPayGradeList(List< PayGrade> payGradeList) {
        this.payGradeList = payGradeList;
    }

    /**
     * @return the payperiodList
     */
    public List< Payperiod> getPayperiodList() {
        return payperiodList;
    }

    /**
     * @param payperiodList the payperiodList to set
     */
    public void setPayperiodList(List< Payperiod> payperiodList) {
        this.payperiodList = payperiodList;
    }

    /**
     * @return the jobTitleList
     */
    public List< JobTitle> getJobTitleList() {
        return jobTitleList;
    }

    /**
     * @param jobTitleList the jobTitleList to set
     */
    public void setJobTitleList(List< JobTitle> jobTitleList) {
        this.jobTitleList = jobTitleList;
    }

    /**
     * @return the jobCategoryList
     */
    public List< JobCategory> getJobCategoryList() {
        return jobCategoryList;
    }

    /**
     * @param jobCategoryList the jobCategoryList to set
     */
    public void setJobCategoryList(List< JobCategory> jobCategoryList) {
        this.jobCategoryList = jobCategoryList;
    }

    /**
     * @return the employmentStatusList
     */
    public List< EmploymentStatus> getEmploymentStatusList() {
        return employmentStatusList;
    }

    /**
     * @param employmentStatusList the employmentStatusList to set
     */
    public void setEmploymentStatusList(List< EmploymentStatus> employmentStatusList) {
        this.employmentStatusList = employmentStatusList;
    }

    /**
     * @return the locationList
     */
    public List< Location> getLocationList() {
        return locationList;
    }

    /**
     * @param locationList the locationList to set
     */
    public void setLocationList(List< Location> locationList) {
        this.locationList = locationList;
    }

    /**
     * @return the subunitList
     */
    public List< Subunit> getSubunitList() {
        return subunitList;
    }

    /**
     * @param subunitList the subunitList to set
     */
    public void setSubunitList(List< Subunit> subunitList) {
        this.subunitList = subunitList;
    }

    /**
     * @return the currencyTypeList
     */
    public List< CurrencyType> getCurrencyTypeList() {
        return currencyTypeList;
    }

    /**
     * @param currencyTypeList the currencyTypeList to set
     */
    public void setCurrencyTypeList(List< CurrencyType> currencyTypeList) {
        this.currencyTypeList = currencyTypeList;
    }

    /**
     * @return the countryList
     */
    public List< Country> getCountryList() {
        return countryList;
    }

    /**
     * @param countryList the countryList to set
     */
    public void setCountryList(List< Country> countryList) {
        this.countryList = countryList;
    }

    /**
     * @return the genderList
     */
    public List< Gender> getGenderList() {
        return genderList;
    }

    /**
     * @param genderList the genderList to set
     */
    public void setGenderList(List< Gender> genderList) {
        this.genderList = genderList;
    }

    /**
     * @return the nationalityList
     */
    public List< Nationality> getNationalityList() {
        return nationalityList;
    }

    /**
     * @param nationalityList the nationalityList to set
     */
    public void setNationalityList(List< Nationality> nationalityList) {
        this.nationalityList = nationalityList;
    }

    /**
     * @return the maritalStatusList
     */
    public List< MaritalStatus> getMaritalStatusList() {
        return maritalStatusList;
    }

    /**
     * @param maritalStatusList the maritalStatusList to set
     */
    public void setMaritalStatusList(List< MaritalStatus> maritalStatusList) {
        this.maritalStatusList = maritalStatusList;
    }

    /**
     * @return the relationshipTypeList
     */
    public List< RelationshipType> getRelationshipTypeList() {
        return relationshipTypeList;
    }

    /**
     * @param relationshipTypeList the relationshipTypeList to set
     */
    public void setRelationshipTypeList(List< RelationshipType> relationshipTypeList) {
        this.relationshipTypeList = relationshipTypeList;
    }

    /**
     * @return the imigrationDocTypeList
     */
    public List< ImigrationDocType> getImigrationDocTypeList() {
        return imigrationDocTypeList;
    }

    /**
     * @param imigrationDocTypeList the imigrationDocTypeList to set
     */
    public void setImigrationDocTypeList(List< ImigrationDocType> imigrationDocTypeList) {
        this.imigrationDocTypeList = imigrationDocTypeList;
    }
    private List< CurrencyType> currencyTypeList = new ArrayList<>();
    private List< Country> countryList = new ArrayList<>();
    private List<Gender> genderList = new ArrayList<>();
    private List< Nationality> nationalityList = new ArrayList<>();
    private List< MaritalStatus> maritalStatusList = new ArrayList<>();
    private List< RelationshipType> relationshipTypeList = new ArrayList<>();
    private List< ImigrationDocType> imigrationDocTypeList = new ArrayList<>();
    private List< JobTitle> jobTitleList = new ArrayList<>();
    private List< JobCategory> jobCategoryList = new ArrayList<>();
    private List< EmploymentStatus> employmentStatusList = new ArrayList<>();
    private List< Location> locationList = new ArrayList<>();
    private List< Subunit> subunitList = new ArrayList<>();
    private List< EmpReportingMethod> empReportingMethodList = new ArrayList<>();
    private List< Payperiod> payperiodList = new ArrayList<>();
    private List<PayGrade> payGradeList = new ArrayList<>();
    private List< Membership> membershipList = new ArrayList<>();
    private List< Fluency> fluencyList = new ArrayList<>();
    private List< Competency> competencyList = new ArrayList<>();
    private List< LeaveType> leaveTypeList = new ArrayList<>();
    private List< LeaveEntitlementType> leaveEntitlementTypeList = new ArrayList<>();
    private List< Language> languageList = new ArrayList<>();
    private List< License> licenseList = new ArrayList<>();
    private List< Skill> skillList = new ArrayList<>();
    private List< OperationalCountry> operationalCountryList = new ArrayList<>();
    private List< Education> educationList = new ArrayList<>();
    private List< DayLengthDto> dayLengthList = new ArrayList<>();
    private List< SysParentAuthority> sysParentAuthorityList = new ArrayList<>();
    
    private List< AstBrand> astBrandList = new ArrayList<>();
    private List< AstCategory> astCategoryList = new ArrayList<>();
    private List< AstVendor> astVendorList = new ArrayList<>();
    private List< AstStatus> astStatusList = new ArrayList<>();


    private  List< SysAuthorities> sysAuthoritiesList = new ArrayList<>();

    public void initializeReferenceData() {
        //Set Static Data

        educationList = ReferenceData.getEducation();
        leaveTypeList = ReferenceData.getLeaveType();
        currencyTypeList = ReferenceData.getCurrencyType();
        countryList = ReferenceData.getCountry();
        genderList = ReferenceData.getGender();
        nationalityList = ReferenceData.getNationality();
        maritalStatusList = ReferenceData.getMaritalStatus();
        relationshipTypeList = ReferenceData.getRelationshipType();
        imigrationDocTypeList = ReferenceData.getImigrationDocType();
        jobTitleList = ReferenceData.getJobTitle();
        jobCategoryList = ReferenceData.getJobCategory();
        employmentStatusList = ReferenceData.getEmploymentStatus();
        locationList = ReferenceData.getLocation();
        subunitList = ReferenceData.getSubunit();
        payperiodList = ReferenceData.getPayperiod();
        payGradeList = ReferenceData.getPayGrade();
        empReportingMethodList = ReferenceData.getEmpReportingMethod();
        membershipList = ReferenceData.getMembership();
        fluencyList = ReferenceData.getFluency();
        competencyList = ReferenceData.getCompetency();
        leaveEntitlementTypeList = (ReferenceData.getLeaveEntitlementType());
        setAstBrandList(ReferenceData.getAstBrand());
        setAstVendorList(ReferenceData.getAstVendor());
        setAstCategoryList(ReferenceData.getAstCategory());
        setAstStatusList(ReferenceData.getAstStatus());

        languageList = ReferenceData.getLanguage();
        licenseList = ReferenceData.getLicense();
        operationalCountryList = (ReferenceData.getOperationalCountry());
        skillList = ReferenceData.getSkill();

        dayLengthList = ReferenceData.getDayLength();
        sysParentAuthorityList = ReferenceData.getSysParentAuthority();
       sysAuthoritiesList=ReferenceData.getSysAuthorities();
        //Set Static Data
    }

    public void resetReferenceData(Type type) {
        //Set Static Data

        if (JobTitle.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.jobTitleList.clear();
        }

        if (PayGrade.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.payGradeList.clear();
        }
        if (CurrencyType.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.currencyTypeList.clear();
        }
        if (Country.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.countryList.clear();
        }

        if (Nationality.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.nationalityList.clear();
        }
        if (OperationalCountry.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.operationalCountryList.clear();
        }
         if (SysAuthorities.class.getCanonicalName().equals(type.getTypeName())) {
            ReferenceData.sysAuthoritiesList.clear();
        }

        sysAuthoritiesList=ReferenceData.getSysAuthorities();
        maritalStatusList = ReferenceData.getMaritalStatus();
        relationshipTypeList = ReferenceData.getRelationshipType();
        imigrationDocTypeList = ReferenceData.getImigrationDocType();
        genderList = ReferenceData.getGender();
        setOperationalCountryList(ReferenceData.getOperationalCountry());
        //
    }

    public static void main(String[] arg) {
        CurrencyType obj = new CurrencyType();

        Type t = obj.getClass();

        System.out.println("com.bytes.hrm.dto.common.RefDto.main()" + t.getTypeName());
        System.out.println(CurrencyType.class.getCanonicalName());
        List< ImigrationDocType> imigrationDocTypeList = new ArrayList<>();

    }

    /**
     * @return the empReportingMethodList
     */
    public List< EmpReportingMethod> getEmpReportingMethodList() {
        return empReportingMethodList;
    }

    /**
     * @param empReportingMethodList the empReportingMethodList to set
     */
    public void setEmpReportingMethodList(List< EmpReportingMethod> empReportingMethodList) {
        this.empReportingMethodList = empReportingMethodList;
    }

    /**
     * @return the languageList
     */
    public List< Language> getLanguageList() {
        return languageList;
    }

    /**
     * @param languageList the languageList to set
     */
    public void setLanguageList(List< Language> languageList) {
        this.languageList = languageList;
    }

    /**
     * @return the licenseList
     */
    public List< License> getLicenseList() {
        return licenseList;
    }

    /**
     * @param licenseList the licenseList to set
     */
    public void setLicenseList(List< License> licenseList) {
        this.licenseList = licenseList;
    }

    /**
     * @return the operationalCountryList
     */
    public List< OperationalCountry> getOperationalCountryList() {
        return operationalCountryList;
    }

    /**
     * @param operationalCountryList the operationalCountryList to set
     */
    public void setOperationalCountryList(List< OperationalCountry> operationalCountryList) {
        this.operationalCountryList = operationalCountryList;
    }

    /**
     * @return the astBrandList
     */
    public List< AstBrand> getAstBrandList() {
        return astBrandList;
    }

    /**
     * @param astBrandList the astBrandList to set
     */
    public void setAstBrandList(List< AstBrand> astBrandList) {
        this.astBrandList = astBrandList;
    }

    /**
     * @return the astCategoryList
     */
    public List< AstCategory> getAstCategoryList() {
        return astCategoryList;
    }

    /**
     * @param astCategoryList the astCategoryList to set
     */
    public void setAstCategoryList(List< AstCategory> astCategoryList) {
        this.astCategoryList = astCategoryList;
    }

    /**
     * @return the astVendorList
     */
    public List< AstVendor> getAstVendorList() {
        return astVendorList;
    }

    /**
     * @param astVendorList the astVendorList to set
     */
    public void setAstVendorList(List< AstVendor> astVendorList) {
        this.astVendorList = astVendorList;
    }

    /**
     * @return the astStatusList
     */
    public List< AstStatus> getAstStatusList() {
        return astStatusList;
    }

    /**
     * @param astStatusList the astStatusList to set
     */
    public void setAstStatusList(List< AstStatus> astStatusList) {
        this.astStatusList = astStatusList;
    }


}
