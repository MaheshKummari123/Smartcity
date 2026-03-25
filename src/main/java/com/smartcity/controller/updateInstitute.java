package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.InstitutionDAO;
import com.smartcity.model.Institutions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateIstitute")
public class updateInstitute extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		InstitutionDAO dao=new InstitutionDAO();
		String strId=req.getParameter("institutionId");
		if(strId==null||strId.trim().isEmpty()) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int instiId=Integer.parseInt(strId);
		
		try {
			Institutions insti=dao.getInstituteById(instiId);
			req.setAttribute("instiById", insti);
			req.getRequestDispatcher("update-institute.jsp").forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Institutions insti=new Institutions();
		InstitutionDAO dao=new InstitutionDAO();
		
		String strId=req.getParameter("institutionId");
		if(strId==null) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int id=Integer.parseInt(strId);
		
		
		insti.setInstitutionId(id);
		insti.setName(req.getParameter("instiName"));
		insti.setInstituitionTyoe(req.getParameter("type"));
		insti.setAddress(req.getParameter("address"));
		insti.setContactEmail(req.getParameter("email"));
		insti.setContactPhone(req.getParameter("phone"));
		insti.setCourseOffer(req.getParameter("courseOffer"));
		insti.setWebsite(req.getParameter("website"));
		insti.setFacilities(req.getParameter("facilities"));
		
		try {
			dao.update(id, insti);
			resp.sendRedirect("admin-dashboard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
