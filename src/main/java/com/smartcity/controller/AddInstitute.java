package com.smartcity.controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.smartcity.dao.InstitutionDAO;
import com.smartcity.model.Institutions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addInstitute")
public class AddInstitute extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		InstitutionDAO dao=new InstitutionDAO();
		Institutions insti=new Institutions();
		
		
		
		insti.setName(req.getParameter("institutionName"));
		insti.setInstituitionTyoe(req.getParameter("institutionType"));
		insti.setAddress(req.getParameter("address"));
		insti.setContactEmail(req.getParameter("email"));
		insti.setContactPhone(req.getParameter("phone"));
		insti.setCourseOffer(req.getParameter("courseOffer"));
		insti.setWebsite(req.getParameter("website"));
		insti.setFacilities(req.getParameter("facilities"));
		insti.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		
		if(dao.addInstitution(insti)) {
			req.setAttribute("success", "Institution added Successfully!!!");
			resp.sendRedirect("admin-dashboard");
			return;
		}
		else {
			req.setAttribute("error", "Institute not added, please try again...");
			resp.sendRedirect("add-institute.jsp");
			return;
		}
		
		
	}
	
	
}
