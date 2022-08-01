package edu.poly.app.servlet;

import edu.poly.app.model.Users;
import edu.poly.app.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/user/index", "/user/edit/*", "/user/create", "/user/update", "/user/delete", "/user/reset"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService us = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("edit")) {
            editUser(request);
        }
        findAll(request, response);
        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("create")) {
            createUser(request);
        } else if (uri.contains("update")) {
            updateUser(request);
        } else if (uri.contains("delete")) {
            deleteUser(request);
        }
        findAll(request, response);
        request.getRequestDispatcher("/views/user.jsp").forward(request, response);
    }
    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Users> listUser = us.findAll();
            request.setAttribute("listUser", listUser);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void editUser(HttpServletRequest request) {
        String id = request.getRequestURI();
        Users user = us.findByID(id.substring(id.lastIndexOf("/") + 1));
        request.setAttribute("user", user);
    }
    private void createUser(HttpServletRequest request) {
        try {
            Users user = new Users();
            BeanUtils.populate(user, request.getParameterMap());
            if (us.findByID(user.getId()) != null) {
                request.setAttribute("error", "Error: Username already exists!");
            } else {
                us.create(user);
                request.setAttribute("messenger", "Create successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void updateUser(HttpServletRequest request) {
        try {
            Users user = new Users();
            BeanUtils.populate(user, request.getParameterMap());
            if (us.findByID(user.getId()) == null) {
                request.setAttribute("error", "Error: Username not exists!");
            } else {
                us.update(user);
                request.setAttribute("messenger", "Update successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
    private void deleteUser(HttpServletRequest request) {
        try {
            Users user = new Users();
            BeanUtils.populate(user, request.getParameterMap());
            if (us.findByID(user.getId()) == null) {
                request.setAttribute("error", "Error: Username not exists!");
            } else {
                us.delete(user);
                request.setAttribute("messenger", "Delete successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
