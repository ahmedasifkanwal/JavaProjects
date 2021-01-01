<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%
    SysUsers user = (SysUsers) session.getAttribute("Users");

%>
<script type="text/javascript">
    var interval2 = 100;
    var timing2 = function () {
        var timer = setInterval(function () {
            $.ajax({
                type: "POST",
                url: "json/JsonAdminStatistics.jsp?ROW=ROW2",
                //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                success: function (data) {
                    var output = $.parseJSON(data);
                    $(".css_session").html(output.session);
                    $(".css_vlan").html(output.vlan);
                    $(".css_owner").html(output.owner);
                    $(".css_plan").html(output.plan);
                    $(".css_banwidth").html(output.banwidth);
                    $(".css_avgbanwidth").html(output.avgbanwidth);



                }
            });
            interval2 = 120000; /* Increment you do want for timer */
            clearInterval(timer);
            timing2();
        }, interval2);
    }
    timing2();



</script>

<div class="row" >



    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#a9d753" data-toggle="tooltip" title="" data-original-title="Today's, total number of login sessions." data-placement="bottom">
            <div class="console-icon divider-right" >
                <span class="imoon imoon-users2" ></span> </div>
            <div class="console-text">
                <div class="console-title">Session</div>
                <div class="console-subtitle css_session">
                    0
                </div>
            </div>
        </div>
    </div>

    <a href="datautilization.icms">
        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#edc041" data-toggle="tooltip" title="" data-original-title="Today's, total bandwith used by the users.." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-dashboard"></span> </div>
            <div class="console-text">
                <div class="console-title">Bandwidth</div>
                <div class="console-subtitle css_banwidth">
                    0 MB

                </div>
            </div>
        </div>
    </div>

    </a>
    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#c4416b" data-toggle="tooltip" title="" data-original-title="Today's, avarage bandwith used by the users at ad locations." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-dashboard"></span> </div>
            <div class="console-text">
                <div class="console-title">Avg.Bandwidth</div>
                <div class="console-subtitle css_avgbanwidth">
                    0 MB
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#bc6061" data-toggle="tooltip" title="" data-original-title="Active Location." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="imoon imoon-location2"></span> </div>
            <div class="console-text">
                <div class="console-title">Locations</div>
                <div class="console-subtitle css_vlan">
                    0%
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#ed7912" data-toggle="tooltip" title="" data-original-title="Active Business Owners." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="imoon imoon-office"></span> </div>
            <div class="console-text">
                <div class="console-title ">Business Owners</div>
                <div class="console-subtitle css_owner">
                    0</div>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#7f57d4" data-toggle="tooltip" title="" data-original-title="Active Plan" data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-shopping_cart"></span> </div>
            <div class="console-text">
                <div class="console-title">Plan</div>
                <div class="console-subtitle css_plan">0</div>
            </div>
        </div>
    </div>


</div>
