<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Register</title>

<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>

</head>

<body class="animsition">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<div class="login-wrap">
					<div class="login-content">
						<div class="login-logo">
							<a href="#"> <img src="${pageContext.request.contextPath}/images/icon/logo.png" alt="CoolAdmin">
							</a>
						</div>
						<div class="login-form">
							<form action="" method="post">
								<div class="form-group">
									<label>Username</label> <input class="au-input au-input--full"
										type="text" name="username" placeholder="Username">
								</div>
								<div class="form-group">
									<label>Email Address</label> <input
										class="au-input au-input--full" type="email" name="email"
										placeholder="Email">
								</div>
								<div class="form-group">
									<label>Password</label> <input class="au-input au-input--full"
										type="password" name="password" placeholder="Password">
								</div>

								<button type="button"
									class="btn btn-outline-primary btn-lg btn-block au-btn--small m-t-20">REGISTER</button>

							</form>
							<div class="p-4 text-center">
								<p>
									Already have account ? <a href="${pageContext.request.contextPath}/login"
										class="btn btn-link btn-sm">LOGIN</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>

</body>

</html>
<!-- end document-->