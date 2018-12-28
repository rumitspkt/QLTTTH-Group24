$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("modelId");
		var name = $("tr.model-row[modelId=" + id + "] td.model-title").text();
		var phoneNumber = $("tr.model-row[modelId=" + id + "] td.model-description").text();
		$("form#editModal input#title").val(name);
		$("form#editModal input#description").val(phoneNumber);
		$("form#editModal input#id").val(id);
	});
	
	$("tr button.btn-delete").click(function(){
		var id = $(this).attr("modelId");
		$("form#deleteModal input#id").val(id);
	});
	
});

