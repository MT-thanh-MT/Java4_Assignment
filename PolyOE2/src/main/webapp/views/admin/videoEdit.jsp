<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 25/07/2022
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet"/>

    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <!-- Custom styles -->
    <style>
        <%@include file="/assets/css/style.css" %>
        .row {
            margin: 0;
        }
    </style>

    <title>Users Manager</title>
</head>
<body>
<!-- Navbar -->
<%@include file="../../views/partials/sidenav.jsp" %>
<!-- Navbar -->
<div class="home_content">
    <div class="container">
        <div class="row mb-4 mt-4">
            <div class="col-sm-4">
                <form action="Admin/video" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="id" class="form-label">Youtube ID</label>
                        <input type="text" name="id" class="form-control" id="id" value="${video.id}" required>
                    </div>
                    <div class="mb-3">
                        <label for="Title" class="form-label">Video Title</label>
                        <input type="text" name="title" class="form-control" id="Title" value="${video.title}" required>
                    </div>
                    <div class="mb-3">
                        <label for="View" class="form-label">View Count</label>
                        <input type="number" name="views" class="form-control" id="View" value="${video.views}"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea name="description" class="form-control" id="description" rows="4"
                                  cols="50">${video.description}</textarea>
                    </div>
                    <div class="mb-3 form-check">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="active" id="active"
                                   value="true" ${video.active ? 'checked':''}>
                            <label class="form-check-label" for="active">Active</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="active" id="inactive"
                                   value="false" ${video.active ? '':'checked'}>
                            <label class="form-check-label" for="inactive">Inactive</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Poster</label>
                        <img class="form-control" id="output" src="<c:url value="${video.poster}" />"/>
                        <input class="form-control" name="poster" value="${video.poster}" type="file" accept="image/*"
                               onchange="loadFile(event)" placeholder="choose poster">
                    </div>
                    <div class="row m-0">
                        <div class="col-sm-12 p-0">
                            <c:if test="${not empty messenger}">
                                <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                         class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16"
                                         role="img" aria-label="Warning:">
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                    </svg>
                                    <div>
                                            ${ messenger }
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                                         class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16"
                                         role="img" aria-label="Warning:">
                                        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                    </svg>
                                    <div>
                                            ${ error }
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" formaction="create">Create</button>
                    <button type="submit" class="btn btn-warning" formaction="update">Update</button>
                    <button type="submit" class="btn btn-danger" formaction="delete">Delete</button>
                    <button type="submit" class="btn btn-info" formaction="index">Reset</button>
                </form>
            </div>
            <div class="col-sm-8">
                <table class="table table-bordered border-dark">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">Youtube Id</th>
                        <th scope="col">Video title</th>
                        <th scope="col">View count</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="video" items="${listVideo}">
                        <tr>
                            <th>${ video.id }</th>
                            <td>${ video.title }</td>
                            <td>${ video.views }</td>
                            <td>${ video.active ? 'Active':'Inactive' }</td>
                            <td>
                                <a href="<c:url value="/Admin/video/edit/${ video.id }" />">Edit</a>
                                <a href="<c:url value="/Admin/video/delete?id=${ video.id }" />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-center">

                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <%@include file="../partials/footer.jsp" %>
</div>

<!-- MDB -->
<%--<script type="text/javascript" src="../assets/js/mdb.min.js"></script>--%>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"
></script>
<!-- Custom scripts -->
<script>
    <%@include file="/assets/js/sidenavJS.js" %>
</script>
<script>
    var loadFile = function (event) {
        var reader = new FileReader();
        reader.onload = function () {
            var output = document.getElementById('output');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    };
</script>
</body>
</html>