package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.JobDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/jobseeker")
public class JobSeeker extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JobDAO jobDao=new JobDAO();
		
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		if(session==null ||user==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		try {
			session.setAttribute("fresherJobs", jobDao.getFresherJobs());
			session.setAttribute("expiJobs", jobDao.getExperiencedJobs());
			session.setAttribute("internship", jobDao.getInternship());
			session.setAttribute("allJobs", jobDao.getAllJobs());
			resp.sendRedirect("jobseeker-dashboard.jsp");
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
