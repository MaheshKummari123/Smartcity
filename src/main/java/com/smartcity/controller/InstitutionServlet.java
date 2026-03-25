package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.smartcity.dao.InstitutionDAO;
import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.model.Institutions;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/student-dashboard")
public class InstitutionServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		InstitutionDAO dao=new InstitutionDAO();
		JobApplicationDAO jobAppliDao=new JobApplicationDAO();
		HttpSession session=req.getSession(false);
		User user=(User)req.getAttribute("user");
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		if(user==null) {
			resp.sendRedirect("student-dashboard");
			return;
		}
		int userId=user.getUserId();
		
		try {
			List<Institutions> list=dao.getAllInstitutions();
			
			session.setAttribute("applicationsByUserId", jobAppliDao.getAllApplicationByUserId(userId));
			session.setAttribute("list", list);
			
			resp.sendRedirect("student-dashboard.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	
}
