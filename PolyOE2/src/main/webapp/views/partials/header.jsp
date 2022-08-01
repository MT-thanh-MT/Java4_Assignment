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
      height: 100vh;
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

  <!-- Background image -->
  <div id="intro" class="bg-image shadow-2-strong">
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.8);">
      <div class="container d-flex align-items-center justify-content-center text-center h-100">
        <div class="text-white">
          <h1 class="mb-3">Learn Bootstrap 5 with MDB</h1>
          <h5 class="mb-4">Best & free guide of responsive web design</h5>
          <a class="btn btn-outline-light btn-lg m-2" href="https://www.youtube.com/watch?v=c9B4TPnak1A" role="button"
             rel="nofollow" target="_blank">Start tutorial</a>
          <a class="btn btn-outline-light btn-lg m-2" href="https://mdbootstrap.com/docs/standard/" target="_blank"
             role="button">Download MDB UI KIT</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Background image -->
</header>