<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load("visualization", "0", {packages: ["map"]});
    google.setOnLoadCallback(drawMap);
    
    function drawMap() {


        var mapoptions = {          
                    zoom: 10,
                    showTip: true,
                    center: {lat: -25.363, lng: -131.044
                    }
                    };
                   var map = new google.visualization.Map(document.getElementById('map'));


        jQuery.noConflict();

        (function ($) {
            $(function () {

            var interval = 100;
              var data = {'reportId': 'RPT_MAP_LOCATIONS'};
                var timing = function () {
 		 
                    var timer = setInterval(function () {
                    

                        $.ajax({
                            type: "POST",
                              url: "json/JsonSystem.jsp?data=" + JSON.stringify(data),
                               success: function (data) {
                                var output = $.parseJSON(data);
                          
                                var mapData = google.visualization.arrayToDataTable(eval(output.locations));
                                map.draw(mapData, mapoptions);


                            }
                        });
			
                        interval = 30000; /* Increment you do want for timer */
                        clearInterval(timer);
                        timing();
                    }, interval);
                }
                timing();

            });

        })(jQuery);
    }

</script>



<div class="panel" >
    <div class="panel-heading">
        <div class="panel-title"> <span class="glyphicons imoon imoon-location2"></span>Active Locations</div>
        <div class="panel-title-sm pull-right">   </div>
    </div>
    <div class="panel-body"   >
        <div id="map" ></div>
    </div>
</div>