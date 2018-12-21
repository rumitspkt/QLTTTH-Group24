<div class="page-container">
	<!-- MAIN CONTENT -->
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row m-b-35">
					<div class="col-md-12">
						<div class="overview-wrap">
							<h2 class="title-1">My Contact</h2>

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
							<div class="table-data__tool-left"></div>
							<div class="table-data__tool-right">
								<button id="btn-add"
									class="au-btn au-btn-icon au-btn--green au-btn--small"
									data-toggle="modal" data-target="#addModal">
									<i class="zmdi zmdi-plus"></i>add
								</button>
							</div>
						</div>
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
								<thead>
									<tr>
										<th>no</th>
										<th>name</th>
										<th>phone number</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${contacts}" var="contact">
										<tr class="tr-shadow contact-row" contactId="${contact.id}">
											<td class="contact-id">${contact.id}</td>
											<td class="contact-name">${contact.name}</td>
											<td class="contact-phoneNumber">${contact.phoneNumber}</td>
											<td>
												<div class="table-data-feature">
													<button contactId="${contact.id}" class="button btn-edit"
														data-placement="top" title="Edit" data-toggle="modal"
														data-target="#editModal">
														<i class="zmdi zmdi-edit"></i>
													</button>
													<button contactId="${contact.id}"
														class="button btn-delete m-l-25" data-placement="top"
														title="Delete" data-toggle="modal"
														data-target="#deleteModal">
														<i class="zmdi zmdi-delete"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr class="spacer"></tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- END DATA TABLE -->
					</div>
				</div>



				<div class="row">
					<div class="col-md-12">
						<div class="copyright">
							<p>
								Copyright © 2018 Colorlib. All rights reserved. Template by <a
									href="https://colorlib.com">Colorlib</a>.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<!-- END PAGE CONTAINER -->
	<!-- modal medium -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="mediumModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="mediumModalLabel">Add New Contact</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="${pageContext.request.contextPath}/contact/new"
					method="post" class="">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-user"></i>
								</div>
								<input type="text" id="name" name="name" placeholder="Name"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-asterisk"></i>
								</div>
								<input type="text" id="phoneNumber" name="phoneNumber"
									placeholder="Phone number" class="form-control">
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="mediumModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="mediumModalLabel">Confirm delete</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="deleteModal"
					action="${pageContext.request.contextPath}/contact/delete"
					method="post" class="">
					<div class="modal-body">Do you want to delete this contact?</div>
					<input hidden type="text" id="id" name="id" class="form-control">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Confirm</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="mediumModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="mediumModalLabel">Edit Contact</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="editModal"
					action="${pageContext.request.contextPath}/contact/edit"
					method="post" class="">
					<div class="modal-body">

						<input hidden type="text" id="id" name="id" class="form-control">

						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-user"></i>
								</div>
								<input type="text" id="name" name="name" placeholder="Name"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-asterisk"></i>
								</div>
								<input type="text" id="phoneNumber" name="phoneNumber"
									placeholder="Phone number" class="form-control">
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary btn-edit">Edit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end modal medium -->
</div>