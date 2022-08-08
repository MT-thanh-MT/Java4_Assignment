package edu.poly.app.servlet.admin;

import edu.poly.app.domain.FavoriteReport;
import edu.poly.app.domain.FavoriteUserReport;
import edu.poly.app.model.Favorite;
import edu.poly.app.model.Videos;
import edu.poly.app.service.FavoriteService;
import edu.poly.app.service.VideoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/Admin/ReportsManagementServlet", "/Admin/ReportUserByVideo"})
public class ReportsManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        reportFavoriteByVideo(request, response);
        reportFavoriteUserByVideo(request, response);
        String uri = request.getRequestURI();
        if (uri.contains("ReportUserByVideo")) {
            request.setAttribute("selectedTab", 2);
        } else {
            request.setAttribute("selectedTab", 1);
        }
        request.getRequestDispatcher("/views/admin/repots.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void reportFavoriteByVideo(HttpServletRequest request, HttpServletResponse response) {
        try {
            FavoriteService favService = new FavoriteService();
            List<FavoriteReport> list = favService.getFavoritesByVideo();

            request.setAttribute("favList", list);
        } catch (Exception e){
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
    private void reportFavoriteUserByVideo(HttpServletRequest request, HttpServletResponse response) {
        try {
            String videoID = request.getParameter("videoID");
            VideoService videoService = new VideoService();
            List<Videos> listVideo = videoService.findAll();
            if (videoID == null && listVideo.size()>0) {
                videoID = listVideo.get(0).getId();
            }

            FavoriteService favService = new FavoriteService();
            List<FavoriteUserReport> list = favService.getFavoritesUserByVideo(videoID);
            request.setAttribute("videoID", videoID);
            request.setAttribute("listVideo", listVideo);
            request.setAttribute("favUserList", list);
        } catch (Exception e){
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

}
