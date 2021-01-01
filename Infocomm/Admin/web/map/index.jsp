
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

            <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700">

            <!-- Core CSS  -->
            <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="font-awesome.min.css">
            <link rel="stylesheet" type="text/css" href="fonts/glyphicons_pro/glyphicons.min.css">

            <!-- Theme CSS -->
            <link rel="stylesheet" type="text/css" href="css/theme.css">
            <link rel="stylesheet" type="text/css" href="css/pages.css">
            <link rel="stylesheet" type="text/css" href="css/plugins.css">
            <link rel="stylesheet" type="text/css" href="css/responsive.css">

            <!-- Boxed-Layout CSS -->
            <link rel="stylesheet" type="text/css" href="css/boxed.css">

            <!-- Demonstration CSS -->
            <link rel="stylesheet" type="text/css" href="css/demo.css">

            <!-- Your Custom CSS -->
            <link rel="stylesheet" type="text/css" href="css/custom.css">

            <!-- Favicon -->
            <link rel="shortcut icon" href="img/favicon66.ico">

            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
              <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
            <![endif]-->


            <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAARxfVwfVA13PQxBnBuB5kBxQB0uaJ_FbgvCjHGYHVazvnMrmLBxRtsPpPk2fFNCXOY2XU2E9oucSOeg" type="text/javascript">

            </script>

            <body onload="buildMap()" onunload="GUnload()">
                <!-- Start: Header -->
            <header class="navbar navbar-fixed-top">
                <div class="pull-left"> <a class="navbar-brand" href="dashboard.html">
                        <div class="navbar-logo"><img src="img/logos/infocomm.gif" class="img-responsive" alt="logo"/></div>
                    </a> </div>



                <div class="pull-right header-btns">
                    <div class="messages-menu">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-global"></span> <b>Muscat 89 </b> </button>

                    </div>
                    <div class="alerts-menu">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-global"></span> <b>Sur 1 </b> </button>
                    </div>

                    <div class="alerts-menu">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-global"></span> <b>Sohar 2 </b> </button>
                    </div>
                    <div class="alerts-menu">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"> <span class="glyphicons glyphicons-global"></span> <b>Salalah 14 </b> </button>
                    </div>

                </div>



            </header>
            <!-- End: Header -->
            <!-- Start: Main -->
            <div id="main">
                <!-- Start: Sidebar -->

                <!-- End: Sidebar -->
                <!-- Start: Content -->
                <section id="content">

                    <div class="container">




                        <div id="descr" style="position: absolute; left: 90px; top: 30px">
                            <a href="#" class="button_stop" onclick="haltAnim();return false;"><img src="Stop.png" alt="Stop Animation" title="Stop Animation"></a>
                            <a href="#" class="button_stop" onclick="carryOn();return false;"><img src="continue.png" ></a>

                            <a href="#" class="button_stop" onclick="playAgain();return false;"><img src="Play.png"></a>

                        </div>


                        <script type="text/javascript">
                        //<![CDATA[

                        // Global variables
                        var data = [
                                { name: "Oman", date: "Al Makan, Seeb", lat: " 23.602422", lng: " 58.247671"},
                                {name: "Oman", date: "Address Cafe , Shati", lat: " 23.616192", lng: " 58.462661"},
                                {name: "Oman", date: "Darcy Kitchen, MQ", lat: " 23.600658", lng: " 58.455447"},
                                {name: "Oman", date: "Exhibition Center, Seeb", lat: " 23.583572", lng: " 58.455447"},
                                {name: "Oman", date: "Starbucks, Al Shatti", lat: " 23.616236", lng: " 58.462736"},
                                {name: "Oman", date: "Starbucks, Qurum CC", lat: " 23.607631", lng: " 58.490172"},
                                {name: "Oman", date: "Starbucks, Seeb CC", lat: " 23.599739", lng: " 58.2482"},
                                {name: "Oman", date: "Starbucks, Ernst& Young", lat: " 23.619792", lng: " 58.499775"},
                                {name: "Oman", date: "Starbucks, Beach", lat: " 23.624578", lng: " 58.479436"},
                                {name: "Oman", date: "Starbucks, MQ", lat: " 23.599983", lng: " 58.454358"},
                                {name: "Oman", date: "Mood Cafe, MQ", lat: " 23.599983", lng: " 58.462917"},
                                {name: "Oman", date: "Mood Cafe, Bahja", lat: " 23.613308", lng: " 58.593353"},
                                {name: "Oman", date: "Second Cup, Al Shatti", lat: " 23.61615", lng: " 58.462917"},
                                {name: "Oman", date: "Second Cup, CCC", lat: " 23.615444", lng: " 58.497714"},
                                {name: "Oman", date: "Costa Cafe, Bareq Al Shatti", lat: " 23.612489", lng: " 58.464925"},
                                {name: "Oman", date: "Costa Cafe, Oasis", lat: " 23.616253", lng: " 58.462439"},
                                {name: "Oman", date: "Costa Cafe, Qurum CC", lat: " 23.607631", lng: " 58.490172"},
                                {name: "Oman", date: "Costa Cafe, MQ", lat: " 23.599983", lng: " 58.462917"},
                                {name: "Oman", date: "Costa Cafe, Seeb City Center", lat: " 23.599739", lng: " 58.2482"},
                                {name: "Oman", date: "Costa Cafe, Sohar", lat: " 24.361853", lng: " 56.712525"},
                                {name: "Oman", date: "Costa Cafe, CBD", lat: " 23.599039", lng: " 58.549083"},
                                {name: "Oman", date: "Muscat Airport, Muscat Airport", lat: " 23.592592", lng: " 58.281908"},
                                {name: "Oman", date: "Grand Hyatt, Alkhwair", lat: " 23.608189", lng: " 58.44505"},
                                {name: "Oman", date: "Costa cafe, MGM", lat: " 23.589167", lng: " 58.412586"},
                                {name: "Oman", date: "Costa cafe, Lulu", lat: " 23.590422", lng: " 58.410753"},
                                {name: "Oman", date: "Costa cafe, Oasis", lat: " 23.616486", lng: " 58.462936"},
                                {name: "Oman", date: "Costa cafe, Wave", lat: " 23.630356", lng: " 58.267136"},
                                {name: "Oman", date: "Costa cafe, 18 nov street", lat: " 23.607642", lng: " 58.316569"},
                                {name: "Oman", date: "Darcy Kitchen, Shatti", lat: " 23.615522", lng: " 58.463417"},
                                {name: "Oman", date: "Titanic cafe, Al Khwair", lat: " 23.596181", lng: " 58.426475"},
                                {name: "Oman", date: "Tche tche cafe, Qurum", lat: " 23.624256", lng: " 58.479103"},
                                {name: "Oman", date: "Bank Muscat, HO", lat: " 23.605553", lng: " 58.538322"},
                                {name: "Oman", date: "Costa Beach One, Qurum", lat: " 23.616133", lng: " 58.482161"},
                                {name: "Oman", date: "Royal Opera, Qurum", lat: " 23.613889", lng: " 58.468314"},
                                {name: "Oman", date: "Bank Muscat, MBD", lat: " 23.599147", lng: " 58.549047"},
                                {name: "Oman", date: "Bank Muscat, Baith Al Reem", lat: " 23.600406", lng: " 58.438792"},
                                {name: "Oman", date: "Nissan, Nissan", lat: " 23.609106", lng: " 58.492825"},
                                {name: "Oman", date: "Costa Markaz Al Bahja, Markaz Al Bahja", lat: " 23.613308", lng: " 58.593353"},
                                {name: "Oman", date: "Costa Markaz, Al Araimi", lat: " 23.613078", lng: " 58.495"},
                                {name: "Oman", date: "Shangrila, Bar Al Jissah", lat: " 23.616836", lng: " 58.583336"},
                                {name: "Oman", date: "Bank Muscat City Centre, City Centre", lat: " 23.599739", lng: " 58.2482"},
                                {name: "Oman", date: "Bank Muscat, Royal Opera Mall", lat: " 23.613889", lng: " 58.468314"},
                                {name: "Oman", date: "Bank Muscat, Sohar", lat: " 24.339311", lng: " 56.736081"},
                                {name: "Oman", date: "Bank Muscat, SQU", lat: " 23.591175", lng: " 58.17255"},
                                {name: "Oman", date: "Bank Muscat,  Salalah", lat: " 17.019961", lng: " 54.092156"},
                                {name: "Oman", date: "Tche Tche Wave,  Wave", lat: " 23.630356", lng: " 58.267136"},
                                {name: "Oman", date: "BMW SHOWROOM,  Qurum", lat: " 23.608006", lng: " 58.497444"},
                                {name: "Oman", date: "Costa Salalah,  Salalah", lat: " 17.022986", lng: " 54.066036"},
                                {name: "Oman", date: "Crown Plaza Hotel,  Qurum", lat: " 23.629261", lng: " 58.484406"},
                                {name: "Oman", date: "Costa GMC,  Bousher", lat: " 23.583389", lng: " 58.402039"},
                                {name: "Oman", date: "Costa Bousher,  Bousher", lat: " 23.590458", lng: " 58.411006"},
                                {name: "Oman", date: "Coppa Cafe,  Bousher", lat: " 23.592436", lng: " 58.411603"},
                                {name: "Oman", date: "Chocolate Cafe,  Bousher", lat: " 23.592289", lng: " 58.408892"},
                                {name: "Oman", date: "Moka & More,  Bousher", lat: " 23.583389", lng: " 58.402039"},
                                {name: "Oman", date: "Salalah Airport,  Salalah", lat: " 17.038303", lng: " 54.107214"},
                                {name: "Oman", date: "Seeb Stadium,  Seeb", lat: " 23.617044", lng: " 58.215844"},
                                {name: "Oman", date: "Bausher Stadium,  Bousher", lat: " 23.571617", lng: " 58.400136"},
                                {name: "Oman", date: "Muscat Muncipality,  Qurum Park,  Bousher", lat: " 23.618717", lng: " 58.501803"},
                                {name: "Oman", date: "Muscat Muncipality,  Amerat Park,  Bousher", lat: " 23.510278", lng: " 58.502778"},
                                {name: "Oman", date: "Muscat Muncipality,  Naseem Garden", lat: " 23.695", lng: " 58.047222"},
                                {name: "Oman", date: "Muscat Muncipality,  Ghubrah Park", lat: " 23.58", lng: " 23.982889"},
                                {name: "Oman", date: "Muscat Muncipality,  Wadi Kabir Park", lat: " 23.583333", lng: " 58.566667"},
                                {name: "Oman", date: "Muscat Muncipality,  Kalbou Park", lat: " 23.622619", lng: " 58.585431"},
                                {name: "Oman", date: "MGM,  MGM", lat: " 23.589167", lng: " 58.412586"},
                                {name: "Oman", date: "Bahja,  Markaz Al Bahja", lat: " 23.613308", lng: " 58.593353"},
                                {name: "Oman", date: "Qurum  City Center", lat: " 23.607631", lng: " 58.490172"},
                                {name: "Oman", date: "Muscat City Center", lat: " 23.599739", lng: " 58.2482"},
                                {name: "Oman", date: "Bariq-Al-Shatti", lat: " 23.612489", lng: " 58.464925"},
                                {name: "Oman", date: "Sabco Center,  Sabco Center", lat: " 23.611728", lng: " 58.495292"},
                                {name: "Oman", date: "Love Street,  Qurum Beach", lat: " 23.624256", lng: " 58.479103"},
                                {name: "Oman", date: "Funzone,  Funzone", lat: " 23.621892", lng: " 58.489153"},
                                {name: "Oman", date: "Oasis Mall,  Oasis Mall", lat: " 23.616253", lng: " 58.462439"},
                                {name: "Oman", date: "Beruite Cafe,  Beruite Cafe", lat: " 23.61105", lng: " 58.494994"},
                                {name: "Oman", date: "Dar-Al-Sada,  Dar-Al-Sada", lat: " 23.582133", lng: " 58.561025"},
                                {name: "Oman", date: "Al-Massa Mall,  Al-Massa Mall", lat: " 23.608656", lng: " 58.45675"},
                                {name: "Oman", date: "Osacr Cafe,  Osacr Cafe", lat: " 23.596181", lng: " 58.426475"},
                                {name: "Oman", date: "Oman Club,  Oman Club", lat: " 23.594472", lng: " 58.417611"},
                                {name: "Oman", date: "Baith-Al-Maha,  Baith-Al-Maha", lat: " 23.591033", lng: " 58.428681"},
                                {name: "Oman", date: "Sun Optical,  Sun Optical", lat: " 23.634828", lng: " 58.201647"},
                                {name: "Oman", date: "Jawharat Al Shatti,  Jawharat Al Shatti", lat: " 23.616264", lng: " 58.463094"},
                                {name: "Oman", date: "Al Mukhtar Restaurant,  Al Mukhtar Restaurant", lat: " 23.581847", lng: " 58.432628"},
                                {name: "Oman", date: "Al Muruj Cafe,  Al Muruj Cafe", lat: " 23.616656", lng: " 58.462931"},
                                {name: "Oman", date: "Omantel SQU,  Omantel SQU", lat: " 23.591175", lng: " 58.17255"},
                                {name: "Oman", date: "Omantel Zakher,  Omantel Zakher", lat: " 23.593717", lng: " 58.443656"},
                                {name: "Oman", date: "Shati Cinema,  Shatti", lat: " 23.611636", lng: " 58.454111"},
                                {name: "Oman", date: "LuLu,  Bousher", lat: " 23.590422", lng: " 58.410753"},
                                {name: "Oman", date: "LuLu,  Darsait", lat: " 23.617592", lng: " 58.545569"},
                                {name: "Oman", date: "Festival Camp,  Salalah", lat: " 17.037322", lng: " 54.058458"},
                                {name: "Oman", date: "Kiosk_Grill_Salalah,  Salalah", lat: " 17.065203", lng: " 54.067261"},
                                {name: "Oman", date: "Gharash Restaurant,  Salalah", lat: " 17.022344", lng: " 54.065675"},
                                {name: "Oman", date: "Global Village,  Salalah", lat: " 16.988031", lng: " 54.026456"},
                                {name: "Oman", date: "Maestro-Cafe,  Salalah", lat: " 17.022528", lng: " 54.065469"},
                                {name: "Oman", date: "New-Garash,  Salalah", lat: " 17.022483", lng: " 54.065519"},
                                {name: "Oman", date: "Sport-Cafe,  Salalah", lat: " 17.022344", lng: " 54.065675"},
                                {name: "Oman", date: "Vinisia-Cafe,  Salalah", lat: " 17.017883", lng: " 54.099481"},
                                {name: "Oman", date: "Reem-Al-Jajeera,  Salalah", lat: " 17.018519", lng: " 54.10165"},
                                {name: "Oman", date: "ArabVilla Restaurant,  Salalah", lat: " 17.018214", lng: " 54.102097"},
                                {name: "Oman", date: "Al-Sham-Palace,  Salalah", lat: " 17.0225", lng: " 54.065483"},
                            ];

                            var map, route;
                            var points = [];
                            var gmarkers = [];
                            var count = 0;
                            var stopClick = false;


                            function addIcon(icon) { // Add icon attributes

                                icon.shadow = "http://www.i-grp.com/map/red_shadow.png";
                                icon.iconSize = new GSize(32, 32);
                                icon.shadowSize = new GSize(37, 34);
                                icon.iconAnchor = new GPoint(15, 34);
                                icon.infoWindowAnchor = new GPoint(19, 2);
                                icon.infoShadowAnchor = new GPoint(18, 25);
                            }


                            function addClickevent(marker) { // Add a click listener to the markers

                                GEvent.addListener(marker, "click", function () {
                                    marker.openInfoWindowHtml(marker.content);
                                    /* Change count to continue from the last manually clicked marker
                                     *  Better syntax since Javascript 1.6 - Unfortunately not implemented in IE.
                                     *  count = gmarkers.indexOf(marker);
                                     */
                                    count = marker.nr;
                                    stopClick = true;
                                });
                                return marker;
                            }


                            function buildMap() {

                                if (GBrowserIsCompatible()) {
                                    map = new GMap2(document.getElementById("map"));
                                    map.setCenter(new GLatLng(23.608006, 58.497444), 13);
                                    map.addControl(new GSmallMapControl());
                                    map.addControl(new GMapTypeControl());

                                    // Light blue marker icons
                                    var icon = new GIcon();
                                    icon.image = "map-pointer1.png";
                                    addIcon(icon);

                                    for (var i = 0; i < data.length; i++) {
                                        points[i] = new GLatLng(parseFloat(data[i].lat), parseFloat(data[i].lng));
                                        gmarkers[i] = new GMarker(points[i], icon);

                                        // Store data attributes as property of gmarkers
                                        var html = "<div class='infowindow'>" +
                                                "<strong>" + data[i].name + "<\/strong><p>" +
                                                data[i].date + "<\/p><\/div>";
                                        gmarkers[i].content = html;
                                        gmarkers[i].nr = i;
                                        addClickevent(gmarkers[i]);
                                        map.addOverlay(gmarkers[i]);
                                    }
                                    // Draw polylines between marker points
                                    var poly = new GPolyline(points, "#003355", 0, .1);
                                    map.addOverlay(poly);

                                    // Open infowindow of first marker
                                    gmarkers[0].openInfoWindowHtml(gmarkers[0].content);

                                    route = setTimeout("anim()", 3600);
                                }
                            }


                            function haltAnim() {

                                if (route) {
                                    clearTimeout(route);
                                    stopClick = true;
                                }
                            }


                            function carryOn() {

                                if (stopClick == true)
                                    anim();
                                stopClick = false;
                            }


                            function anim() {

                                count++;
                                if (count < points.length) {
                                    // Use counter as array index
                                    map.panTo(points[count]);
                                    gmarkers[count].openInfoWindowHtml(gmarkers[count].content);
                                    var delay = 3400;
                                    if ((count + 1) != points.length)
                                        var dist = points[count].distanceFrom(points[count + 1]);

                                    // Adjust delay
                                    if (dist < 10000) {
                                        delay = 2000;
                                    }
                                    if (dist > 80000) {
                                        delay = 4200;
                                    }
                                    route = setTimeout("anim()", delay);
                                } else {
                                    clearTimeout(route);
                                    count = 0;
                                    route = null;
                                }
                            }


                            function playAgain() {

                                GUnload();
                                if (route)
                                    clearTimeout(route);
                                stopClick = false;
                                count = 0;
                                buildMap();
                            }

                            //]]>
                        </script>


                    </div>
                </section>
                <!-- End: Content -->
            </div>
            <!-- End: Main -->


        </body>
</html>


<div  id="map" style="height: 350px; width: auto; "  ></div>




        </div>


    </div>
</div>
