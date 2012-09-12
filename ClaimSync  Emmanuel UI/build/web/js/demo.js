$(function() {

    $('#dialog').dialog({
        autoOpen : false,
        width : 900,
        height: '90%', 
        modal : true,
        position : "top"

    });
    
    

    $('.dialog_link').click(function() {
        $('#dialog').dialog('open');
        return false;
    });
    
    
    $('#registration_dialog').dialog({
        autoOpen : false,
        width : "100%",
        modal : true
       

    });
    
    

    $('.registration_dialog_link').click(function() {
        
        $('#registration_dialog').dialog('open');
        return false;
    });

    $('.user_summary').dialog({
        autoOpen : false,
        width : 600,
        modal : true,
        position : "top"

    });

    $('.user_summary_link').click(function() {
        $('.user_summary').dialog('open');
        return false;
    });

	

    $('#dialog2').dialog({
        autoOpen : false,
        width : 600,
        modal : true,

    });

    $('.dialog_link2').click(function() {
        $('#dialog2').dialog('open');
        return false;
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

    $('.usersummary').dialog({
        autoOpen : false,
        width : 600,
        modal : true,
        position : "top"

    });

    $('#patientidlink').click(function() {

        $('.usersummary').dialog('open');
        return false;
    });

    $(".update_sponsor").click(function() {
        $(".sponsor_panel").slideToggle();
        $(".vitals_panel").slideUp();
        $(".history_panel").slideUp();
    });

    $(".update_vitals").click(function() {
        $(".sponsor_panel").slideUp();
        $(".vitals_panel").slideToggle();
        $(".history_panel").slideUp();
    });

    $(".update_history").click(function() {
        $(".sponsor_panel").slideUp();
        $(".vitals_panel").slideUp();
        $(".history_panel").slideToggle();
    });

    $(".slideup").click(function() {
        $(".sponsor_panel").slideUp();
        $(".vitals_panel").slideUp();
        $(".history_panel").slideUp();

    })      
        
    $(".vital_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
        /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideDown("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideUp("slow");
         $(".clerk").slideUp("slow"); 
           
            
    });
    $(".diagnosis_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
        /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideDown("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideUp("slow");
         $(".clerk").slideUp("slow");    
            
    });
    $(".history_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
        /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideDown("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideUp("slow");
         $(".clerk").slideUp("slow");    
            
    });
    $(".prescription_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
       /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideDown("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideUp("slow");
         $(".clerk").slideUp("slow");    
            
    });
    $(".laboratory_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
        /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideDown("slow");
        $(".results").slideUp("slow");
         $(".clerk").slideUp("slow"); 
            
    });
        
    $(".results_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
       /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideDown("slow");
        $(".clerk").slideUp("slow");  
            
    });
    
    $(".clerking_link").click(function(){
        $(".bar").addClass("btn-info")
        $(".bar").removeClass("btn-inverse")
       /* $(this).removeClass("btn-info")
        $(this).addClass("btn-inverse") */
        $(".vital").slideUp("slow");
        $(".diagnosis").slideUp("slow");
        $(".history").slideUp("slow");
        $(".prescription").slideUp("slow");
        $(".laboratory").slideUp("slow");
        $(".results").slideUp("slow");
        $(".clerk").slideDown("slow");    
    });
/*$('#user_summary').dialog({
	 autoOpen : false,
	 width : 600,
	 modal :true

	 });

	 // Dialog Link
	 $('#dialog_link').click(function() {
	 $('#dialog').dialog('open');
	 return false;
	 });

	 // Modal Link
	 $('#modal_link').click(function() {
	 $('#dialog').dialog('open');
	 return false;
	 });

	 $('#view_user').click(function(){
	 $('#user_summary').dialog('open');
	 return false;
	 });

	 $('#rangeA').daterangepicker();

	 */

});
