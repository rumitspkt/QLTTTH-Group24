<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="${pageContext.request.contextPath}/js/custom/toastr-config.js"></script>

<c:forEach items="${successes}" var="success">
	<script>
		toastr["success"]("${success}", "Success!")
	</script>
</c:forEach>

<c:forEach items="${errors}" var="error">
	<script>
		toastr["error"]("${error}", "Error!")
	</script>
</c:forEach>