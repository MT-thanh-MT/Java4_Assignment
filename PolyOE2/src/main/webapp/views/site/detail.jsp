<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 2/08/2022
  Time: 11:04
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
    <title>${video.title}</title>
    <!-- Icons -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>
    <!-- Custom styles -->
    <link rel="stylesheet" href="../../../assets/css/style.css" />
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
<%@include file="../partials/header.jsp" %>
<!--Main Navigation-->
<div class="row">
        <div class="col-sm-8 mb-3 mt-3">
            <div class="card">
                <div class="card-header fs-3">
                        ${video.title}
                </div>
                <div class="card-body">
                    <iframe src="https://www.youtube.com/embed/${video.id}" style="width: 100%; height: 80vh">
                    </iframe>
                </div>
                <div class="card-footer text-center">
                    <div class="float-start">Views: ${video.views}</div>
                    <a href="<c:url value="/LikeVideoServlet/detail?id=${video.id}"/> " class="btn btn-primary"><i class='bx bxs-like'></i></a>
                    <a href="<c:url value="/ShareVideoServlet/detail?videoId=${video.id}"/>" class="btn btn-info"><i class='bx bxs-share-alt'></i></a>
                </div>
            </div>
            <div class="container">
                ${video.description}
            </div>
        </div>
    <div class="col-sm-4 mb-3 mt-3">
        <c:forEach var="video" items="${listVideo}" >
            <div class="row mb-3">
                <div class="card">
                    <div class="card-header">
                            ${video.title}
                    </div>
                    <div class="card-body">
                        <a href="<c:url value="/HomePageServlet/Detail?id=${ video.id }" />">
                            <img src="<c:url value="/${video.poster}" />" alt="" width="100%" height="240px">
                        </a>
                    </div>
                    <div class="card-footer">
                        Views: ${video.views}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
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