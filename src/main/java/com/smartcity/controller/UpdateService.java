package com.smartcity.controller;

import java.io.IOException;
import java.math.BigDecimal;

import com.smartcity.dao.ServicesDAO;
import com.smartcity.model.Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateService")
public class UpdateService extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		if(session==null) {
			resp.sendRedirect("login.jsp");
		}
		
		String strId=req.getParameter("id");
		
		if(strId==null) {
			resp.sendRedirect("business");
			return;
		}
		int id=Integer.parseInt(strId);
		ServicesDAO dao=new ServicesDAO();
		session.setAttribute("service", dao.getServicesById(id));
		resp.sendRedirect("update-service.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(req.getParameter("serviceId"));
	    String name = req.getParameter("serviceName");
	    String desc = req.getParameter("description");
	    double price = Double.parseDouble(req.getParameter("price"));
	    int duration = Integer.parseInt(req.getParameter("durationMinutes"));
	    String status = req.getParameter("status");

	    Services service = new Services();
	    service.setServiceId(id);
	    service.setServiceName(name);
	    service.setDescription(desc);
	    service.setPrice(BigDecimal.valueOf(price));
	    service.setDurationMinutes(duration);
	    service.setStatus(status);

	    ServicesDAO dao = new ServicesDAO();
	    dao.updateService(service);

	    resp.sendRedirect("business");
		
		
	}
	
}
