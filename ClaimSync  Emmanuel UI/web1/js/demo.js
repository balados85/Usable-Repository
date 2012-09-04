$(function() {

	$('#dialog').dialog({
		autoOpen : false,
		width : 600,
		modal :true,
                position : "top"
		
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
	
	
	

});
