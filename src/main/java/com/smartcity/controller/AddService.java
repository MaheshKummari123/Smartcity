package com.smartcity.controller;

import java.io.IOException;
import java.math.BigDecimal;

import com.smartcity.dao.ServicesDAO;
import com.smartcity.model.Businesses;
import com.smartcity.model.Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addService")
public class AddService extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null) {
			resp.sendRedirect("business");
			return;
		}
		resp.sendRedirect("add-service.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("business");
            return;
        }

        try {
            // 1. Get form data
        	int businessId = (Integer) session.getAttribute("selectedBusinessId");
            String serviceName = req.getParameter("service_name");
            String description = req.getParameter("description");
            BigDecimal price = new BigDecimal(req.getParameter("price"));
            int duration = Integer.parseInt(req.getParameter("duration"));
            String status = req.getParameter("status");

            // 2. Create model object
            Services service = new Services();
            
            
            service.setBusinessId(businessId);
            service.setServiceName(serviceName);
            service.setDescription(description);
            service.setPrice(price);
            service.setDurationMinutes(duration);
            service.setStatus(status);

            // 3. Call DAO
            ServicesDAO dao=new ServicesDAO();
            boolean isAdded = dao.addService(service);

            // 4. Set message
            if (isAdded) {
                session.setAttribute("msg", "✅ Service added successfully!");
            } else {
                session.setAttribute("msg", "❌ Failed to add service!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "⚠️ Something went wrong!");
        }

        // 5. Redirect to dashboard
        resp.sendRedirect("business");
	}
	
}
