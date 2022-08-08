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
        <a class="navbar-brand nav-link" href="<c:url value="/HomePageServlet" />">
            <img src="<c:url value="/assets/images/mainLogo.png"/>" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                aria-controls="navbarExample01" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarExample01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item" id="Home">
                    <a class="nav-link" aria-current="page" href="<c:url value="/HomePageServlet" />"><i
                            class="fas fa-home"></i>&nbspHome</a>
                </li>
                <li class="nav-item" id="About">
                    <a class="nav-link" href="" rel="nofollow">
                        <i class="fas fa-address-card"></i>&nbspAbout Us
                    </a>
                </li>
                <li class="nav-item" id="Contact">
                    <a class="nav-link" href=""><i class="far fa-comment"></i>&nbspContact Us</a>
                </li>
                <c:if test="${ username != null}">
                    <li class="nav-item" id="Favorites">
                        <a class="nav-link" href="<c:url value="/FavoriteServlet" />"><i class="far fa-grin-hearts"></i>&nbspMy Favorites</a>
                    </li>
                </c:if>
                <c:if test="${isAdmin == true}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/Admin/AdminDashboardServlet" />"><i
                                class="far fa-grin-hearts"></i>&nbspAdministration Tool</a>
                    </li>
                </c:if>
            </ul>

            <!-- Right elements -->
            <ul class="navbar-nav flex-row">

                <li class="nav-item dropdown me-3 me-lg-1">
                    <a class="nav-link dropdown-toggle " href="#" id="navbarDropdownMenuLink" role="button"
                       data-mdb-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i>&nbsp ${username == null ? "Login":"Hello, " += userLogin.fullname}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                        <c:choose>
                            <c:when test="${ username == null}">
                                <li>
                                    <a class="dropdown-item" href="<c:url value="/account/sign-in" />">Login</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="<c:url value="/account/sign-in" />">Forgot
                                        password</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="<c:url value="/account/sign-up" />">Register</a>
                                </li>
                            </c:when>
                            <c:when test="${ username != null}">
                                <li>
                                    <a class="dropdown-item" href="<c:url value="/account/sign-out" />">Logout</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Change password</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="<c:url value="/account/edit-profile" />">Profile</a>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                </li>
            </ul>
            <!-- Right elements -->
        </div>
    </div>
</nav>
<!-- Navbar -->
