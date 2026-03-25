package com.smartcity.controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.smartcity.dao.UserDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addUser")
public class AddUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user=new User();
		UserDAO dao=new UserDAO();
		
		
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setEmail(req.getParameter("email"));
		user.setUserType(req.getParameter("userType"));
		user.setFullName(req.getParameter("fullName"));
		user.setPhone(req.getParameter("phone"));
		user.setCreatedAt(new Timestamp(System.currentTimeMillis()));

		if(dao.register(user)) {
			req.getSession().setAttribute("success", "User Added Successfully");
			resp.sendRedirect("admin-dashboard");
			return;
		}
		else {
			req.setAttribute("error", "User not added, Please try Agin!!");
			req.getRequestDispatcher("add-user.jsp").forward(req, resp);
		}
		
	}
	
	
	
}
