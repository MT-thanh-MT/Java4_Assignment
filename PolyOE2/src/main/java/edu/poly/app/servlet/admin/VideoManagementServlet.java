package edu.poly.app.servlet.admin;

import edu.poly.app.model.Videos;
import edu.poly.app.service.VideoService;
import edu.poly.app.util.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@WebServlet({"/Admin/video/index", "/Admin/video/edit/*", "/Admin/video/create", "/Admin/video/update", "/Admin/video/delete", "/Admin/video/reset"})
@MultipartConfig
public class VideoManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final VideoService VS = new VideoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("edit")) {
            editVideo(request);
        }
        if (uri.contains("delete")) {
            deleteVideo(request);
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/videoEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("create")) {
            createVideo(request);
        }
        if (uri.contains("update")) {
            updateVideo(request);
        }
        if (uri.contains("delete")) {
            deleteVideo(request);
        }
            findAll(request, response);
        request.getRequestDispatcher("/views/admin/videoEdit.jsp").forward(request, response);
    }
    private void createVideo(HttpServletRequest request) {
        Videos video = new Videos();
        try {
            BeanUtils.populate(video, request.getParameterMap());

            video.setPoster("uploads/" + UploadUtils.processUploadField("poster", request, "/uploads", null));

            VS.create(video);
            video.setPoster("/" + video.getPoster());
            request.setAttribute("video", video);
            request.setAttribute("messenger", "Create successful");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }

    }

    private void updateVideo(HttpServletRequest request) {
        Videos video = new Videos();
        try {
            BeanUtils.populate(video, request.getParameterMap());

            Videos oldVideo = VS.findByID(video.getId());

            if (request.getPart("poster").getSize() == 0) {
                video.setPoster(oldVideo.getPoster());
            } else {
                video.setPoster("uploads/" + UploadUtils.processUploadField("poster", request, "/uploads", null));
            }
            if (VS.findByID(video.getId()) == null) {
                request.setAttribute("error", "Error: Video Id not exists!");
            } else {
                VS.update(video);
                request.setAttribute("messenger", "Update successfully!");
            }
            video.setPoster("/" + video.getPoster());
            request.setAttribute("video", video);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void deleteVideo(HttpServletRequest request) {
        Videos video = new Videos();
        try {
            String id = request.getParameter("id");
            video = VS.findByID(id);

            if (video == null) {
                request.setAttribute("error", "Error: Video Id not exists!");
            } else {
                VS.delete(video);
                request.setAttribute("messenger", "Delete successfully!");
            }
            video.setPoster("/" + video.getPoster());
            request.setAttribute("video", video);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Videos> listVideo = VS.findAll();
            request.setAttribute("listVideo", listVideo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void editVideo(HttpServletRequest request) {
        String uploadFolder = request.getServletContext().getRealPath("/uploads");
        Path uploadPath = Paths.get(uploadFolder);
        String id = request.getRequestURI();
        Videos video = VS.findByID(id.substring(id.lastIndexOf("/") + 1));
        video.setPoster("/" + video.getPoster());
        request.setAttribute("video", video);
    }

}
