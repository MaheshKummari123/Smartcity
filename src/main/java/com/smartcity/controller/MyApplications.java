package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myApplications")
public class MyApplications extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		if(session==null) {
			resp.sendError(0, "Session Expired!!!");
			resp.sendRedirect("jobseeker");
			return;
		}
		User user=(User)session.getAttribute("user");
		int id=user.getUserId();
		
		JobApplicationDAO dao=new JobApplicationDAO();
		try {
			session.setAttribute("applicationsByUserId", dao.getAllApplicationByUserId(id));
			resp.sendRedirect("my-applications.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
