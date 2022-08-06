<%@ page import="java.util.Timer" %>
<%@ page import="java.awt.event.ActionListener" %>
<%@ page import="java.awt.event.ActionEvent" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 27/07/2022
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>sign-in</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- Custom styles -->
    <link rel="stylesheet" href="../../../assets/css/style.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
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
    <%
        String messenger = (String) request.getAttribute("messenger");
        if (messenger != null){
            out.print("<script>\n" +
                    "        swal({\n" +
                    "            title: \"Good job!\",\n" +
                    "            text: \""+messenger+"\",\n" +
                    "            icon: \"success\",\n" +
                    "            button: \"OKE!\",\n" +
                    "            timer: 1500    " +
                    "        }).then(function() {\n" +
                    "        window.location.href = \"sign-in\";"+
                    "        });\n" +

                    "    </script>");
        }
    %>
    <!-- Background image -->
    <div id="intro" class="bg-image shadow-2-strong">
        <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-5 col-md-8">
                        <form class="bg-white rounded shadow-5-strong p-5" action="<c:url value="sign-up"/>" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="id" class="form-control" id="username"  required>
                            </div>
                            <div class="mb-3">
                                <label for="Pass" class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" id="Pass" required>
                            </div>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full name</label>
                                <input type="text" name="fullname" class="form-control" id="fullname" required>
                            </div>
                            <div class="mb-3">
                                <label for="Email" class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control" id="Email" aria-describedby="emailHelp" required>
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <c:if test="${not empty messenger}">
                                        <div class="alert alert-success d-flex align-items-center" role="alert">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                            </svg>
                                            <div>
                                                    ${ messenger }
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty error}">
                                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                            </svg>
                                            <div>
                                                    ${ error }
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block mb-4" >Sign-up</button>
                            <div class="text-center">
                                <p>Already have an account? <a href="<c:url value="/account/sign-in" />">Sign-in Now</a></p>
                            </div>
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

