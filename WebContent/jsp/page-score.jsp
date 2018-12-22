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
					<h2>Score</h2>
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
					<select>
						<option value="1">Android Programing Basic</option>
						<option value="1">Spanish</option>
						<option value="1">Arabic</option>
						<option value="1">Portuguise</option>
						<option value="1">Bengali</option>
					</select>
				</div>
			</div>
			<div class="row about_inner pl-4">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>ID</th>
							<th>Full name</th>
							<th>Score 1</th>
							<th>Score 2</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
						<tr>
							<td>2</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
						<tr>
							<td>3</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
						<tr>
							<td>4</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
						<tr>
							<td>5</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
						<tr>
							<td>6</td>
							<td>215489685</td>
							<td>Rum Nguyen</td>
							<td>8.5</td>
							<td>7</td>
						</tr>
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