
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap-dropdown.js"></script>
<script src="js/bootstrap-scrollspy.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script src="js/bootstrap-popover.js"></script>
<script src="js/application.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

<script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

<script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
<script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

<script type="text/javascript" src="js/tablecloth.js"></script>
<script type="text/javascript" src="js/demo.js"></script>
<!--initiate accordion-->
<script type="text/javascript">
    $(function() {

        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

        menu_ul.hide();

        $(".menu").fadeIn();
        $(".content").fadeIn();
        $(".navbar").fadeIn();
        $(".footer").fadeIn();
        $(".subnav").fadeIn();
        $(".progress1").hide();
       

        menu_a.click(function(e) {
            e.preventDefault();
            if(!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true, true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true, true).slideUp('normal');
            }
        });

    });

</script>

<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true

        });

        $(".continue").click(function() {

            $(".first_half").slideUp();

            $(".second_half").slideDown();

            $(".pre_first_half").find("div").addClass("success");

        });

        $(".proceed").click(function() {

            $(".second_half").slideUp();

            $(".third_half").slideDown();

        });

        $(".back").click(function() {

            $(".first_half").slideDown();

            $(".second_half").slideUp();

            $(".third_half").slideUp();

            $(".pre_first_half").find("div").removeClass("success");

        });

        $(".previous").click(function() {

            $(".second_half").slideDown();

            $(".third_half").slideUp();

            $(".first_half").slideUp();
        });

        $('.close_dialog').click(function() {

            $('#dialog').dialog('close');

        });

        $(".patient").popover({

            placement : 'right',
            animation : true

        });

        $(".patient_visit").popover({

            placement : 'top',
            animation : true

        });

        $(".btn").tooltip({

            placement : 'bottom',
            animation : true

        });

        $(".update_sponsor").click(function() {

            $(".sponsor_panel").slideToggle();

        });

        $(".slide_up").click(function() {

            $(".sponsor_panel").slideUp();
        });

        $(".vitals_up").click(function() {

            $(".vitals_panel").slideToggle();
        });

        $(".vitals_cancel").click(function() {

            $(".vitals_panel").slideUp();
        });

    });

</script>