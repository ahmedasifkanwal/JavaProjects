
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<div class="form-group">
    <s:label key="Role" cssClass="col-lg-2 control-label" />
    <div class="star1"><span class="mandatorySymbol">*</span></div>
    <div class="col-lg-8">
        <s:select cssClass="form-control"  headerKey=""  headerValue="Select Role" id="authority"  name="authority" list="authorityList"
                  listKey="authority" listValue="title"   onchange="getResseler(this)"></s:select>
        <s:fielderror   fieldName="role" />
    </div>
</div>


        <s:if test="authority ==null  or authority .equals(\"Advertiser\") ">
            <div class="form-group" id="html_reseller_main"  >
                <s:label key="LE41" cssClass="col-lg-2 control-label" />
        <div class="star1"><span class="mandatorySymbol">*</span></div>
        <div class="col-lg-8"   id="html_resellerlist">
            <div   >
                <s:select   headerValue="Select Business " cssClass="form-control"  headerKey="" id="ownerName" name="ownerName" list="peHotspotOwnerList"
                            listKey="ownerName" listValue="ownerName"></s:select>
            </div>
            <s:fielderror   fieldName="reseller" />
        </div>

    </div>
</s:if>

        <s:if test="authority ==null  or !authority .equals(\"Advertiser\") ">
            <div class="form-group" id="html_reseller_main"  style=" display: none" >
                <s:label key="LE41" cssClass="col-lg-2 control-label" />
        <div class="star1"><span class="mandatorySymbol">*</span></div>
        <div class="col-lg-8"   id="html_resellerlist">
            <div   >

            </div>
            <s:fielderror   fieldName="reseller" />
        </div>

    </div>
</s:if>


