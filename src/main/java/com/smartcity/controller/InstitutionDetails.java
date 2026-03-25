package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.InstitutionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/institutionDetails")
public class InstitutionDetails extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		InstitutionDAO instiDao=new InstitutionDAO();
		
		HttpSession session=req.getSession();
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		String strId=req.getParameter("id");
		if(strId==null) {
			resp.sendRedirect("student-dashboard.jsp");
			return;
		}
		int id=Integer.parseInt(strId);
		try {
			session.setAttribute("insti", instiDao.getInstituteById(id));
			resp.sendRedirect("institution-details.jsp");
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
