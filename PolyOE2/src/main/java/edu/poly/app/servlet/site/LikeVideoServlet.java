package edu.poly.app.servlet.site;

import edu.poly.app.model.Favorite;
import edu.poly.app.model.Videos;
import edu.poly.app.service.FavoriteService;
import edu.poly.app.service.UserService;
import edu.poly.app.service.VideoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet({"/LikeVideoServlet/home", "/LikeVideoServlet/detail"})
public class LikeVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final VideoService VS = new VideoService();
    private final UserService US = new UserService();
    private final FavoriteService FS = new FavoriteService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String videoId = request.getParameter("id");
        String usernameID;
        try {
            usernameID  = request.getSession().getAttribute("username").toString();
        } catch (Exception e){
            usernameID = null;
            e.printStackTrace();
        }
        if (uri.contains("detail")) {
            Videos video = new Videos();
            video = VS.findByID(videoId);
            video.setPoster("/" + video.getPoster());
            request.setAttribute("video", video);
            if ( usernameID == null) {
                request.setAttribute("error", "You must login!!!");
                findAll(request,response);
                request.getRequestDispatcher("/views/site/detail.jsp").forward(request, response);
                return;
            }
            try {
                Favorite fav = new Favorite();
                fav.setVideo(VS.findByID(videoId));
                fav.setUser(US.findByID(usernameID));
                fav.setLikeDate(new Date());
                FS.create(fav);
                request.setAttribute("massage", "Thanks you for like it!!!");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "You are liked this video before ");
            }
            findAll(request,response);
            request.getRequestDispatcher("/views/site/detail.jsp").forward(request, response);
            return;
        }
        if (uri.contains("home")) {
            if ( usernameID == null) {
                request.setAttribute("error", "You must login!!!");
                findAll(request,response);
                request.getRequestDispatcher("/views/site/home.jsp").forward(request, response);
                return;
            }
           try {
               Favorite fav = new Favorite();
               fav.setVideo(VS.findByID(videoId));
               fav.setUser(US.findByID(usernameID));
               fav.setLikeDate(new Date());
               FS.create(fav);
               request.setAttribute("massage", "Thanks you for like it!!!");
           } catch (Exception e) {
               e.printStackTrace();
               request.setAttribute("error", "You are liked this video before ");
           }
            findAll(request,response);
            request.getRequestDispatcher("/views/site/home.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        try{
            List<Videos> listVideo = VS.findAll();
            request.setAttribute("listVideo", listVideo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
