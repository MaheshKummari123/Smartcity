package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.dao.EventDAO;
import com.smartcity.dao.InstitutionDAO;
import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.dao.JobDAO;
import com.smartcity.dao.UserDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin-dashboard")
public class AdminServlet extends HttpServlet{
	
	UserDAO userDao=new UserDAO();
	InstitutionDAO instiDao=new InstitutionDAO();
	BusinessDAO busiDao=new BusinessDAO();
	JobDAO jobDao=new JobDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String choice=req.getParameter("id");
		
		try {
			HttpSession session2 = req.getSession(false);

			if (session2 == null) {
			    resp.sendRedirect("login.jsp");
			    return;
			}

			User user = (User) session2.getAttribute("user");

			if (user == null) {
			    resp.sendRedirect("login.jsp");
			    return;
			}
	
			JobApplicationDAO dao = new JobApplicationDAO();
			
			EventDAO eventDao = new EventDAO();

			session2.setAttribute("lastEvents", eventDao.getLastThreeEvents());
			session2.setAttribute("eventsCount", eventDao.getAllEvents().size());
			session2.setAttribute("eventsList", eventDao.getAllEvents());
			
			session2.setAttribute("allApplications", dao.getAllApplicationWithJob());
			session2.setAttribute("userById", userDao.getUserById(user.getUserId()));
			
			session2.setAttribute("userList", userDao.getAllUsers());
			session2.setAttribute("lastUsers", userDao.getLastThreeUsers());
			session2.setAttribute("lastInsti", instiDao.getLastThreeInstitutions());
			session2.setAttribute("lastJobs", jobDao.getLastThreeJobs());
			session2.setAttribute("lastBusi", busiDao.getLastThreeBusinesses());
			session2.setAttribute("jobsList", jobDao.getAllJobs());
			session2.setAttribute("instiList", instiDao.getAllInstitutions());
			session2.setAttribute("busiList", busiDao.getAllBusinesses());
			
			
			
			
			session2.setAttribute("busiCount", busiDao.countBusinesses());
			session2.setAttribute("instiCount", instiDao.countOfInstitutions());
			session2.setAttribute("jobsCount", jobDao.countOfJobs());
			session2.setAttribute("usersCount", userDao.countOfAllUsers());
			
			req.getRequestDispatcher("admin-dashboard.jsp").forward(req, resp);
			
			
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
}
