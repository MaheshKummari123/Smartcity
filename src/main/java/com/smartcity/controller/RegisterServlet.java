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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	UserDAO userDao=new UserDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String userType=req.getParameter("userType");
		String fullName=req.getParameter("fullName");
		String phone=req.getParameter("phone");
		
		
		
		User user=new User(username,password,email,userType,fullName,new Timestamp(System.currentTimeMillis()));
		
		
		user.setPhone(phone);
		if(userDao.register(user)) {
			req.setAttribute("success", "Registration successful! Please login.");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			resp.getWriter().println("REGISTER SERVLET WORKING");
		}
		else {
			req.setAttribute("error", "Registration failed. Username or email may already exist.");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
	}
	
	
	
}
