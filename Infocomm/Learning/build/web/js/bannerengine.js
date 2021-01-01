

//
function ilasImageEngine(mac, vlan, page, action, slideshow, slideshow1, slideshow2, slideshow3)

{

    $.ajax({
        type: "GET",
        url: "json/iLasApi.jsp?action=" + action + "&mac=" + mac + "&vlan=" + vlan + "&page=" + page,
        success: function (data) {
            var output = $.parseJSON(data);

            if (output.RESULT_CODE == 0)
            {
                if (output.slideshow != '')
                {
                    $("#" + slideshow).show();
                    $("#" + slideshow).html(output.slideshow);
                    $("#slideshow").slippry();
                }
                if (output.slideshow1 != '')
                {

                    $("#" + slideshow1).show();
                    $("#" + slideshow1).html(output.slideshow1);
                    $("#" + slideshow1).slippry();
                }
                if (output.slideshow2 != '')
                {

                    $("#" + slideshow2).show();
                    $("#" + slideshow2).html(output.slideshow2);
                    $("#" + slideshow2).slippry();
                }

                //$("#"+slideshow3).show();
                // $("#"+slideshow3).html(output.RESULT_IMAGE_BANNER_RIGHT); 
                // var bannerTimer4=setInterval(loadAd(),1000); 
                // clearInterval(timer);
                return false;
            } else {
                alert(output.RESULT_CODE);
                $("#" + slideshow).show();
                $("#" + slideshow1).show();
                $("#" + slideshow2).show();
                // $("#"+slideshow3).show();
            }
        }
    });

}