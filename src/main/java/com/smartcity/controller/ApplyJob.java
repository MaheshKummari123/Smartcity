package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.model.JobApplication;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/applyJob")
public class ApplyJob extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		String strId=req.getParameter("id");
		User user=(User)session.getAttribute("user");
		if(user==null || strId==null) {
			System.out.println("user or id is null in applyJob doGet");
			resp.sendRedirect("login.jsp");
		}
		int jobId=Integer.parseInt(strId);
		int userId=user.getUserId();
		session.setAttribute("jobId", jobId);
		session.setAttribute("userId", userId);
		resp.sendRedirect("apply-job.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);

	    if (session == null) {
	        System.out.println("Session is null in doPost");
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        System.out.println("User is null in doPost");
	        resp.sendRedirect("login.jsp");
	        return;
	    }
	    Integer jobId=(Integer)session.getAttribute("jobId");
	    
	    if(jobId==null) {
	    	System.out.println("jobis is null in doPost");
	    }
	    
	    int userId=user.getUserId();
		String fullName=req.getParameter("full_name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String resumeLink=req.getParameter("resume_link");
		
		JobApplication job=new JobApplication();
		JobApplicationDAO dao=new JobApplicationDAO();
		job.setJobId(jobId);
		job.setUserId(userId);
		job.setFullName(fullName);
		job.setEmail(email);
		job.setPhone(phone);
		job.setResumeLink(resumeLink);
		job.setAppliedAt(new Timestamp(System.currentTimeMillis()));
		
		try {
			dao.applyJob(job);
			if(user.getUserType().equals("student")) {
				resp.sendRedirect("student-dashboard.jsp");
			}
			else if(user.getUserType().equals("job_seeker")) {
				resp.sendRedirect("jobseeker-dashboard.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
