//********************************************************
//Add Campaign Related Javascript
//Created By :Saleem  Create On : June 18 2014 
//********************************************************
document.write('<script type="text/javascript" src="js/jquery.min.js"></script>');



function getPublishers(val)
{

 

    if (val.value == 'Super Admin' || val.value == 'Telco')

    {
        $("#div_agency").hide();
        $("#div_company").hide();

    }
    else if (val.value == 'Publisher')
    {
        $("#div_company").hide();
        $("#div_agency").show();
    } else if (val.value == 'Advertiser')
    {
        $("#div_company").show();
        $("#div_agency").show();
    }
}


function getCustomers(val)
{



    $.ajax({
        type: "GET",
        url: "JsonGetUsersManagement.jsp?mode=customer&agency_id=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
            $(".customerData").html(output.SUBCAT);
        }
    });
}

function hideCategory(val)


{



    if ((val.value == 'Government'))
    {
        $("#tr_category").hide();
        $("#tr_subcategory").hide();
    } else
    {
        $("#tr_category").show();
        $("#tr_subcategory").show();
    }


}

