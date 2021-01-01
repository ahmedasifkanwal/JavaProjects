<%-- 
    Document   : details
    Created on : Nov 28, 2012, 4:13:30 PM
    Author     : mohd rehan
--%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="entityId != '' && entityId == 'bill_package'" >
    <div class="form-group">
        <s:label key="LE07" cssClass="col-lg-2 control-label" />
        <div class="star1"></div>
        <div class="col-lg-8">
            <s:textarea name="remarks" maxLength="45"  rows="2" cssClass="form-control"    />
        </div>
    </div>
</s:if> 

<s:if test="entityId != '' && entityId == 'bill_plan'" >
    <div class="form-group">
        <s:label key="LE05" cssClass="col-lg-2 control-label" />
        <div class="star1"><span class="mandatorySymbol">*</span></div>
        <div class="col-lg-8">
            <s:textfield name="amount" maxLength="10"   cssClass="form-control"    />
            <s:fielderror   fieldName="amount" />
        </div>
    </div>  

    <div class="form-group">
        <s:label key="LE06" cssClass="col-lg-2 control-label" />
        <div class="star1"><span class="mandatorySymbol">*</span></div>
        <div class="col-lg-8">
            <s:textfield name="packageId" maxLength="10"   cssClass="form-control"    />
            <s:fielderror   fieldName="packageId" />
        </div>
    </div>
</s:if> 
<s:if test="entityId != '' && entityId == 'bill_setup_fee'" >
    <div class="form-group">
        <s:label key="LE05" cssClass="col-lg-2 control-label" />
        <div class="star1"><span class="mandatorySymbol">*</span></div>
        <div class="col-lg-8">
            <s:textfield name="amount" maxLength="10"   cssClass="form-control"    />
            <s:fielderror   fieldName="amount" />
        </div>
    </div>  
 
</s:if> 

<s:if test="entityId != '' && entityId == 'bill_identity_doc'" >
    <div class="form-group">
        <s:label key="Doc Type" cssClass="col-lg-2 control-label" />
         
        <div class="col-lg-8">
           <s:select cssClass="form-control"   name="docType" list="# {'Address':'Address','Identity':'Identity'}"
                                          ></s:select>
            <s:fielderror   fieldName="docType" />
        </div>
    </div>  
 
</s:if>