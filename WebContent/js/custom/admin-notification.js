$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("modelId");
		var title = $("tr.model-row[modelId=" + id + "] td.model-title").text();
		var content = $("tr.model-row[modelId=" + id + "] td.model-content").text();
		var priority = $("tr.model-row[modelId=" + id + "] td.model-priority").text();
		$("form#editModal input#title").val(title);
		$("form#editModal input#content").val(content);
		$("form#editModal select#priority").val(priority);
		$("form#editModal input#id").val(id);
	});
	
	$("tr button.btn-delete").click(function(){
		var id = $(this).attr("modelId");
		$("form#deleteModal input#id").val(id);
	});
	
});

