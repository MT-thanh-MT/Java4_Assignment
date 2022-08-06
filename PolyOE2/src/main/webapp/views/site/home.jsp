<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 1/08/2022
  Time: 16:56
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
    <!-- Custom styles -->
    <link rel="stylesheet" href="../../../assets/css/style.css" />
</head>
<body>
<!--Main Navigation-->
<%@include file="../partials/header.jsp" %>
<!--Main Navigation-->
<div class="row">
    <c:forEach var="video" items="${listVideo}" >
        <div class="col-sm-3 mb-3 mt-3">
            <div class="card">
                <div class="card-header">
                        ${video.title}
                </div>
                <div class="card-body">
                    <a href="<c:url value="/HomePageServlet/Detail?id=${ video.id }" />">
                        <img src="<c:url value="${video.poster}" />" alt="" width="100%" height="240px">
                    </a>
                </div>
                <div class="card-footer">
                    LIKE-SHARE
                </div>
            </div>
        </div>
    </c:forEach>
</div>
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
<script>
    document.getElementById("Home").style.background = "#000";
</script>
</body>
</html>
