$(document).ready(function(){
	console.log('running script contact');
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("contactId");
		var name = $("tr.contact-row[contactId=" + id + "] td.contact-name").text();
		var phoneNumber = $("tr.contact-row[contactId=" + id + "] td.contact-phoneNumber").text();
		$("form#editModal input#name").val(name);
		$("form#editModal input#phoneNumber").val(phoneNumber);
		$("form#editModal input#id").val(id);
	});
	
	$("tr button.btn-delete").click(function(){
		var id = $(this).attr("contactId");
		$("form#deleteModal input#id").val(id);
	});
	
});

