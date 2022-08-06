package edu.poly.app.servlet.site;

import edu.poly.app.model.Videos;
import edu.poly.app.service.VideoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/HomePageServlet", "/HomePageServlet/Detail"})
public class HomePageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final VideoService VS = new VideoService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("Detail")) {
            Videos video = new Videos();
            String id = request.getParameter("id");
            video = VS.findByID(id);
            video.setPoster("/" + video.getPoster());
            request.setAttribute("video", video);
            findAll(request,response);
            request.getRequestDispatcher("/views/site/detail.jsp").forward(request, response);
            return;
        }
        findAll(request,response);
        request.getRequestDispatcher("/views/site/home.jsp").forward(request, response);
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
