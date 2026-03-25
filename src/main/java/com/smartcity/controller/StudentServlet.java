package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.InstitutionDAO;
import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.dao.JobDAO;
import com.smartcity.dao.TouristDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/studentDashboard")
public class StudentServlet extends HttpServlet{

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		JobDAO jobDao=new JobDAO();
		
		TouristDAO tourDao=new TouristDAO();
		InstitutionDAO instiDao=new InstitutionDAO();
		JobApplicationDAO jobAppliDao=new JobApplicationDAO();
		User user=(User)session.getAttribute("user");
		int userId=user.getUserId();
		
		try {
			session.setAttribute("applicationsByUserId", jobAppliDao.getAllApplicationByUserId(userId));
			session.setAttribute("Pg's", tourDao.getPgOrHostels());
			session.setAttribute("internshipList", jobDao.getInternship());
			session.setAttribute("instiList", instiDao.getByTrainingInstitutions());
			session.setAttribute("collegeList", instiDao.getByCollegeAndSchool());
			session.setAttribute("jobsList", jobDao.getAllJobs());
			session.setAttribute("allList", instiDao.getAllInstitutions());
			
			req.getRequestDispatcher("student-dashboard.jsp").forward(req, resp);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
HttpSession session=req.getSession(false);
		
		if(session==null) {
			resp.sendRedirect("login");
			return;
		}
	}
	
}
