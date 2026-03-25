package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.UserDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class Profile extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		//UserDAO userDao=new UserDAO();
		//User user=(User)session.getAttribute("user");
		//int id=user.getUserId();
		
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		String role=req.getParameter("role");
		session.setAttribute("role", role);
		//session.setAttribute("user", userDao.update(id, user));
		resp.sendRedirect("profile.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		UserDAO dao=new UserDAO();
		User user=new User();
		String strId=req.getParameter("id");
		if(strId==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		int id=Integer.parseInt(strId);
		String fullname=req.getParameter("fullname");
		String username=req.getParameter("username");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		user.setUsername(username);
		user.setEmail(email);
		user.setFullName(fullname);
		user.setPhone(phone);
		user.setPassword(password);
		
		
		try {
			dao.updateProfile(id, user);
			User updatedUser=dao.getUserById(id);
			session.setAttribute("user", updatedUser);
			resp.sendRedirect("profile");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	
	
}
