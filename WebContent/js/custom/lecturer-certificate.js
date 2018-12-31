$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("modelId");
		console.log("modelId:" + id);
		var fullName = $("tr.model-row[modelId=" + id + "] td.model-fullName").text();
		var firstScore = $("tr.model-row[modelId=" + id + "] td.model-firstScore").text();
		var secondScore = $("tr.model-row[modelId=" + id + "] td.model-secondScore").text();
		var certificateId = $("tr.model-row[modelId=" + id + "] td.model-certificateId").text();
		var enrollment = $("tr.model-row[modelId=" + id + "] td.model-enrollment").text();
		$("form#editModal input#firstScore").val(firstScore);
		$("form#editModal input#secondScore").val(secondScore);
		$("form#editModal input#enrollment").val(enrollment);
		$("form#editModal span#fullName").text(fullName);
		$("form#editModal select#certificate").val(certificateId);
	});
});

