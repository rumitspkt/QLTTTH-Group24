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
                    <h2 class="title-1">Posts</h2>

                    <!-- <button class="au-btn au-btn-icon au-btn--blue">
                      <i class="zmdi zmdi-plus"></i>add
                    </button> -->
                  </div>
                </div>
              </div>
              <div class="row m-b-80">
                <div class="col-md-12">
                  <!-- DATA TABLE -->
                  <!-- <h3 class="title-5 m-b-35">data table</h3> -->
                  <div class="table-data__tool">
                    <div class="table-data__tool-left">
                      <div class="rs-select2--light rs-select2--md">
                        <select class="js-select2" name="property">
                          <option selected="selected">All Properties</option>
                          <option value="">Option 1</option>
                          <option value="">Option 2</option>
                        </select>
                        <div class="dropDownSelect2"></div>
                      </div>
                      <div class="rs-select2--light rs-select2--sm">
                        <select class="js-select2" name="time">
                          <option selected="selected">Today</option>
                          <option value="">3 Days</option>
                          <option value="">1 Week</option>
                        </select>
                        <div class="dropDownSelect2"></div>
                      </div>
                      <button class="au-btn-filter">
                        <i class="zmdi zmdi-filter-list"></i>filters
                      </button>
                    </div>
                    <div class="table-data__tool-right">
                      <button
                        class="au-btn au-btn-icon au-btn--green au-btn--small"
                      >
                        <i class="zmdi zmdi-plus"></i>add
                      </button>
                      <div
                        class="rs-select2--dark rs-select2--sm rs-select2--dark2"
                      >
                        <select class="js-select2" name="type">
                          <option selected="selected">Export</option>
                          <option value="">Option 1</option>
                          <option value="">Option 2</option>
                        </select>
                        <div class="dropDownSelect2"></div>
                      </div>
                    </div>
                  </div>
                  <div class="table-responsive table-responsive-data2">
                    <table class="table table-data2">
                      <thead>
                        <tr>
                          <th>
                            <label class="au-checkbox">
                              <input type="checkbox" />
                              <span class="au-checkmark"></span>
                            </label>
                          </th>
                          <th>name</th>
                          <th>email</th>
                          <th>description</th>
                          <th>date</th>
                          <th>status</th>
                          <th>price</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="tr-shadow">
                          <td>
                            <label class="au-checkbox">
                              <input type="checkbox" />
                              <span class="au-checkmark"></span>
                            </label>
                          </td>
                          <td>Lori Lynch</td>
                          <td>
                            <span class="block-email">lori@example.com</span>
                          </td>
                          <td class="desc">Samsung S8 Black</td>
                          <td>2018-09-27 02:12</td>
                          <td>
                            <span class="status--process">Processed</span>
                          </td>
                          <td>$679.00</td>
                          <td>
                            <div class="table-data-feature">
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Send"
                              >
                                <i class="zmdi zmdi-mail-send"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                              >
                                <i class="zmdi zmdi-edit"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                              >
                                <i class="zmdi zmdi-delete"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="More"
                              >
                                <i class="zmdi zmdi-more"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <tr class="spacer"></tr>
                        <tr class="tr-shadow">
                          <td>
                            <label class="au-checkbox">
                              <input type="checkbox" />
                              <span class="au-checkmark"></span>
                            </label>
                          </td>
                          <td>Lori Lynch</td>
                          <td>
                            <span class="block-email">john@example.com</span>
                          </td>
                          <td class="desc">iPhone X 64Gb Grey</td>
                          <td>2018-09-29 05:57</td>
                          <td>
                            <span class="status--process">Processed</span>
                          </td>
                          <td>$999.00</td>
                          <td>
                            <div class="table-data-feature">
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Send"
                              >
                                <i class="zmdi zmdi-mail-send"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                              >
                                <i class="zmdi zmdi-edit"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                              >
                                <i class="zmdi zmdi-delete"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="More"
                              >
                                <i class="zmdi zmdi-more"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <tr class="spacer"></tr>
                        <tr class="tr-shadow">
                          <td>
                            <label class="au-checkbox">
                              <input type="checkbox" />
                              <span class="au-checkmark"></span>
                            </label>
                          </td>
                          <td>Lori Lynch</td>
                          <td>
                            <span class="block-email">lyn@example.com</span>
                          </td>
                          <td class="desc">iPhone X 256Gb Black</td>
                          <td>2018-09-25 19:03</td>
                          <td><span class="status--denied">Denied</span></td>
                          <td>$1199.00</td>
                          <td>
                            <div class="table-data-feature">
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Send"
                              >
                                <i class="zmdi zmdi-mail-send"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                              >
                                <i class="zmdi zmdi-edit"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                              >
                                <i class="zmdi zmdi-delete"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="More"
                              >
                                <i class="zmdi zmdi-more"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                        <tr class="spacer"></tr>
                        <tr class="tr-shadow">
                          <td>
                            <label class="au-checkbox">
                              <input type="checkbox" />
                              <span class="au-checkmark"></span>
                            </label>
                          </td>
                          <td>Lori Lynch</td>
                          <td>
                            <span class="block-email">doe@example.com</span>
                          </td>
                          <td class="desc">Camera C430W 4k</td>
                          <td>2018-09-24 19:10</td>
                          <td>
                            <span class="status--process">Processed</span>
                          </td>
                          <td>$699.00</td>
                          <td>
                            <div class="table-data-feature">
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Send"
                              >
                                <i class="zmdi zmdi-mail-send"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Edit"
                              >
                                <i class="zmdi zmdi-edit"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="Delete"
                              >
                                <i class="zmdi zmdi-delete"></i>
                              </button>
                              <button
                                class="item"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="More"
                              >
                                <i class="zmdi zmdi-more"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!-- END DATA TABLE -->
                </div>
              </div>
              <%@ include file="/jsp/fragments/admin-footer.jsp"%>
            </div>
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