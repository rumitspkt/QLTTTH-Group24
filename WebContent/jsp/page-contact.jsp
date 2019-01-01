<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.PNG" type="image/png">

<%@ include file="/jsp/fragments/page-declare-top.jsp"%>

<!-- custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
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
					<h2>Contact Us</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Contact Area =================-->
	<section class="contact_area p_120">
		<div class="container">
			<div id="mapBox" class="mapBox" data-lat="40.701083"
				data-lon="-74.1522848" data-zoom="13"
				data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia."
				data-mlat="40.701083" data-mlon="-74.1522848"></div>
			<div class="row">
				<div class="col-lg-3">
					<div class="contact_info">
						<div class="info_item">
							<i class="lnr lnr-home"></i>
							<h6>No. 1 Vo Van Ngan, Thu Duc</h6>
							<p>Thanh Pho Ho Chi Minh</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-phone-handset"></i>
							<h6>
								<a href="#">0903 555 666</a>
							</h6>
							<p>Mon to Fri 9am to 6 pm</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-envelope"></i>
							<h6>
								<a href="#">rum123ken@gmail.com</a>
							</h6>
							<p>Send us your query anytime!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<form class="row" action="${pageContext.request.contextPath}/contact/new" 
						method="post" >
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" id="name" name="senderName"
									placeholder="Enter your name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="email" name="emailOrPhone"
									placeholder="Enter email address or phone number">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="subject"
									name="subject" placeholder="Enter Subject">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<textarea class="form-control" name="content" id="message"
									rows="1" placeholder="Enter Message"></textarea>
							</div>
						</div>
						<div class="col-md-12 text-right">
							<button type="submit" value="submit" class="btn submit_btn">Send
								Message</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================Contact Area =================-->

	<!--================ start footer Area  =================-->
	<%@ include file="/jsp/fragments/page-footer.jsp"%>
	<!--================ End footer Area  =================-->






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<%@ include file="/jsp/fragments/page-declare-bottom.jsp"%>
	<!-- contact js -->
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/contact.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${pageContext.request.contextPath}/js/gmaps.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/theme.js"></script>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>