

function sli (){

    function Slideshow(element) {
        this.el = document.querySelector(element);
        this.init();
    }

    Slideshow.prototype = {
        init: function () {
            this.wrapper = this.el.querySelector(".add-space-1");
            this.slides = this.el.querySelectorAll(".slide");
            this.previous = this.el.querySelector(".slider-previous");
            this.next = this.el.querySelector(".slider-next");
            this.index = 0;
            this.total = this.slides.length;
            this.timer = null;
            this.do();

            this.action();
            this.stopStart();
        },
        _slideTo: function (slide) {
            var currentSlide = this.slides[slide];
            currentSlide.style.opacity = 1;

            for (var i = 0; i < this.slides.length; i++) {
                var slide = this.slides[i];


                if (slide !== currentSlide) {
                    slide.style.opacity = 0;
                 
                }
            }
        },
        action: function () {
            var self = this;
            self.timer = setInterval(function () {
                self.index++;
                if (self.index == self.slides.length) {
                    self.index = 0;
                }
                self._slideTo(self.index);

            }, 5000);
        },

        do: function () {


            var self = this;
            self.timer = setTimeout(function () {
                self.index++;
                if (self.index == self.slides.length) {
                    self.index = 0;
                }
                self._slideTo(self.index);

            }, 500);
        },

        stopStart: function () {
            var self = this;

            self.el.addEventListener("mouseover", function () {
                clearInterval(self.timer);
                self.timer = null;

            }, false);
            self.el.addEventListener("mouseout", function () {
                self.action();

            }, false);
        }


    };

    document.addEventListener("DOMContentLoaded", function () {
    var slider = new Slideshow("#main-slider1");
      
    });


}


function setbanners(context, mac, vlan, page, action, banner_space_1, banner_space_2, banner_space_3)

{


    $.ajax({
        type: "GET",
        url: context + "/iLasApi.jsp?action=" + action + "&mac=" + mac + "&vlan=" + vlan + "&page=" + page,
        success: function (data) {
            var output = $.parseJSON(data);

            if (output.RESULT_CODE == 0)
            {

                if (output.banner_space_1 != '')
                {

                    $("." + banner_space_1).html(output.banner_space_1);

                }
                if (output.banner_space_2 != '')
                {
                    $("." + banner_space_2).html(output.banner_space_2);
                }
                if (output.banner_space_3 != '')
                {
                 
                    this.init();
  
                   alert(output.banner_space_3);
                 //   $("." + banner_space_3).html(output.banner_space_3);

                }

                //clearInterval(timer);

            } else {
                alert(output.RESULT_CODE);

            }
        }
    });
     


    //$("." + banner_space_2).html('<img class="slide img-fluid img-rounded"  src="http://212.72.10.195:8080/lbaadmin/ilasimage/P1_S2_C1144.jpg" alt="">');

   /// $("." + banner_space_3).html(' <a   href="http://localhost:8084/WiFiWalledGarden/json/iLasRedirectApi.jsp?action=ILAS_REDIRECT&mac=AC:81:12:43:TE-ST&campaignId=363&page=P1&vlan=160&space=S3&redirect=facebook.com" target="_blank"><img class="slide img-fluid img-rounded" style="max-height: 120px"  src="http://82.178.28.185:8080/lbaadmin/ilasimage/P1_S3_C363.jpg?1500270368875" /></a>   <img class="slide img-fluid img-rounded"  src="http://212.72.10.195:8080/lbaadmin/ilasimage/P1_S3_C1145.png" alt="">');



    // var slider = new Slideshow("#main-slider1");

    ///  var slider = new Slideshow("#main-slider2");




}