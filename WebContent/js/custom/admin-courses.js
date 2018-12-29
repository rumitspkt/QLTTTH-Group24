$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-edit").click(function(){
		var id = $(this).attr("modelId");
		var title = $("tr.model-row[modelId=" + id + "] td.model-title").text();
		var shortDescription = $("tr.model-row[modelId=" + id + "] td.model-shortDescription").text();
		var objective = $("tr.model-row[modelId=" + id + "] td.model-objective").text();
		var eligibility = $("tr.model-row[modelId=" + id + "] td.model-eligibility").text();
		var outline = $("tr.model-row[modelId=" + id + "] td.model-outline").text();
		var schedules = $("tr.model-row[modelId=" + id + "] td.model-schedules").text();
		var totalSeat = $("tr.model-row[modelId=" + id + "] td.model-totalSeat").text();
		var fee = $("tr.model-row[modelId=" + id + "] td.model-fee").text();
		var lecturer = $("tr.model-row[modelId=" + id + "] td.model-lecturer").text();
		var categoryId = $("tr.model-row[modelId=" + id + "] td.model-categoryId").text();
		$("form#editModal input#title").val(title);
		$("form#editModal input#shortDescription").val(shortDescription);
		$("form#editModal input#id").val(id);
		$("form#editModal input#objective").val(objective);
		$("form#editModal input#eligibility").val(eligibility);
		$("form#editModal textarea#outline").val(outline);
		$("form#editModal input#schedules").val(schedules);
		$("form#editModal input#totalSeat").val(totalSeat);
		$("form#editModal input#fee").val(fee);
		$("form#editModal select#lecturer").val(lecturer);
		$("form#editModal select#categoryId").val(categoryId);
	});
	
	$("tr button.btn-delete").click(function(){
		var id = $(this).attr("modelId");
		$("form#deleteModal input#id").val(id);
	});
	
});

