<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 5/08/2022
  Time: 09:20
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
            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a
                            class="nav-link ${selectedTab == 1 ? 'active':''}"
                            id="ex1-tab-1"
                            data-mdb-toggle="tab"
                            href="#ex1-tabs-1"
                            role="tab"
                            aria-controls="ex1-tabs-1"
                            aria-selected="${selectedTab == 1 ? 'true':'false'}"
                    >Favorites</a
                    >
                </li>
                <li class="nav-item" role="presentation">
                    <a
                            class="nav-link ${selectedTab == 2 ? 'active':''}"
                            id="ex1-tab-2"
                            data-mdb-toggle="tab"
                            href="#ex1-tabs-2"
                            role="tab"
                            aria-controls="ex1-tabs-2"
                            aria-selected="${selectedTab == 2 ? 'true':'false'}"
                    >Favorite User</a
                    >
                </li>
                <li class="nav-item" role="presentation">
                    <a
                            class="nav-link ${selectedTab == 3 ? 'active':''}"
                            id="ex1-tab-3"
                            data-mdb-toggle="tab"
                            href="#ex1-tabs-3"
                            role="tab"
                            aria-controls="ex1-tabs-3"
                            aria-selected="${selectedTab == 3 ? 'true':'false'}"
                    >Shared Friends</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content" id="ex1-content">
                <div
                        class="tab-pane fade ${selectedTab == 1 ? 'show active':''}"
                        id="ex1-tabs-1"
                        role="tabpanel"
                        aria-labelledby="ex1-tab-1"
                >
                    <div class="col-sm-12">
                        <table class="table table-bordered border-dark">
                            <thead class="table-dark">
                            <tr>
                                <th scope="col">Video Title</th>
                                <th scope="col">Favorites Count</th>
                                <th scope="col">Lasted Date</th>
                                <th scope="col">Oldest Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${favList}">
                                <tr>
                                    <th>${ item.videoTitle }</th>
                                    <td>${ item.favoriteCount }</td>
                                    <td>${ item.newestDate }</td>
                                    <td>${ item.oldestDate }</td>
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
                <div class="tab-pane fade ${selectedTab == 2 ? 'show active':''}" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                    <div class="col-sm-12">
                        <div>
                            <form action="Admin/ReportsManagementServlet" method="get">
                                <div class="row mt3">
                                    <div class="col">
                                        <div class="form-check">

                                            <label class="form-label" for="videoID">
                                                Video Title</label>
                                            <div class="form-check form-check-inline">
                                                <select name="videoID" id="videoID"
                                                        class="browser-default custom-select ml-3">
                                                    <c:forEach var="item" items="${listVideo}">
                                                        <option value="${item.id}" ${item.id == videoID ? 'selected':''}>
                                                                ${item.title}
                                                        </option>
                                                    </c:forEach>
                                                </select>

                                                <button type="submit" class="btn btn-info ml-2" formaction="ReportUserByVideo">Report</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table class="table table-bordered border-dark">
                            <thead class="table-dark">
                            <tr>
                                <th scope="col">Username</th>
                                <th scope="col">Fullname</th>
                                <th scope="col">Email</th>
                                <th scope="col">Favorite Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${favUserList}">
                                <tr>
                                    <th>${ item.userID }</th>
                                    <td>${ item.fullname }</td>
                                    <td>${ item.email }</td>
                                    <td>${ item.likeDate }</td>
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
                <div class="tab-pane fade ${selectedTab == 3 ? 'show active':''}" id="ex1-tabs-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                    Tab 3 content
                </div>
            </div>
            <!-- Tabs content -->

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
</body>
</html>

