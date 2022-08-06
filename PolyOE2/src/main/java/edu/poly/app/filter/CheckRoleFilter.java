package edu.poly.app.filter;

import edu.poly.app.model.Users;
import edu.poly.app.service.UserService;
import edu.poly.app.servlet.admin.UserManagementServlet;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/index")
public class CheckRoleFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("hihi");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        UserService us = new UserService();
        Users user = us.findByID((String) session.getAttribute("username"));
        System.out.println(session.getAttribute("username"));
        if (user.isAdmin()) {
//            req.getRequestDispatcher("/views/admin/user.jsp").forward(req,resp);
            chain.doFilter(request, response);
        } else {
            req.getRequestDispatcher("/views/site/home.jsp").forward(req,resp);
        }

    }
}
