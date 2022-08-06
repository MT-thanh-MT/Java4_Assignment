<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 1/08/2022
  Time: 15:23
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
    <title>Dashboard</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>

    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'/>
    <!-- Custom styles -->
    <style>
        <%@include file="/assets/css/style.css" %>
        .row {
            margin: 0;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<%@include file="../../views/partials/sidenav.jsp" %>
<!-- Navbar -->

<div class="home_content">
    <div class="">
        <!--Main-->
        <%@include file="dashboardContent.jsp" %>
        <!--Main-->


    </div>
    <!--Footer-->
    <%@include file="../../views/partials/footer.jsp" %>
    <!--Footer-->
</div>


<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"></script>
<!-- Custom scripts -->
<script>
    <%@include file="/assets/js/sidenavJS.js" %>
</script>
</body>
</html>
