/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//Common method to open popup

document.write('<script type="text/javascript" src="js/jquery.min.js"></script>');
//When DOM loaded we attach click event to button
$(document).ready(function() {

    //attach keypress to input
    $('.onlynumber').keydown(function(event) {
        // Allow special chars + arrows
        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                || event.keyCode == 27 || event.keyCode == 13
                || (event.keyCode == 65 && event.ctrlKey === true)
                || (event.keyCode >= 35 && event.keyCode <= 39)) {
            return;
        } else {
            // If it's not a number stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }
    });

});


function getFullSize(val) {
    var theImage = new Image();
    theImage.src = val.src;
    var winWidth = theImage.width + 100;
    var winHeight = theImage.height + 100;
    var left = (screen.width / 2) - (winWidth / 2);
    var top = (screen.height / 2) - (winHeight / 2);
    window.open(theImage.src, null, '  top=' + top + ', left=' + left + ' ,height=' + winHeight + ', width=' + winWidth + ', toolbar=0, location=0, status=0, scrollbars=0, resizable=0');
    return false;

}

function popUp(pageURL, title, parameter, value) {
    var w = 950;
    var h = 650;
    var left = (screen.width / 2) - (w / 2);
    var top = (screen.height / 2) - (h / 2);
    pageURL = pageURL + "?" + parameter + "=" + value;
    var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}
function popUpURL(pageURL, title, parameterwithvalue) {
    var w = 950;
    var h = 650;
    var left = (screen.width / 2) - (w / 2);
    var top = (screen.height / 2) - (h / 2);
    pageURL = pageURL + "?" + parameterwithvalue;
    var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}

function popUp3Parameter(pageURL, title, parameter1, value1, parameter2, value2, parameter3, value3) {
    alert();
    var w = 850;
    var h = 650;
    var left = (screen.width / 2) - (w / 2);
    var top = (screen.height / 2) - (h / 2);
    pageURL = pageURL + "?" + parameter1 + "=" + value1 + "&" + parameter2 + "=" + value2 + "&" + parameter3 + "=" + value3;
    var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}

function trim(s) {
    while (s.substring(0, 1) == ' ') {
        s = s.substring(1, s.length);
    }
    while (s.substring(s.length - 1, s.length) == ' ') {
        s = s.substring(0, s.length - 1);
    }
    return s;
}
/*************************/
function isANumber(str) {


    str = trim(str);

    for (i = 0; i < str.length; i++) {


        if ((str.charAt(i) >= '0') && (str.charAt(i) <= '9'))
            continue;
        if (str.charAt(i) == '.')
            continue;


        return false;
    }

    //Can not have two dots (.)
    if (str.indexOf('.') != str.lastIndexOf('.'))
        return false;

    return true;

}
/*************************/
function isInteger(str) {


    if (!isANumber(str))
        return false;
    if (str.indexOf('.') != -1)
        return false;

    return true;


}

function getVlanByGatewayId(val)
{
    $.ajax({
        type: "GET",
        url: "json/JsonGeneric.jsp?action=VLAN_BY_GATEWAY_ID&gateway_id=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#td_vlanId").html(output.RESULT);
        }
    });
}

function getPlanByPackageId(val)
{


    $.ajax({
        type: "GET",
        url: "json/JsonBilling.jsp?action=GET_PLAN&package_id=" + val.value + "&resellerId=" + $("#resellerId").val(),
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_planlist").html(output.RESULT);
        }
    });

    document.getElementById("planAmount").value = '';
}



function getAmountByPlanId(val)
{

    $.ajax({
        type: "GET",
        url: "json/JsonPlanAmount.jsp?action=GET_PLAN_AMOUNT&plan_id=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_amountlist").html(output.RESULT);
        }
    });


}

function getAmountByResellerId(val)
{

    $.ajax({
        type: "GET",
        url: "json/JsonBilling.jsp?action=BILL_RESELLER_AMOUNT&resellerId=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_resellerlist").html(output.RESULT);
            $("#html_planlist").html("<select class='form-control' ><option >Select Plan</option>");
            $('#billpackage_id').val($('#billpackage_id > option:first').val())
        }
    });



}

function isValidExtension(obj, message) {
    if (obj.value != '') {
        var valid_extensions = /(.png|.pjpeg|.x-png|.jpg|.jpeg|.gif|.pdf|.doc|.docx)$/i;
        if (!valid_extensions.test(obj.value))
        {
            alert('Please select valid ' + message + ' file format. valid file format are png,pjpeg,x-png,jpg,jpeg,gif,pdf,doc,docx');
            obj.value = '';
            return false;
        }

    } else {
        alert('Please select valid ' + message + '  file format.');
        obj.value = '';
        return false;
    }

    return true;
}


function getCityByStateId(val)
{
    $.ajax({
        type: "GET",
        url: "json/JsonCityByState.jsp?action=GET_CITY&state_id=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_citylist").html(output.RESULT);
        }
    });
}

function getResseler(val)
{
 
    $.ajax({
        type: "GET",
        url: "json/JsonGeneric.jsp?action=GET_ADVERTISER&authority=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);


         
            $("#html_resellerlist").html(output.RESULT);

            if (output.RESULT == '' || output.RESULT == null)
                $("#html_reseller_main").hide();
            else
                $("#html_reseller_main").show();

            // 
        }
    });
}

function confirmationPopup(message)
{
    if (confirm('' + message + '')) {
        return true;
    }
    return false;
}


function checkCAFNumber(cafNumber)
{

    $.ajax({
        type: "GET",
        url: "json/JsonBilling.jsp?action=GET_CAF_NUM&cafNumber=" + cafNumber.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_cafnum").html(output.RESULT);
        }
    });


}

function checkRAFNumber(cafNumber)
{

    $.ajax({
        type: "GET",
        url: "json/JsonBilling.jsp?action=GET_RAF_NUM&rafNumber=" + cafNumber.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $("#html_rafnum").html(output.RESULT);
        }
    });


}

function logutUser(username, gatewayIp, clientmac)

{

    $.ajax({
        type: "GET",
        url: "json/JsonApi.jsp?action=LOGOUT_BY_MAC&gatewayIp=" + gatewayIp + "&clientmac=" + clientmac + "&username=" + username,
        success: function(data) {
            var output = $.parseJSON(data);
            alert(output.RESULT);
        }
    });

}



function activateInactivate(username, gatewayIp, status)

{

    $.ajax({
        type: "GET",
        url: "json/JsonApi.jsp?action=CHANGE_WIFI_STATUS&gatewayIp=" + gatewayIp + "&status=" + status + "&username=" + username,
        success: function(data) {
            var output = $.parseJSON(data);
            alert(output.RESULT);
            window.location.reload();
        }
    });

}




function refreshmacbinding(username, gatewayIp)

{
    if (confirm("Do you want to refresh the mac binding."))
    {
        $.ajax({
            type: "GET",
            url: "json/JsonApi.jsp?action=REFRESH_MAC_BINDING&gatewayIp=" + gatewayIp + "&username=" + username,
            success: function(data) {
                var output = $.parseJSON(data);
                alert(output.RESULT);

            }
        });
    }

}

function update_status(status, id) {
    if (window.confirm("Do you really want to change the status?") == true) {
        $.ajax({
            type: "GET",
            url: "json/JsonNotification.jsp?action=update_banner_status&bannerId=" + id + "&status=" + status,
            success: function(data) {
                var output = $.parseJSON(data);

                if (output.RESULT == '' || output.RESULT == null)
                {
                    ;

                } else
                    alert(output.RESULT);

                location.reload();
                return true;
            }
        });
    }

}  