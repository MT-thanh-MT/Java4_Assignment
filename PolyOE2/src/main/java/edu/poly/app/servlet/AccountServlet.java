package edu.poly.app.servlet;

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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")) {
            signInGet(request, response);
        } else if (uri.contains("sign-up")) {
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sign-in")) {
            signInPost(request, response);
        } else if (uri.contains("sign-up")) {
            createUser(request);
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        }
    }
    private void signInGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = CookieUtils.get("username", request);
        if (username != null && !username.equals("")) {
            request.setAttribute("massage",
                    "Login successfuly!!!");
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect(request.getContextPath() + "/user/index");
            return;
        } else {
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
    private void signInPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            LoginUser loginUser = new LoginUser();
            BeanUtils.populate(loginUser, request.getParameterMap());
            UserService userService = new UserService();
            Users users = userService.findByID(loginUser.getId());

            if(!users.getPassword().equals(loginUser.getPassword())) {
                request.setAttribute("message", "Invalid password");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("username", loginUser.getId());
                if (loginUser.isRemember()) {
                    CookieUtils.add("username", loginUser.getId(),
                            2, response);
                } else {
                    CookieUtils.add("username", loginUser.getId(),
                            0, response);
                }
                response.sendRedirect(request.getContextPath() +
                        "/user/index");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid username or password");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
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
