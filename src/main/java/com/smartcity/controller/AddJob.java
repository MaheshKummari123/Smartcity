package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.smartcity.dao.JobDAO;
import com.smartcity.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addJob")
public class AddJob extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		Job job= new Job();
		JobDAO jobDao=new JobDAO();
		
	    job.setCompanyName(request.getParameter("companyName"));
	    job.setJobTitle(request.getParameter("jobTitle"));
	    job.setDescription(request.getParameter("jobDesc"));
	    job.setRequirements(request.getParameter("requirements"));
	    job.setSalaryRange(request.getParameter("salary"));
	    job.setJobType(request.getParameter("jobType"));
	    job.setLocation(request.getParameter("location"));
	    job.setContactEmail(request.getParameter("email"));
	    String postedByStr=request.getParameter("postedBy");
	    if(postedByStr==null||postedByStr.trim().isEmpty()) {
	    	throw new IllegalArgumentException("Job ID is required");
	    }
	    job.setPostedBy(Integer.parseInt(postedByStr));
	    job.setStatus(request.getParameter("status"));
	    job.setPostedAt(new Timestamp(System.currentTimeMillis()));
		try {
			jobDao.addJob(job);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("admin-dashboard.jsp");
	}
	
}
