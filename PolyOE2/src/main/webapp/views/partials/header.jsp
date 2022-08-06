<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 25/07/2022
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Main Navigation-->
<header>
  <style>
    #intro {
      background-image: url("https://mdbootstrap.com/img/new/fluid/city/018.jpg");
      height: 65vh;
    }

    /* Height for devices larger than 576px */
    @media (min-width: 992px) {
      #intro {
        margin-top: -58.59px;
      }
    }
  </style>

  <!-- Navbar -->
  <%@include file="navbar.jsp" %>
  <!-- Navbar -->

  <c:if test="${ username == null}">
  <!-- Background image -->
  <div id="intro" class="bg-image shadow-2-strong">
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.8);">
      <div class="container d-flex align-items-center justify-content-center text-center h-100">
        <div class="text-white">
          <h1 class="mb-3">WELCOME TO ORANGE</h1>
          <h6 class="mb-4">Poly online entertainment the best of media</h6>
          <a class="btn btn-outline-light btn-lg m-2" href="<c:url value="/account/sign-in" />" role="button"
             rel="nofollow">Sign in</a>
          <a class="btn btn-outline-light btn-lg m-2" href="<c:url value="/account/sign-up" />"
             role="button">SIGN UP</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Background image -->
  </c:if>
</header>