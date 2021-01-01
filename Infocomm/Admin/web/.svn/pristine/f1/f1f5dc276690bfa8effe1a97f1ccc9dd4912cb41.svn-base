
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />
<script type="text/javascript" src="../js/jquery.timer.js"></script>

<script type="text/javascript" src="../js/jquery.min.js"></script>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>
                    <div class="form-group pull-right">
                        <jsp:include flush=""  page="../include/CSVImport.jsp"></jsp:include>
                            <label class="radio-inline text-blue">
                                <input class="radio" type="radio"  name="historicaldata"   id="chkcurrent"  checked>
                                Current </label>
                            <label class="radio-inline text-blue">
                                <input class="radio" type="radio" id="chkhistorical"  name="historicaldata"  >
                                Historical </label>



                        </div>
                    </div>

                <s:form action="outgoingsms.icms"  theme="simple"   >
                    <jsp:include page="../include/ChartComponents.jsp"/>

                    <div class="container"  >
                        <div class="row" style="margin-top: 5px ">

                            <jsp:include page="../control/InDaterange.jsp"></jsp:include>


                                <div class="row">



                                    <div class="col-sm-2 col-md-2">
                                        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:80% " data-toggle="tooltip" title="" data-original-title="Please Enter Passport Number" data-placement="bottom">
                                            <div class="console-icon divider-right" >
                                                <span class="glyphicons glyphicons-barcode" ></span> </div>
                                            <div class="console-text">
                                                <div class="console-subtitle pull-right" >


                                                <s:textfield  id="param1"  name="param1" maxLength="50" cssStyle="width:100px"   cssClass="form-control"    />


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Select Gender" data-placement="bottom">
                                        <div class="console-icon divider-right" >
                                            <span class="glyphicons glyphicons-user" ></span> </div>
                                        <div class="console-text">

                                            <div class="console-subtitle pull-right" >
                                                <s:select   cssStyle="width:120px"   headerKey=""  headerValue="ALL"   cssClass="form-control"    id="gender" name="gender"  list="peGenderList" listKey="code" listValue="value" ></s:select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>           

                                    <div class="col-sm-2 col-md-2">
                                        <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:80% " data-toggle="tooltip" title="" data-original-title="Please Enter Issue Country Code" data-placement="bottom">
                                            <div class="console-icon divider-right" >
                                                <span class="glyphicons glyphicons-globe" ></span> </div>
                                            <div class="console-text">
                                                <div class="console-subtitle pull-right" >

                                                <s:select   cssStyle="width:120px"   headerKey=""  headerValue="ALL"   cssClass="form-control"    id="param2" name="param2"  list="countryList" listKey="nationalityCode" listValue="countryName" ></s:select>




                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-2 col-md-2">
                                        <div class="console-btn" style="color:#33cccc ;padding: 1px 1px 1px 10px ;border-radius:5px;width:90%" data-toggle="tooltip" title="" data-original-title="Click here to Refresh" data-placement="bottom">
                                            <div class="console-icon divider-right" >
                                                <span class="glyphicons glyphicons-refresh" ></span> </div>
                                            <div class="console-text">

                                                <div class="console-subtitle pull-right">
                                                    <button id="refresh"   type="button"  class= "btn btn-info ladda-button" data-style="expand-left" >Refresh</button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>          


                                <jsp:include page="../control/WaitControl.jsp"></jsp:include>
                                </div>
                            </div>
                        </div>
                        <div class="table-total-count" style="width: 98%;margin-left: 20px ;" ></div>
                        <div class="table-responsive" style="width: 98%;margin-left: 20px ;" >
                            <table class="table table-bordered table-responsive" style="text-align: center">
                                <thead >
                                    <tr >
                                        <th style='text-align:center'>#</th>
                                        <th style="text-align:center">Table heading</th>
                                        <th style="text-align:center"  >Table heading</th>
                                        <th style="text-align:center"  >Table heading</th>
                                        <th  style="text-align:center">Table heading</th>
                                        <th  style="text-align:center" >Table heading</th>
                                        <th  style="text-align:center">Table heading</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
        </s:form>



    </div>


</div>


<script type="text/javascript">




    (function ($) {
        $(function () {

            $("#refresh").click(function ()
            {
                var x = 0;
                setInterval(function () {
                    x++;
                    $('#ImgProcessingtime').html(x);
                }, 1000);
                var expired = false;
                if ($("#chkhistorical").is(':checked'))
                {
                    expired = true;

                }

                jQuery('#ImgProcessing').css("display", "inline");

                var data =
                        {
                            'daterange': $("#daterange").val(),
                            'param1': $("#param1").val(),
                            'param2': $("#param2").val(),
                            'gender': $("#gender").val(),
                            
                            'expired': expired


                        };


                $.ajax({
                    type: "POST",
                    url: "json/JsonKioskWifiAccount.jsp?data=" + JSON.stringify(data),
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function (data) {

                        var output = $.parseJSON(data);
                        $('.table-responsive').html(output.datatable);
                        $('.table-total-count').html("<b>Total Count : </b>" + output.totalCount);
                        jQuery('#ImgProcessing').css("display", "none");
                        x = 0;
                    }
                    ,
                    error: function () {
                        alert("There is error.Please try again.");
                        jQuery('#ImgProcessing').css("display", "none");
                    }
                });
            }
            );



        });
    })(jQuery);

</script>
