
<div class="col-sm-8 col-lg-4" >
    <div class="panel">
        <div class="panel-heading" data-toggle="tooltip" title="" data-original-title="Device Types used, Today" data-placement="bottom">
            <div class="panel-title" style="float: none"><span class=" glyphicons glyphicons-alarm"  />  </span>
            System
            <div style="float: right">
                <span class="badge badge-primary margin-right-sm">

                    </span>
                </div>
            </div>
        </div>


        <div class="panel-body">

            <script type="text/javascript">
                jQuery.noConflict();

                (function ($) {
                    $(function () {

                        var interval = 100;

                        var data = {'reportId': 'RPT_SYSTEM_DATA'};
                        var timing = function () {
                            var timer = setInterval(function () {
                                $.ajax({
                                    type: "POST",
                                    url: "json/JsonSystem.jsp?data=" + JSON.stringify(data),
                                    success: function (data) {
                                        var output = $.parseJSON(data);
                                        $("#system").html(output.system);


                                    }
                                });
                                interval = 5000; /* Increment you do want for timer */
                                clearInterval(timer);
                                timing();
                            }, interval);
                        }
                        timing();

                    });

                })(jQuery);
            </script>

            <div  id="system" style="height: 350px; width: auto; "  ></div>




        </div>


    </div>
</div>
