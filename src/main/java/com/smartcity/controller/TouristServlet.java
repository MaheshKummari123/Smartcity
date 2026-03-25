package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.TouristDAO;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/tourist")
public class TouristServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		TouristDAO dao=new TouristDAO();
		User user=(User)session.getAttribute("user");
//		if(session==null || user==null) {
//			resp.sendRedirect("login.jsp");
//			return;
//		}
		try {
			session.setAttribute("events", dao.getEntertainments());
			session.setAttribute("museum_histoPlaces", dao.getMuseumHistoricalPlaces());
			session.setAttribute("touristList", dao.getAllTourists());
			session.setAttribute("touristById", dao.getTouristsById(0));
			session.setAttribute("hotels", dao.getHotelTourists());
			resp.sendRedirect("tourist-dashboard.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
}
