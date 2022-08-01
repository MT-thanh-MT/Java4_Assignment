package edu.poly.app.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.app.common.CookieUtils;
import edu.poly.app.model.Users;
import org.apache.commons.beanutils.BeanUtils;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class UserServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = CookieUtils.get("username", request);
		
		if (username != null && !username.equals("")) {
			request.setAttribute("massage", "Login successfuly!!!");
			
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			request.getRequestDispatcher("/ui/user.jsp").forward(request, response);
			return;
		} else {
		request.getRequestDispatcher("/ui/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Users user = new Users();
			
			BeanUtils.populate(user, request.getParameterMap());
			boolean isRemember = Boolean.parseBoolean(request.getParameter("remember"));
			if (user.getId().equals("admin") && user.getPassword().equals("admin")) {
				HttpSession session = request.getSession();
				session.setAttribute("username", user.getId());

				if (isRemember) {
					CookieUtils.add("username" , user.getId(), 2, response);
				}else {
					CookieUtils.add("username" , user.getId(), 0, response);
				}
				request.getRequestDispatcher("/ui/user.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "Inalid username or password");
				request.getRequestDispatcher("/ui/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
