package edu.poly.app.filter;

import edu.poly.app.model.Users;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter({"/Admin/*", "/Admin/video/index"})
public class AuthFilter implements HttpFilter {

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String uri = request.getRequestURI();
        Users user = (Users) request.getSession().getAttribute("userLogin");
        String error = "";
        if (user == null) {
            error = response.encodeURL("Pleas sign in now!");
        } else if (!user.isAdmin() && uri.contains("/Admin/")) {
            error = response.encodeURL("Pleas sign in with Admin!");
        }
        if (!error.isEmpty()) {
            request.getSession().setAttribute("securi", uri);
            response.sendRedirect(request.getContextPath()+"/account/sign-in?error="+response.encodeURL(error));
        } else {
            chain.doFilter(request, response);
        }
    }
}
