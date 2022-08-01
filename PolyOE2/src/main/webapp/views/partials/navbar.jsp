<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 27/07/2022
  Time: 07:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar -->
<style>
  .navbar .nav-link {
    color: #fff !important;
  }
</style>
<nav class="navbar navbar-expand-lg navbar-dark d-none d-lg-block bg-dark" style="z-index: 2000;">
  <div class="container-fluid">
    <!-- Navbar brand -->
    <a class="navbar-brand nav-link" target="_blank" href="#">
      <img src="<c:url value="/assets/images/mainLogo.png"/>" alt="logo">
    </a>
    <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
            aria-controls="navbarExample01" aria-expanded="false" aria-label="Toggle navigation">
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarExample01">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item active">
          <a class="nav-link" aria-current="page" href="<c:url value="/account/sign-in" />">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="https://www.youtube.com/channel/UC5CF7mLQZhvx8O5GODZAhdA" rel="nofollow"
             target="_blank">Learn Bootstrap 5</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="https://mdbootstrap.com/docs/standard/" target="_blank">Download MDB UI KIT</a>
        </li>
      </ul>

      <ul class="navbar-nav d-flex flex-row ms-lg-n5">
        <!-- Icon dropdown -->
        <li class="nav-item me-3 me-lg-0 dropdown">
          <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-mdb-toggle="dropdown"
                  aria-expanded="false"
          >
            <i class="fas fa-user"></i> My Account
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li>
              <a class="dropdown-item" href="#">Action</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Another action</a>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item" href="#">Something else here</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Navbar -->
