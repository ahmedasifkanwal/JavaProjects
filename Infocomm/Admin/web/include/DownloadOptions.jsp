<script type="text/javascript">

    function findpdf(format) {
        $("#downloadIcon").css("display", "inline");



        var data =
                {
                    'fromDate': $("#datepicker-icon").val(),
                    'fromDateTime': $("#fromDateTime").val(),
                    'fromDateTimeMin': $("#fromDateTimeMin").val(),
                    'toDate': $("#datepicker-icon1").val(),
                    'toDateTime': $("#toDateTime").val(),
                    'toDateTimeMin': $("#toDateTimeMin").val(),
                    'username': $("#username").val(),
                    'useripIp1': $("#useripIp1").val(),
                    'serveripIp2': $("#serveripIp2").val(),
                    'macadds': $("#macadds").val(),
                    'host': $("#host").val(),
                    'uri': $("#uri").val(),
                    'location': $("#location").val(),
                    'reportTypeValue': $("#reportTypeValue").val(),
                    'peVlanLoction': $("#peVlanLoction").val(),
                    'httpPostGet': $("#httpPostGet").val(),
                    'format': format,
                    'reportId': $("#reportId").val(),
                    'role': $("#CURRENT_ROLE").val(),
                    'pdfsize': $("#pdfsize").val(),
                    'csvsize': $("#csvsize").val(),
                    'month': $("#month").val(),
                    'year': $("#year").val()
                };
        $.ajax({
            type: "POST",
            url: "JsonReportBase.jsp?data=" + JSON.stringify(data),
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (data) {
                var output = $.parseJSON(data);
                //alert(output.reportLink);
                $("#downloadIcon").css("display", "none");
                if (output.reportLink == null)
                {
                  //  alert(output.message);
                    return false;
                }

                window.open(output.reportLink, "yyyyy", "width=480,height=360,resizable=no,toolbar=no,menubar=no,location=no,status=no");

            }
        });
        return false;
    }

</script>

<div align="right">
    <span id="downloadIcon" style="display:none">
        <img alt=""  src="img/elements/loaders/6s.gif" > <b style="margin-left: 5px; margin-right: 5px;">Processing ...</b>
    </span>
    <a     onclick="findpdf('pdf')"   class="btn btn-primary" >
        <span class="fam-page-white-acrobat"></span>PDF</a>
    <a     onclick="findpdf('csv')"     class="btn btn-primary" >
        <span class="fam-page-white-c"></span>CSV</a>

</div>
