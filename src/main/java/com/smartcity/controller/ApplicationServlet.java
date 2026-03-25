package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.JobApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/application")
public class ApplicationServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		JobApplicationDAO dao=new JobApplicationDAO();
		try {
			session.setAttribute("allApplications", dao.getAllApplicationWithJob());
			resp.sendRedirect("admin-applications.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String status=req.getParameter("status");
		String strId=req.getParameter("applicationId");
		
		if(session==null||strId==null) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int id=Integer.parseInt(strId);
		JobApplicationDAO dao=new JobApplicationDAO();
		try {
			dao.updateStatus(id, status);
			resp.sendRedirect("application");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
