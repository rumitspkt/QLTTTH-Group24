<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Login</title>

    <%@ include file="/jsp/fragments/admin-declare-top.jsp" %>

</head>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/images/icon/logo.png" alt="CoolAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="${pageContext.request.contextPath}/login" method="post">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <input class="au-input au-input--full" type="text" name="username" placeholder="User name">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                </div>
                                <!-- <button class="au-btn au-btn--block au-btn--green m-t-20  m-b-20" type="submit">sign in</button> -->
                                <button type="submit" class="btn btn-outline-primary btn-lg btn-block au-btn--small m-t-20">LOGIN</button>
                        
                            </form>
                            <div class="p-4 text-center">
                                <p>
                                    Don't you have account ?
                                    <a href="${pageContext.request.contextPath}/register" class="btn btn-link btn-sm">REGISTER</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

   <%@ include file="/jsp/fragments/admin-declare-bottom.jsp" %>
   <%@ include file="/jsp/fragments/toastr.jsp"%>
   
</body>

</html>
<!-- end document-->