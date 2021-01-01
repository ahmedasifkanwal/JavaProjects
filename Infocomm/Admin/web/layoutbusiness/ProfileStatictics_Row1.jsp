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
                url: "json/JsonAdminStatisticsBusiness.jsp?ROW=ROW1",
                //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                success: function (data) {
                    var output = $.parseJSON(data);
                    $(".css_session").html(output.session);//
                    $(".css_banwidth").html(output.banwidth);
                    $(".css_avgbanwidth").html(output.avgbanwidth);
                    $(".css_uniqueactivation").html(output.uniqueactivation);//
                    $(".css_online").html(output.online);//
                    $(".css_activation").html(output.activation);//
                }
            });
            interval2 = 600000; /* Increment you do want for timer */
            clearInterval(timer);
            timing2();
        }, interval2);
    }
    timing2();



</script>
<div class="row" style="margin-top:20px;">



    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#835294" data-toggle="tooltip" title="" data-original-title="Today's ,total number of user activation" data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-nameplate"></span> </div>
            <div class="console-text">
                <div class="console-title">Activation</div>
                <div class="console-subtitle css_activation">0</div>
            </div>
        </div>
    </div>


    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#bc6061" data-toggle="tooltip" title="" data-original-title="Today's , total unique activation." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-turtle"></span> </div>
            <div class="console-text">
                <div class="console-title">Unique Activation</div>
                <div class="console-subtitle css_uniqueactivation">
                    0
                </div>
            </div>
        </div>
    </div>
    <a href="onlineusers.icms">
        <div class="col-sm-6 col-md-2">
            <div class="console-btn" style="color:#add656" data-toggle="tooltip" title="" data-original-title="Total online users." data-placement="bottom">
                <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-globe_af"></span> </div>
                <div class="console-text">
                    <div class="console-title">Online</div>
                    <div class="console-subtitle css_online"> 0</div>
                </div>
            </div>
        </div>
    </a>

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





</div>
