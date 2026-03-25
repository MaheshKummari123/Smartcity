package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.model.Businesses;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addBusiness")
public class AddBusiness extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session=req.getSession(false);
		BusinessDAO dao=new BusinessDAO();
		String strBusiId=req.getParameter("businessId");
		if(strBusiId==null) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int busiId=Integer.parseInt(strBusiId);
		Businesses busi=dao.getBusinessById(busiId);
		if(busi==null) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		
		resp.sendRedirect("add-job.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BusinessDAO dao=new BusinessDAO();
		Businesses business=new Businesses();
		//HttpSession session=req.getSession(false);
		
		business.setBusinessName(req.getParameter("businessName"));
		business.setCategory(req.getParameter("category"));
		business.setDescription(req.getParameter("desc"));
		business.setAdress(req.getParameter("address"));
		business.setContactNumber(req.getParameter("phone"));
		business.setContactEmail(req.getParameter("email"));
		business.setWebsite(req.getParameter("website"));
		
		String strOwnerId=req.getParameter("ownerId");
		if(strOwnerId==null || strOwnerId.trim().isEmpty()) {
			throw new IllegalArgumentException("Owner id is empty");
		}
		business.setOwnerId(Integer.parseInt(strOwnerId));
		
		String strRating=req.getParameter("rating");
		if(strRating==null || strRating.trim().isEmpty()) {
			throw new IllegalArgumentException("Rating is empty");
		}
		business.setRating(Integer.parseInt(req.getParameter("rating")));
		business.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		
		try {
			dao.addBusiness(business);
			
			resp.sendRedirect("admin-dashboard");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
