$(document).ready(function(){
	
	// pass data from row into modal
	
	$("tr button.btn-show").click(function(){
		var id = $(this).attr("modelId");
		var senderName = $("tr.model-row[modelId=" + id + "] td.model-senderName").text();
		var emailOrPhone = $("tr.model-row[modelId=" + id + "] td.model-emailOrPhone").text();
		var subject = $("tr.model-row[modelId=" + id + "] td.model-subject").text();
		var content = $("tr.model-row[modelId=" + id + "] td.model-content").text();
		$("form#showModal input#senderName").val(senderName);
		$("form#showModal input#emailOrPhone").val(emailOrPhone);
		$("form#showModal input#subject").val(subject);
		$("form#showModal textarea#content").val(content);
	});
	
});

