<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script type="text/javascript">
    function selectAll() {
        $("#vlanId").click(function () {

            if ($("#vlanId").val() == ""  )
            {


                $('#vlanId option').prop('selected', true);
            }
        });
    }
  /*  $(document).ready(function () {
        $("#vlanId").click(function () {
            //   alert('Asif :'+ $("#vlanId").val());
            if ( $("#vlanId").val() == "" )
            {


                $('#vlanId option').prop('selected', true);
            }
        });
    });*/
    function getVlans(owner)
    {

        $.ajax({
            type: "GET",
            url: "json/JsonGeneric.jsp?action=GET_VLAN_LIST&owner=" + owner.value,
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
<div class="row" style="margin-top: 5px ">
    <div class="col-sm-4 col-md-4" >
        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 10px;border-radius:5px;width:90%;margin-left:14px " data-toggle="tooltip" title="" data-original-title="Please Select Date Range." data-placement="bottom">
            <div class="console-icon divider-right" >
                <span class="glyphicons glyphicons-calendar" ></span> </div>
            <div class="console-text">
                <div class="console-title pull-right">

                    <s:textfield id="daterange"   cssClass="form-control margin-top-none"  name="daterange"/>
                </div>

            </div>
        </div>
    </div>

    <div class="col-sm-4 col-md-4">
        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Business Owner" data-placement="bottom">
            <div class="console-icon divider-right" >
                <span class="glyphicons glyphicons-building" ></span> </div>
            <div class="console-text">

                <div class="console-subtitle pull-right" >
                    <s:select  onchange="getVlans(this)" cssStyle="width:120px"   headerKey=""  headerValue="ALL"   cssClass="form-control"    id="ownerName" name="ownerName"  list="peHotspotOwnerList" listKey="ownerName" listValue="ownerName"  ></s:select>

                    </div>
                </div>
            </div>
        </div>


        <div class="col-sm-4 col-md4">
            <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Vlan" data-placement="bottom">
                <div class="console-icon divider-right" >
                    <span class="glyphicons glyphicons-google_maps" ></span> </div>
                <div class="console-text">
                    <div class="console-subtitle pull-right" id="html_vlanlist">
                    <s:select headerKey=""  cssStyle="width:300px"   headerValue="ALL"   multiple='true'  size='5'   cssClass="form-control"  id="vlanId" name="vlanId" list="peVlanList" listKey="vlanId" listValue="vlanName" onchange='selectAll()'></s:select>
                    </div>
                </div>
            </div>
        </div>   </div>
    <div class="row" style="margin-top: 5px ">
        <div class="col-sm-4 col-md-4">
            <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 10px;border-radius:5px;width:90%;margin-left:14px " data-toggle="tooltip" title="" data-original-title="Please Select Select Filter." data-placement="bottom">


                <div class="console-icon divider-right" >
                    <span class="glyphicons glyphicons-filter" ></span> </div>
                <div class="console-text">
                    <div class="console-subtitle pull-right">
                    <s:select  cssStyle="width:100px"      cssClass="form-control"  id="durationType" name="durationType" list="peDurationTypeList" listKey="durationType" listValue="displayValue" ></s:select>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4 col-md-4">
            <div class="console-btn" style="color:#33cccc ;padding: 1px 1px 1px 10px ;border-radius:5px;width:90%" data-toggle="tooltip" title="" data-original-title="Click here to Refresh" data-placement="bottom">
            <jsp:include page="../control/WaitControl.jsp"></jsp:include>
            <div class="console-icon divider-right" >
                <span class="glyphicons glyphicons-refresh" ></span> </div>
            <div class="console-text">

                <div class="console-subtitle pull-right">
                    <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>

                </div>
            </div>
        </div>
    </div>

</div>