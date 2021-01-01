setTimeout(function () {
    var data =
            {
                'vlanId': $("#vlanId").val(),
                'ownerName': $("#ownerName").val(),
                'status': $("#status").val(),
                'mobile': $("#mobile").val(),
                'reportId': 'RPT_VLAN',
            };
    var x = 0;
    setInterval(function () {
        x++;
        $('#ImgProcessingtime').html(x);
    }, 1000);

    jQuery('#ImgProcessing').css("display", "inline");

    $.ajax({
        type: "POST",
        url: "json/JsonLocation.jsp?data=" + JSON.stringify(data),
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

            var data =
                    {
                        'vlanId': $("#vlanId").val(),
                        'ownerName': $("#ownerName").val(),
                        'status': $("#status").val(),
                        'mobile': $("#mobile").val(),
                        'reportId': 'RPT_VLAN',
                    };
            var x = 0;
            setInterval(function () {
                x++;
                $('#ImgProcessingtime').html(x);
            }, 1000);

            jQuery('#ImgProcessing').css("display", "inline");

            $.ajax({
                type: "POST",
                url: "json/JsonLocation.jsp?data=" + JSON.stringify(data),
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