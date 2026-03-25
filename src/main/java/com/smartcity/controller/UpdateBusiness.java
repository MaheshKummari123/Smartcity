package com.smartcity.controller;

import java.io.IOException;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.model.Businesses;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateBusiness")
public class UpdateBusiness extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		BusinessDAO dao=new BusinessDAO();
		String strBusiId=req.getParameter("businessId");
		if(strBusiId==null || strBusiId.trim().isEmpty()) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int busiId=Integer.parseInt(strBusiId);
		
		Businesses business=dao.getBusinessById(busiId);
		
		req.setAttribute("businessById", business);
		
		req.getRequestDispatcher("update-business.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BusinessDAO dao=new BusinessDAO();
		Businesses business=new Businesses();
		
		String strBusiId=req.getParameter("businessId");
		if(strBusiId==null || strBusiId.trim().isEmpty()) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int busiId=Integer.parseInt(strBusiId);

		business.setBusinessName(req.getParameter("businessName"));
		business.setCategory(req.getParameter("category"));
		business.setDescription(req.getParameter("desc"));
		business.setAdress(req.getParameter("address"));
		business.setContactNumber(req.getParameter("phone"));
		business.setContactEmail(req.getParameter("email"));
		business.setWebsite(req.getParameter("website"));
		
		String strRating=req.getParameter("rating");
		if(strRating==null || strRating.trim().isEmpty()) {
			resp.sendRedirect("admin-dashboard");
			return;
		}
		business.setRating(Integer.parseInt(strRating));
		
		dao.update(busiId, business);
		
		resp.sendRedirect("admin-dashboard");
	}
	
	
}
