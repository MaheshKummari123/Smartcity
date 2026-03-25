package com.smartcity.controller;

import java.io.IOException;

import com.smartcity.dao.UserDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet{
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		UserDAO dao=new UserDAO();
		if(session==null || session.getAttribute("user")==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		User admin=(User)session.getAttribute("user");
		if(!"admin".equals(admin.getUserType())) {
			resp.sendRedirect("unauthorized.jsp");
			return;
		}
		int editUser=Integer.parseInt(req.getParameter("user_id"));
		User user=dao.getUserById(editUser);
		req.setAttribute("userById", user);
		
		req.getRequestDispatcher("update-user.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User user=new User();
		UserDAO dao=new UserDAO();
		
		String idParam = req.getParameter("user_id");
		if (idParam == null) {
		    resp.sendRedirect("admin-dashboard");
		    return;
		}
		int userId = Integer.parseInt(idParam);
		
		
		
		user.setUsername(req.getParameter("username"));
		String password = req.getParameter("password");
        if (password != null && !password.trim().isEmpty()) {
            user.setPassword(password);
        }
		user.setEmail(req.getParameter("email"));
		user.setUserType(req.getParameter("user_type"));
		user.setFullName(req.getParameter("full_name"));
		user.setPhone(req.getParameter("phone"));
		
		dao.update(userId, user);
		
		resp.sendRedirect("admin-dashboard");
	}
	
	
}
