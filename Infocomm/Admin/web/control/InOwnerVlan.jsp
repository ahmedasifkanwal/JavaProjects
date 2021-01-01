
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script type="text/javascript">

    function getVlans(owner)
    {


        $.ajax({
            type: "GET",
            url: "json/JsonGeneric.jsp?action=GET_VLAN&owner=" + owner.value,
            success: function (data) {
                var output = $.parseJSON(data);
                $("#html_vlanlist").html(output.RESULT);
            }
            ,
            error: function () {
                alert("There is error.");
            }

        });
    }

</script>

            <div class="col-sm-2 col-md-2">
                <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Business Owner" data-placement="bottom">
                    <div class="console-icon divider-right" >
                        <span class="glyphicons glyphicons-building" ></span> </div>
                    <div class="console-text">

            <div class="console-subtitle pull-right" >
                <s:select  onchange="getVlans(this)" cssStyle="width:120px"   headerKey=""  headerValue="ALL"   cssClass="form-control"    id="ownerName" name="ownerName"  list="peHotspotOwnerList" listKey="ownerName" listValue="ownerName" ></s:select>

                </div>
            </div>
        </div>
</div>


                    <div class="col-sm-2 col-md-2">
                        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Vlan" data-placement="bottom">
                            <div class="console-icon divider-right" >
                                <span class="glyphicons glyphicons-google_maps" ></span> </div>
                            <div class="console-text">
                                <div class="console-subtitle pull-right" id="html_vlanlist">
                                <s:select headerKey=""  cssStyle="width:120px"   headerValue="ALL"   cssClass="form-control"  id="vlanId" name="vlanId" list="peVlanList" listKey="vlanId" listValue="vlanName" ></s:select>
                            </div>
                        </div>
                    </div>
                </div>





