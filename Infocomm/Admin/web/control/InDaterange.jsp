
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
<div class="col-sm-2 col-md-3" >
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

           


               





