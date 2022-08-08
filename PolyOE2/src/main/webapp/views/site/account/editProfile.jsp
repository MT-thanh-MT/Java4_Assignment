<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 7/08/2022
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Your Profile</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- Custom styles -->
    <link rel="stylesheet" href="../../../assets/css/style.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:if test="${not empty error}">
    <script>
        swal({
            title: "Ohhhhh!",
            text: "${error}",
            icon: "error",
        });
    </script>
</c:if>
<c:if test="${not empty messenger}">
    <script>
        swal({
            title: "Oh MY GOD!",
            text: "${messenger}",
            icon: "success",
        });
    </script>
</c:if>
<!--Main Navigation-->
<header>
    <style>
        #intro {
            background-image: url(https://mdbootstrap.com/img/new/fluid/city/008.jpg);
            height: 100vh;
        }

        /* Height for devices larger than 576px */
        @media (min-width: 992px) {
            #intro {
                margin-top: -58.59px;
            }
        }

        .navbar .nav-link {
            color: #fff !important;
        }
    </style>

    <!-- Navbar -->
    <%@include file="../../partials/navbar.jsp" %>
    <!-- Navbar -->
    <!-- Background image -->
    <div id="intro" class="bg-image shadow-2-strong">
        <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-5 col-md-8">
                        <div class="text-center fs-2 text-light">Edit Profile</div>
                        <form class="bg-white rounded shadow-5-strong p-5"
                              action="<c:url value="/account/edit-profile"/>" method="post">

                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="id" class="form-control" id="username" value="${userLogin.id}" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="Pass" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="Pass"
                                       value="${userLogin.password}" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full name</label>
                                <input type="text" name="fullname" class="form-control" id="fullname"
                                       value="${userLogin.fullname}" required>
                            </div>
                            <div class="mb-3">
                                <label for="Email" class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control" id="Email"
                                       aria-describedby="emailHelp" value="${userLogin.email}" required>
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block mb-4">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Background image -->
</header>
<!--Main Navigation-->

<!--Footer-->
<%@include file="../../partials/footer.jsp" %>
<!--Footer-->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"
></script>
<!-- Custom scripts -->
<script type="text/javascript" src="../assets/js/script.js"></script>
</body>
</html>
