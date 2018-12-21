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
<title>Post</title>

<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE -->
		<%@ include file="/jsp/fragments/lecturer-header-mobile.jsp"%>
		<!-- END HEADER MOBILE -->

		<!-- MENU SIDEBAR -->
		<%@ include file="/jsp/fragments/lecturer-sidebar.jsp"%>
		<!-- END MENU SIDEBAR -->

		<!-- PAGE CONTAINER -->
		<div class="page-container">
			<!-- HEADER DESKTOP -->
			<%@ include file="/jsp/fragments/lecturer-header-desktop.jsp"%>
			<!-- HEADER DESKTOP -->

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="section__content section__content--p30">
            <div class="container-fluid">
              <div class="row m-b-35">
                <div class="col-md-12">
                  <div class="overview-wrap">
                    <h2 class="title-1">Create New Post</h2>

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
                      <div id="editor"></div>
                    </div>
                    <div class="card-footer p-t-35">
                      <!-- attached file -->
                      <div class="row form-group">
                        <div class="col col-md-2">
                          <a href="#"
                            >Attached Files
                            <span class="badge badge-success">7</span>
                          </a>
                        </div>
                        <div class="col-12 col-md-10">
                          <input
                            type="file"
                            id="file-multiple-input"
                            name="file-multiple-input"
                            multiple=""
                            class="form-control-file"
                          />
                        </div>
                      </div>
                      <!-- categories -->
                      <div class="row form-group">
                        <div class="col col-md-2">
                          <a href="#"
                            >Categories
                            <span class="badge badge-primary">5</span>
                          </a>
                        </div>
                        <div class="col-12 col-md-10">
                          <div class="row">
                            <div class="col">
                            <div class="badge badge-primary m-b-10"
                              >Java Servlet</div
                            >
                            <div>
                            <label
                              class="switch switch-3d switch-primary mr-3 switch-xs"
                            >
                              <input
                                type="checkbox"
                                class="switch-input"
                                checked="true"
                              />
                              <span class="switch-label"></span>
                              <span class="switch-handle"></span>
                            </label>
                            </div>
                          </div>

                          <div class="col">
                              <div class="badge badge-primary m-b-10"
                                >Java Servlet</div
                              >
                              <div>
                              <label
                                class="switch switch-3d switch-primary mr-3 switch-xs"
                              >
                                <input
                                  type="checkbox"
                                  class="switch-input"
                                  checked="true"
                                />
                                <span class="switch-label"></span>
                                <span class="switch-handle"></span>
                              </label>
                              </div>
                            </div>

                            <div class="col">
                                <div class="badge badge-primary m-b-10"
                                  >Java Servlet</div
                                >
                                <div>
                                <label
                                  class="switch switch-3d switch-primary mr-3 switch-xs"
                                >
                                  <input
                                    type="checkbox"
                                    class="switch-input"
                                    checked="true"
                                  />
                                  <span class="switch-label"></span>
                                  <span class="switch-handle"></span>
                                </label>
                                </div>
                              </div>

                              <div class="col">
                                  <div class="badge badge-primary m-b-10"
                                    >Java Servlet</div
                                  >
                                  <div>
                                  <label
                                    class="switch switch-3d switch-primary mr-3 switch-xs"
                                  >
                                    <input
                                      type="checkbox"
                                      class="switch-input"
                                      checked="true"
                                    />
                                    <span class="switch-label"></span>
                                    <span class="switch-handle"></span>
                                  </label>
                                  </div>
                                </div>

                                <div class="col">
                                    <div class="badge badge-primary m-b-10"
                                      >Java Servlet</div
                                    >
                                    <div>
                                    <label
                                      class="switch switch-3d switch-primary mr-3 switch-xs"
                                    >
                                      <input
                                        type="checkbox"
                                        class="switch-input"
                                        checked="true"
                                      />
                                      <span class="switch-label"></span>
                                      <span class="switch-handle"></span>
                                    </label>
                                    </div>
                                  </div>
                                  
                        </div>
                      </div>
                    </div>
                    <div class="card-footer p-t-25 p-b-25">
                      <button type="submit" class="btn btn-primary btn-sm">
                        <i class="fa fa-dot-circle-o"></i> Submit
                      </button>
                      <button type="reset" class="btn btn-danger btn-sm">
                        <i class="fa fa-ban"></i> Reset
                      </button>
                    </div>
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
	</script>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
