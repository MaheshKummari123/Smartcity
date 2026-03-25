package com.smartcity.controller;

import java.io.IOException;

import com.smartcity.dao.JobDAO;
import com.smartcity.model.Job;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateJob")
public class UpdateJob extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JobDAO dao=new JobDAO();
		HttpSession session=req.getSession(false);
		if(session==null || session.getAttribute("user")==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		User admin=(User)session.getAttribute("user");
		if(admin==null || !"admin".equals(admin.getUserType())) {
			resp.sendRedirect("unauthorized.jsp");
			return;
		}
		int jobId=Integer.parseInt(req.getParameter("jobId"));
		Job job=dao.getJobById(jobId);
		
		session.setAttribute("jobById", job);
		req.getRequestDispatcher("update-job.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JobDAO dao=new JobDAO();
		Job job=new Job();
		
		
		String strJobId=req.getParameter("job_id");
		if(strJobId==null) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int jobId=Integer.parseInt(strJobId);
		job.setCompanyName(req.getParameter("company_name"));
		job.setJobTitle(req.getParameter("job_title"));
		job.setDescription(req.getParameter("description"));
		job.setRequirements(req.getParameter("requirements"));
		job.setSalaryRange(req.getParameter("salary_range"));
		job.setJobType(req.getParameter("job_type"));
		job.setLocation(req.getParameter("location"));
		job.setContactEmail(req.getParameter("contact_email"));
		job.setStatus(req.getParameter("status"));
		
		dao.updateJob(jobId, job);
		
		resp.sendRedirect("admin-dashboard");
		
	}
	
	
}
