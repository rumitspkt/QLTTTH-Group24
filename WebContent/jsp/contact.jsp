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
<title>CRUD</title>
<%@ include file="/jsp/fragments/admin-declare-top.jsp"%>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- header -->
		<%@ include file="/jsp/fragments/header.jsp"%>
		<!-- PAGE CONTAINER -->
		<%@ include file="/jsp/fragments/main.jsp"%>

	</div>

	<%@ include file="/jsp/fragments/admin-declare-bottom.jsp"%>
	<!-- custom JS -->
	<script src="${pageContext.request.contextPath}/js/custom/contact.js"></script>
	<%@ include file="/jsp/fragments/toastr.jsp"%>
</body>
</html>
<!-- end document -->
