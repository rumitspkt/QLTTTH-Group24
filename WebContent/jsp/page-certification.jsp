<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="images/favicon.PNG" type="image/png">

<%@ include file="/jsp/fragments/page-declare-top.jsp"%>

<!-- custom css -->
<link rel="stylesheet" href="css/custom.css">
</head>
<body>

	<!--================Header Menu Area =================-->
	<%@ include file="/jsp/fragments/page-header-menu.jsp"%>
	<!--================Header Menu Area =================-->

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>Certification</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================About Area =================-->
	<section class="about_area p_120">
		<div class="container">
			<div class="mb-3">
				<h3 class="mb-20 title_color">Select Course</h3>
				<div class="default-select" id="default-select">
					<form action="${pageContext.request.contextPath}/certification"
						method="get">
						<select name="course" onchange="this.form.submit()">
							<c:choose>
								<c:when test="${selected == 0}">
									<option value="0" selected="selected">Courses</option>
								</c:when>
								<c:otherwise>
									<option value="0">Courses</option>
								</c:otherwise>
							</c:choose>

							<c:forEach items="${courses}" var="course">
								<c:choose>
									<c:when test="${course.id == selected}">
										<option selected="selected" value="${course.id}">${course.title}</option>
									</c:when>
									<c:otherwise>
										<option value="${course.id}">${course.title}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</form>
				</div>
			</div>
			<div class="row about_inner pl-4">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>ID</th>
							<th>Full name</th>
							<th>Type of certification</th>
							<th>Received date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${certificates}" var="certificate" varStatus="loop">
							<tr>
								<td>${loop.index + 1}</td>
								<td>${certificate.userId}</td>
								<td>${certificate.firstName} ${certificate.lastName}</td>
								<td>${certificate.title}</td>
								<td>${certificate.receivedCertificateDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="about_details"></div>
		</div>
	</section>


	<!--================End About Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
</body>
</html>