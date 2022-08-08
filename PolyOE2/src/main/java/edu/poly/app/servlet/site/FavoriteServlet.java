package edu.poly.app.servlet.site;

import edu.poly.app.model.Favorite;
import edu.poly.app.model.Users;
import edu.poly.app.model.Videos;
import edu.poly.app.service.FavoriteService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/FavoriteServlet","/FavoriteServlet/unlike"})
public class FavoriteServlet extends HttpServlet {
    private final FavoriteService favSV = new FavoriteService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("unlike")) {
            try {
                Favorite favPram = new Favorite();
                String userId = request.getSession().getAttribute("username").toString();
                String videoId = request.getParameter("videoId");
                favPram.setUser(new Users(userId));
                favPram.setVideo(new Videos(videoId));
                Favorite fav = favSV.findFavoriteByUserIdAndVideoId(favPram);
                if (fav != null) {
                    favSV.delete(fav);
                    request.setAttribute("massage", "So sad :(!!!");
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error: " + e.getMessage());
            }
        }
        findFavoriteVideos(request, response);
        request.getRequestDispatcher("/views/site/Favorite.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void findFavoriteVideos(HttpServletRequest request, HttpServletResponse response) {
        try{
            String userId = request.getSession().getAttribute("username").toString();
            List<Videos> listVideo = favSV.getVideosByUser(userId);
            request.setAttribute("listFavVideo", listVideo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}