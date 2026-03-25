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

@WebServlet("/updateApplication")
public class UpdateApplication extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String strId=req.getParameter("applicationId");
		String status=req.getParameter("status");
		if(strId==null || status==null) {
			session.setAttribute("error", "Id or status is null");
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int id=Integer.parseInt(strId);
		JobApplicationDAO dao=new JobApplicationDAO();
		
		try {
			dao.updateStatus(id, status);
			session.setAttribute("success", "Application status updated successfully!");
			resp.sendRedirect("admin-dashboard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
