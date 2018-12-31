<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header-desktop">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="header-wrap">
				<form class="form-header" action="" method="POST">
					<input class="au-input au-input--xl" type="text" name="search"
						placeholder="Search for datas &amp; reports..." />
					<button class="au-btn--submit" type="submit">
						<i class="zmdi zmdi-search"></i>
					</button>
				</form>
				<div class="header-button">
					<div class="noti-wrap">

						<div class="noti__item js-item-menu">
							<i class="zmdi zmdi-notifications"></i> <span class="quantity">${sessionScope.quantityAlert}</span>
							<div class="notifi-dropdown js-dropdown">
								<div class="notifi__title">
									<p>You have ${sessionScope.quantityAlert} Notifications</p>
								</div>

								<c:forEach items="${alerts}" var="alert">
									<div class="notifi__item">
										<div class="bg-c1 img-cir img-40">
											<i class="zmdi zmdi-email-open"></i>
										</div>
										<div class="content">

											<p hidden="hidden">${alert.content}</p>
											<c:choose>
												<c:when test="${alert.priority == 'LOW'}">
													<span class="btn btn-info btn-sm">Low</span>
													<p>${alert.title}</p>
												</c:when>
												<c:when test="${alert.priority == 'MEDIUM'}">
													<span class="btn btn-warning btn-sm">Medium</span>
													<p>${alert.title}</p> 
												</c:when>
												<c:otherwise>
													<span class="btn btn-danger btn-sm">High</span>
													<p>${alert.title}</p>
												</c:otherwise>
											</c:choose>
											<span class="daste">${alert.date}</span>
										</div>
									</div>
								</c:forEach>

								<div class="notifi__footer">
									<a href="#">End</a>
								</div>
							</div>
						</div>
					</div>
					<div class="account-wrap">
						<div class="account-item clearfix js-item-menu">
							<div class="image">
								<img src="${sessionScope.user.urlAvatar}"
									alt="${sessionScope.user.firstName} ${sessionScope.user.lastName}" />
							</div>
							<div class="content">
								<a class="js-acc-btn" href="#">${sessionScope.user.firstName}
									${sessionScope.user.lastName}</a>
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
											<a href="#">${sessionScope.user.firstName}
												${sessionScope.user.lastName}</a>
										</h5>
										<span class="email">${sessionScope.user.email}</span>
									</div>
								</div>
								<div class="account-dropdown__body">
									<div class="account-dropdown__item">
										<a href="${pageContext.request.contextPath}/lecturer/profile">
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