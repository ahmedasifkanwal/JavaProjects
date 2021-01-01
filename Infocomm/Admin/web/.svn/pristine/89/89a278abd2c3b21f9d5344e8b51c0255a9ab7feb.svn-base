//********************************************************
//Add Campaign Related Javascript
//Created By :Saleem  Create On : June 18 2014 
//********************************************************
document.write('<script type="text/javascript" src="js/jquery.min.js"></script>');



//********************************************************
//Search Campaign Related Javascript
//Created By :Saleem  Create On : June 18 2014 
//********************************************************
function getCampaignDates(val)

{

    
    $.ajax({
        type: "GET",
        url: "JsonNotification.jsp?action=get_date_status&campaignId=" + val.value,
        success: function(data) {
            var output = $.parseJSON(data);
          
            $('#fromDate').html(output.fromDate);
            $('#toDate').html(output.toDate);
           
            return true;

        }
        });
   
}
function update_status(status, id)
{
    if (window.confirm("Do you really want to change the status?") == true)
    {
    $.ajax({
        type: "GET",
        url: "JsonNotification.jsp?action=update_not_status&notid=" + id + "&status=" + status,
        success: function(data) {
            var output = $.parseJSON(data);
            alert(output.RESULT);
            location.reload();
            return true;
        }
        });
    }

}
