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
<title>Profile</title>

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
                    <h2 class="title-1">Profile</h2>

                    <!--
                      <button class="au-btn au-btn-icon au-btn--blue">
                        <i class="zmdi zmdi-plus"></i>add
                      </button>
                    -->
                  </div>
                </div>
              </div>
              <div class="row m-b-80">
                <div class="col-md-4">
                  <div class="row justify-content-around m-b-25">
                    <div class="image">
                      <a href="#">
                        <img src="${pageContext.request.contextPath}/images/icon/avatar-01.jpg" alt="John Doe" />
                      </a>
                    </div>
                  </div>

                  <div class="row justify-content-around m-b-25">
                    <button
                      type="button"
                      class="btn btn-outline-primary btn-md"
                    >
                      <i class="fa fa-image"></i>&nbsp; Change Image
                    </button>
                  </div>

                  <div class="row justify-content-around">
                    <button type="button" class="btn btn-outline-danger btn-md">
                      <i class="fa fa-server"></i>&nbsp; Change Password
                    </button>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="card">
                    <div class="card-header">
                      <strong>Basic Information</strong>
                    </div>
                    <div class="card-body card-block">
                      <form action="" method="post" class="form-horizontal">
                        <div class="row form-group">
                          <div class="col col-md-6">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-user"></i>
                              </div>
                              <input
                                type="text"
                                id="input1-group1"
                                name="input1-group1"
                                placeholder="Full name"
                                class="form-control"
                              />
                            </div>
                          </div>

                          <div class="col col-md-6">
                                <div class="input-group">
                                  <div class="input-group-addon">
                                    <i class="fa fa-birthday-cake"></i>
                                  </div>
                                  <input
                                    type="text"
                                    id="input1-group1"
                                    name="input1-group1"
                                    placeholder="Birthday"
                                    class="form-control"
                                  />
                                </div>
                              </div>
                        </div>

                        <div class="row form-group">
                          <div class="col col-md-12">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-address-book"></i>
                              </div>
                              <input
                                type="text"
                                id="input1-group1"
                                name="input1-group1"
                                placeholder="Address"
                                class="form-control"
                              />
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                    <div class="card-footer">
                      <button type="submit" class="btn btn-primary btn-sm">
                        <i class="fa fa-dot-circle-o"></i> Edit
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <%@ include file="/jsp/fragments/admin-footer.jsp"%>
          </div>
			</div>
			<!-- END MAIN CONTENT -->
			<!-- END PAGE CONTAINER -->
		</div>
	</div>
	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
