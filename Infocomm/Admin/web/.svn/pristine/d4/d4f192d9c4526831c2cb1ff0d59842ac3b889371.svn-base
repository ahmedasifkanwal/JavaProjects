<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%
    SysUsers user = (SysUsers) session.getAttribute("Users");

%>


<script type="text/javascript">
    var interval = 100;
    var timing = function () {
        
        var timer = setInterval(function () {
            $.ajax({

                type: "POST",
                url: "json/JsonAdminStatistics.jsp?ROW=ROW1",
                //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                success: function (data) {
                    var output = $.parseJSON(data);                  
                   // $(".css_message").html(output.message);
                   // $(".css_messageInt").html(output.messageInt);
                    $(".css_online1x").html(output.online1x);
                    $(".css_mobileactivation").html(output.mobileactivation);
                    $(".css_online").html(output.online);
                    $(".css_activation").html(output.activation);

                     $(".css_liveconnecteddevice").html(output.liveconnecteddevice);
                     $(".css_liveonlineuser").html(output.liveonlineuser);
                   


                }
            });
            interval = 60000; /* Increment you do want for timer */
            clearInterval(timer);
            timing();
        }, interval);
    }
    timing();



</script>

<div class="row" style="margin-top:20px;" >
    <a   href="connectedvslogin.icms">
        <div class="col-sm-6 col-md-2" >
        <div    class="console-btn" style="color:#7f57d4" data-toggle="tooltip" title="" data-original-title="Total login device from SNMP." data-placement="bottom">
            <div class="console-icon divider-right"><span  class="imoon imoon-feed3"></span> </div>
            <div class="console-text">
                <div class="console-title">Login Device</div>
                <div class="console-subtitle css_liveonlineuser">0</div>
            </div>
        </div>
    </div>
    </a>

    <a   href="connectedvslogin.icms">
        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#add656" data-toggle="tooltip" title="" data-original-title="otal connected device from SNMP" data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="imoon imoon-feed2"></span> </div>
            <div class="console-text">
                <div class="console-title">Connected Device</div>
                <div class="console-subtitle css_liveconnecteddevice"> 0</div>
            </div>
        </div>
    </div>
    </a>

    <a   href="loginstatictics.icms">

        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#835294" data-toggle="tooltip" title="" data-original-title="Today's ,total number of user activation" data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-nameplate"></span> </div>
            <div class="console-text">
                <div class="console-title">Activation</div>
                <div class="console-subtitle css_activation">0</div>
            </div>
        </div>
    </div>
     </a>
     <div class="col-sm-6 col-md-2" >
        <div class="console-btn" style="color:#34495e" data-toggle="tooltip" title="" data-original-title="Today's,total activation by mobile users." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-phone"></span> </div>
            <div class="console-text">
                <div class="console-title">Mobile Activation</div>
                <div class="console-subtitle css_mobileactivation">0%</div>
            </div>
        </div>
    </div>

    <a href="onlineusers.icms">
        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#835294" data-toggle="tooltip" title="" data-original-title="Total Online of 1X users." data-placement="bottom">

            <div class="console-icon divider-right"> <span  class="fa fa-globe "></span> </div>
            <div class="console-text">
                <div class="console-title">Online(1x)</div>
                <div class="console-subtitle css_online1x"> 0</div>
            </div>
        </div>
    </div>
    </a>
    <a href="onlineusers.icms.icms">
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



</div>
