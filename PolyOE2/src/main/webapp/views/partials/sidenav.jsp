<%--
  Created by IntelliJ IDEA.
  User: XUÂN THÀNH
  Date: 1/08/2022
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar myactive">
    <div class="logi_content">
        <div class="logo">
            <i class='bx bxs-lemon'></i>
            <div class="logo_name">ORANGE</div>
        </div>
        <i class='bx bx-menu' id="btn"></i>
    </div>
    <ul class="nav_list">
        <li>
            <a href="<c:url value="/HomePageServlet" />">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Home</span>
            </a>
            <span class="tooltip">Home</span>
        </li>
        <li>
            <a href="<c:url value="/Admin/AdminDashboardServlet" />">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Dashboard</span>
            </a>
            <span class="tooltip">Dashboard</span>
        </li>
        <li>
            <a href="<c:url value="/Admin/user/index" />">
                <i class='bx bx-user'></i>
                <span class="links_name">User Management</span>
            </a>
            <span class="tooltip">User Management</span>
        </li>
        <li>
            <a href="<c:url value="/Admin/video/index" />">
                <i class='bx bxs-video-plus'></i>
                <span class="links_name">Video Management</span>
            </a>
            <span class="tooltip">Video Management</span>
        </li>
        <li>
            <a href="">
                <i class='bx bxs-report'></i>
                <span class="links_name">Reports Management</span>
            </a>
            <span class="tooltip">Reports Management</span>
        </li>
    </ul>
    <div class="profile_content">
        <div class="profile">
            <div class="profile_details">
                <img src="<c:url value="/assets/images/me.jpg" />" alt="...">
                <div class="name_job">
                    <div class="name">Thani</div>
                    <div class="job">Admin</div>
                </div>
            </div>
            <a href="<c:url value="/account/sign-out"/>"><i class='bx bx-log-out-circle' id="log_out"></i></a>
        </div>
    </div>
</div>