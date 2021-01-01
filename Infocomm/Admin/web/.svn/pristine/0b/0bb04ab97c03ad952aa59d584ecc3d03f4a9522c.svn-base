<script type="text/javascript" >
$(document).ready(function () {
        //called when key is pressed in textbox
        $("#toprecords").keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                //display error message
                $("#errmsg").html("Digits Only").show().fadeOut("slow");
                return false;
            }
        });
    });
</script>

<label class="text-blue">
    Record In Chart: <input type="text" value="25" placeholder="25" class="toprecords"   name="toprecords" id="toprecords"  maxlength="2" style="width: 50px ; height: 20px">
</label>
<span id="errmsg" class="text-red"></span>