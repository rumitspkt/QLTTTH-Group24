<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
          <div class="container-fluid">
            <div class="header-mobile-inner">
              <a class="logo" href="index.html">
                <img src="images/icon/logo.png" alt="Techaced" />
              </a>
              <button class="hamburger hamburger--slider" type="button">
                <span class="hamburger-box">
                  <span class="hamburger-inner"></span>
                </span>
              </button>
            </div>
          </div>
        </div>
        <nav class="navbar-mobile">
          <div class="container-fluid">
            <ul class="navbar-mobile__list list-unstyled">
              <li>
                <a href="${pageContext.request.contextPath}/lecturer">
                  <i class="fas fa-tachometer-alt"></i>Dashboard</a
                >
              </li>
              <li class="has-sub">
                <a class="js-arrow" href="#">
                    <i class="fas fa-edit"></i>Post</a>
                <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                    <li>
                        <a href="${pageContext.request.contextPath}/lecturer/post">Posts</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/lecturer/post/new">Create New</a>
                    </li>
                </ul>
            </li>
              <li>
                <a href="${pageContext.request.contextPath}/lecturer/score">
                  <i class="fas fa-calendar-o"></i>Score results</a
                >
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/lecturer/certificate"> <i class="fas fa-book"></i>Certificates</a>
              </li>
            </ul>
          </div>
        </nav>
      </header>