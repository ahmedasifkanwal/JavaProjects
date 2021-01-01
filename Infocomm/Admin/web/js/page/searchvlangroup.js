
setTimeout(function () {
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
                'vlanId': $("#vlanId").val(),
                'ownerName': $("#ownerName").val(),
                'reportId': 'RPT_VLAN_GROUP',
            };



    $.ajax({
        type: "POST",
        url: "json/JsonLocationGroup.jsp?data=" + JSON.stringify(data),
        data: JSON.stringify(data),
        contentType: "application/html",
        success: function (data) {

            var output = $.parseJSON(data);

            $('#datatable').html(output.datatable);


            jQuery('#ImgProcessing').css("display", "none");
            x = 0;
        }
        ,
        error: function () {
            alert("There is error.Please try again.");
            jQuery('#ImgProcessing').css("display", "none");
        }
    });


}, 100);


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
                        'vlanId': $("#vlanId").val(),
                        'ownerName': $("#ownerName").val(),
                        'reportId': 'RPT_VLAN_GROUP',
                    };



            $.ajax({
                type: "POST",
                url: "json/JsonLocationGroup.jsp?data=" + JSON.stringify(data),
                data: JSON.stringify(data),
                contentType: "application/html",
                success: function (data) {

                    var output = $.parseJSON(data);

                    $('#datatable').html(output.datatable);


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