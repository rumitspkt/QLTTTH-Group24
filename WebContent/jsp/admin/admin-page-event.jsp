<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="au theme template" />
<meta name="author" content="Hau Nguyen" />
<meta name="keywords" content="au theme template" />

<!-- Title Page -->
<title>Event Page</title>

<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE -->
		<%@ include file="/jsp/fragments/admin-header-mobile.jsp"%>
		<!-- END HEADER MOBILE -->

		<!-- MENU SIDEBAR -->
		<%@ include file="/jsp/fragments/admin-sidebar.jsp"%>
		<!-- END MENU SIDEBAR -->

		<!-- PAGE CONTAINER -->
		<div class="page-container">
			<!-- HEADER DESKTOP -->
			<%@ include file="/jsp/fragments/admin-header-desktop.jsp"%>
			<!-- HEADER DESKTOP -->

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-b-35">
							<div class="col-md-12">
								<div class="overview-wrap">
									<h2 class="title-1">Event Page</h2>

									<!--
                      <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add
                      </button>
                    -->
								</div>
							</div>
						</div>
						<div class="row m-b-80">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>Editor </strong>by CKEditor
									</div>
									<div class="card-body card-block">
										<div id="editor">${page.content}</div>
									</div>
									<div class="card-footer p-t-25 p-b-25">
										<a href="javascript: post()" class="btn btn-primary btn-sm">
											<i class="fa fa-dot-circle-o"></i> Submit
										</a>
										<button onclick="onReset()" type="reset" class="btn btn-danger btn-sm">
											<i class="fa fa-ban"></i> Reset
										</button>
									</div>
								</div>
							</div>

							<%@ include file="/jsp/fragments/admin-footer.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
			<!-- END PAGE CONTAINER -->
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<script>
		initSample();
		function post() {
			var method = "post";

			var form = document.createElement("form");
			form.setAttribute("method", method);
			form.setAttribute("action",
					"${pageContext.request.contextPath}/admin/page/event/edit");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "contents");
			hiddenField.setAttribute("value", CKEDITOR.instances.editor
					.getData());

			form.appendChild(hiddenField);

			document.body.appendChild(form);
			form.submit();
		}
		function onReset(){
			CKEDITOR.instances.editor.setData('');
		} 
	</script>

	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
