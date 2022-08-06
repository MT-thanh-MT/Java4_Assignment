package edu.poly.app.servlet.site;

import edu.poly.app.common.CookieUtils;
import edu.poly.app.model.LoginUser;
import edu.poly.app.model.Users;
import edu.poly.app.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/account/sign-up", "/account/sign-in",
        "/account/sign-out", "/account/forgot-password",
        "/account/change-password", "/account/edit-profile"})
public class AccountServlet extends HttpServlet {
    private final UserService us = new UserService();
    private final UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")) {
            signInGet(request, response);
        } else if (uri.contains("sign-up")) {
            request.getRequestDispatcher("/views/site/account/register.jsp").forward(request, response);
        } else if (uri.contains("sign-out")) {
            request.getSession().removeAttribute("username");
            request.getSession().removeAttribute("isAdmin");
            response.sendRedirect(request.getContextPath() + "/HomePageServlet");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")) {
            signInPost(request, response);
        } else if (uri.contains("sign-up")) {
            createUser(request);
            request.getRequestDispatcher("/views/site/account/register.jsp").forward(request, response);
        }
    }
    private void signInGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = CookieUtils.get("username", request);
        Users users = userService.findByID(username);
        if (username != null && !username.equals("")) {
            request.setAttribute("massage","Login successfuly!!!");
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("isAdmin", users.isAdmin());
            response.sendRedirect(request.getContextPath() + "/Admin/AdminDashboardServlet");
            return;
        } else {
            request.getRequestDispatcher("/views/site/account/login.jsp").forward(request, response);
        }
    }
    private void signInPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            LoginUser loginUser = new LoginUser();
            BeanUtils.populate(loginUser, request.getParameterMap());
            Users users = userService.findByID(loginUser.getId());

            if(!users.getPassword().equals(loginUser.getPassword())) {
                request.setAttribute("message", "Invalid password");
                request.getRequestDispatcher("/views/site/account/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("username", loginUser.getId());
                session.setAttribute("isAdmin", users.isAdmin());
                if (loginUser.isRemember()) {
                    CookieUtils.add("username", loginUser.getId(),2, response);
                } else {
                    CookieUtils.add("username", loginUser.getId(),0, response);
                }
                if (users.isAdmin()) {
                    response.sendRedirect(request.getContextPath() + "/Admin/AdminDashboardServlet");
                } else {
                    response.sendRedirect(request.getContextPath() + "/HomePageServlet");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid username or password");
            request.getRequestDispatcher("/views/site/account/login.jsp").forward(request, response);
        }
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
}