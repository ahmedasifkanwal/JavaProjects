<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%
    SysUsers user = (SysUsers) session.getAttribute("Users");

%>
<script type="text/javascript">
    var interval3 = 100;
    var timing3 = function () {
        var timer = setInterval(function () {

            $.ajax({
                type: "POST",
                url: "json/JsonAdminStatistics.jsp?ROW=ROW3",
                //data: "{cCardDropDown: document.getElementById('cCardDropDown').value, selection: 'FCDT'}",
                success: function (data) {
                    var output = $.parseJSON(data);
                    $(".css_mobiledownload").html(output.mobiledownload);
                    $(".css_uniqueactivation").html(output.uniqueactivation);
                    $(".css_uniquemobileactivation").html(output.uniquemobileactivation);
                    $(".css_onexactivation").html(output.onexactivation);
                    // $(".css_liveconnecteddevice").html(output.liveconnecteddevice);
                    // $(".css_liveonlineuser").html(output.liveonlineuser);

                    $(".css_message").html(output.message);
                    $(".css_messageInt").html(output.messageInt);
                }
            });
            interval3 = 120000; /* Increment you do want for timer */
            clearInterval(timer);
            timing3();
        }, interval3);
    }
    timing3();



</script>
<div class="row" >
    <div class="col-sm-6 col-md-2">



        <div class="console-btn" style="color:#cac486"   data-toggle="tooltip" title="" data-original-title="Total mobile apps download" data-placement="bottom">
            <div class="console-icon divider-right" >
                <span class="glyphicons glyphicons-download" ></span> </div>
            <div class="console-text">
                <div class="console-title">Mobile Downloads</div>
                <div class="console-subtitle css_mobiledownload">
                    0
                </div>
            </div>
        </div>

    </div>
    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#ed7912" data-toggle="tooltip" title="" data-original-title="Today's , total 1x activation." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons glyphicons-nameplate"></span> </div>
            <div class="console-text">
                <div class="console-title ">1X Activation</div>
                <div class="console-subtitle css_onexactivation">
                    0</div>
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

    <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#9dfc1c"  data-toggle="tooltip" title="" data-original-title="Today's , total unique mobile activation" data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicon  glyphicon-user"></span> </div>
            <div class="console-text">
                <div class="console-title">Unique Mobile Act.</div>
                <div class="console-subtitle css_uniquemobileactivation">
                    0

                </div>
            </div>
        </div>
    </div>
    <a href="outgoingsms.icms">
        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#cac486"   data-toggle="tooltip" title="" data-original-title="Today's,total number of message sent locally." data-placement="bottom">
            <div class="console-icon divider-right" >
                <span class="glyphicons glyphicons-message_out" ></span> </div>
            <div class="console-text">
                <div class="console-title">Message</div>
                <div class="console-subtitle css_message">
                    0
                </div>
            </div>
        </div>

    </div>

    </a>


    <a href="internationalsms.icms">
        <div class="col-sm-6 col-md-2">
        <div class="console-btn" style="color:#9dfc1c"  data-toggle="tooltip" title="" data-original-title="Today's, total number of international message sent." data-placement="bottom">
            <div class="console-icon divider-right"> <span  class="glyphicons  glyphicons-message_flag"></span> </div>
            <div class="console-text">
                <div class="console-title">Message(Int)</div>
                <div class="console-subtitle css_messageInt">
                    0

                </div>
            </div>
        </div>
    </div>

     </a>


</div>
