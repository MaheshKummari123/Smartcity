package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.TouristDAO;
import com.smartcity.model.TouristPlace;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/touristDetails")
public class TouristDetails extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		TouristDAO dao=new TouristDAO();
		
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		String source=req.getParameter("source");
		String strId=req.getParameter("id");
		if(strId==null) {
			resp.sendRedirect("tourist");
			return;
		}
		int id=Integer.parseInt(strId);
		
		try {
			TouristPlace tp=dao.getTouristsById(id);
			session.setAttribute("touristById", tp);
			session.setAttribute("source", source);
			session.setAttribute("allTourists", dao.getAllTourists());
			
			resp.sendRedirect("tourist-place-details.jsp");
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
