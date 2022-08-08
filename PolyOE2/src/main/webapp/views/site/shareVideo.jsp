<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 25/07/2022
  Time: 22:14
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
  <title>Share video</title>
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
<c:if test="${not empty massage}">
  <script>
    swal({
      title: "Oh MY GOD!",
      text: "${massage}",
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
  <%@include file="../partials/navbar.jsp" %>
  <!-- Navbar -->

  <!-- Background image -->
  <div id="intro" class="bg-image shadow-2-strong">
    <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-5 col-md-8">
            <form class="bg-white rounded shadow-5-strong p-5" action="<c:url value="ShareVideoServlet"/>" method="post">
              <!-- Receiver Email input -->
              <div class="form-outline mb-4">
                <input type="text" class="form-control" name="toEmail" id="receiverEmail" />
                <label class="form-label" for="receiverEmail">TO</label>
              </div>
              <!-- Your app pass -->
              <div class="form-outline mb-4">
                <input type="password" class="form-control" name="appPass" id="appPass" />
                <label class="form-label" for="appPass">Your App Password</label>
              </div>
              <!-- Submit button -->
              <button type="submit" class="btn btn-primary btn-block mb-4" formaction="${comeBackPage}">Share Now</button>
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
<%@include file="../partials/footer.jsp" %>
<!--Footer-->
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"
></script>
<!-- Custom scripts -->
<script type="text/javascript" src="../../../../assets/js/script.js"></script>
</body>
</html>