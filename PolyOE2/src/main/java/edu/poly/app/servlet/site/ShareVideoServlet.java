package edu.poly.app.servlet.site;

import edu.poly.app.domain.Email;
import edu.poly.app.model.Share;
import edu.poly.app.model.Users;
import edu.poly.app.model.Videos;
import edu.poly.app.service.ShareService;
import edu.poly.app.service.VideoService;
import edu.poly.app.util.SendEmailUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet({"/ShareVideoServlet","/ShareVideoServlet/home", "/ShareVideoServlet/detail", "/ShareVideoServlet/favorite"})
public class ShareVideoServlet extends HttpServlet {
    private final VideoService videoSV = new VideoService();
    private final ShareService shareSV = new ShareService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String videoId = request.getParameter("videoId");
        if (uri.contains("home")) {
            request.setAttribute("comeBackPage", "home?videoId="+videoId);
        } else if (uri.contains("detail")) {
            request.setAttribute("comeBackPage", "detail?videoId="+videoId);
        } else if (uri.contains("favorite")) {
            request.setAttribute("comeBackPage", "favorite?videoId="+videoId);
        }
        request.getRequestDispatcher("/views/site/shareVideo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String videoId = request.getParameter("videoId");
        String yourAppPass = request.getParameter("appPass");
        String toEmail = request.getParameter("toEmail");
        try {
            String comeBackPage = "";
            if (uri.contains("home")) {
                comeBackPage = "/HomePageServlet";
            } else if (uri.contains("detail")) {
                comeBackPage = "/HomePageServlet/Detail?id="+videoId;
            } else if (uri.contains("favorite")) {
                comeBackPage = "/FavoriteServlet";
            }
            Email email = new Email();
            Users user = (Users) request.getSession().getAttribute("userLogin");
            Videos video = videoSV.findByID(videoId);
            email.setFrom(user.getEmail());
            email.setFromPassword(yourAppPass);
            email.setTo(toEmail);
            email.setSubject(video.getTitle());
            email.setContent("https://www.youtube.com/embed/"+videoId);
            SendEmailUtil.sendEmail(email);
            Share share = new Share();
            share.setVideo(video);
            share.setUser(user);
            share.setEmails(user.getEmail());
            share.setShareDate(new Date());
            shareSV.create(share);
            request.setAttribute("massage", "Send link video successful!");
            response.sendRedirect(request.getContextPath() + comeBackPage);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            response.sendRedirect(uri+"?videoId="+videoId);
        }
    }
}
