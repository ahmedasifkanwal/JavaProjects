<%@ page import = "java.io.*,java.util.*" %>
<html lang="en">
    <!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--        <meta http-equiv="refresh" content="6;url=learning.jsp">-->

        <title>Holding Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/full.css" rel="stylesheet">
    </head>

    <body>
        <!--        <div class="row">
                    <div class="col-md-12 txtwrap">You will be redirected in 00 Seconds.</div>
                </div>-->
        <div class="rows">
            <div class="col-md-12 txtwrap">You should be automatically redirected in <span id="seconds">15</span> seconds.                 
                <span id="skip" class="pull-right"><a href="newjsp.jsp">Skip &#62;&#62;</a></span>        
            </div>
        </div>
        <div class="wrapper">
            <img src="images/bgBanner.jpg"  alt="Responsive image">
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        // Countdown timer for redirecting to another URL after several seconds

        var seconds = 15; // seconds for HTML
        var foo; // variable for clearInterval() function

        function redirect() {
            document.location.href = 'newjsp.jsp';

        }

        function updateSecs() {
            document.getElementById("seconds").innerHTML = seconds;
            seconds--;
            if (seconds == 5) {
                document.getElementById("skip").style.display = "block";
            }
            if (seconds == -1) {
                clearInterval(foo);
                redirect();
            }
        }

        function countdownTimer() {
            foo = setInterval(function () {
                updateSecs()
            }, 1000);
        }

        countdownTimer();
    </script>
</html>
