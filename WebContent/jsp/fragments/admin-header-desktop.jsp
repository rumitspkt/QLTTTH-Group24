<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="header-desktop">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="header-wrap">
				<form class="form-header" action="" method="POST">
					<input class="au-input au-input--xl" type="text" name="search"
						placeholder="Search for datas &amp; reports... (comming soon)" />
					<button class="au-btn--submit" type="submit">
						<i class="zmdi zmdi-search"></i>
					</button>
				</form>
				<div class="header-button">

					<div class="account-wrap">
						<div class="account-item clearfix js-item-menu">
							<div class="image">
								<img src="${sessionScope.user.urlAvatar}"
									alt="${sessionScope.user.firstName} ${sessionScope.user.lastName}" />
							</div>
							<div class="content">
								<a class="js-acc-btn" href="#">${sessionScope.user.firstName} ${sessionScope.user.lastName}</a>
							</div>
							<div class="account-dropdown js-dropdown">
								<div class="info clearfix">
									<div class="image">
										<a href="#"> <img src="${sessionScope.user.urlAvatar}"
											alt="${sessionScope.user.firstName} ${sessionScope.user.lastName}" />
										</a>
									</div>
									<div class="content">
										<h5 class="name">
											<a href="#">${sessionScope.user.firstName} ${sessionScope.user.lastName}</a>
										</h5>
										<span class="email">${sessionScope.user.email}</span>
									</div>
								</div>
								<div class="account-dropdown__body">
									<div class="account-dropdown__item">
										<a href="${pageContext.request.contextPath}/admin/profile">
											<i class="zmdi zmdi-account"></i>Profile
										</a>
									</div>
								</div>
								<div class="account-dropdown__footer">
									<a href="${pageContext.request.contextPath}/logout"> <i
										class="zmdi zmdi-power"></i>Logout
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>