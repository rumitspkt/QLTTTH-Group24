$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("modelId");
		var title = $("tr.model-row[modelId=" + id + "] td.model-title").text();
		var description = $("tr.model-row[modelId=" + id + "] td.model-description").text();
		$("form#editModal input#title").val(title);
		$("form#editModal input#description").val(description);
		$("form#editModal input#id").val(id);
	});
});

