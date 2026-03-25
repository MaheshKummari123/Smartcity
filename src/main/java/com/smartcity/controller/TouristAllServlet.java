package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.TouristDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/touristAll")
public class TouristAllServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		String urlPage=req.getParameter("urlPage");
		TouristDAO dao=new TouristDAO();
		if(urlPage==null) {
			resp.sendRedirect("tourist");
			return;
		}
		if("attractions".equals(urlPage)) {
			try {
				req.setAttribute("attractionList", dao.getMuseumHistoricalPlaces());
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("hotels".equals(urlPage)) {
			
		}
	}

	
}
