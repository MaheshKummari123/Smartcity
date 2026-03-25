package com.smartcity.controller;

import java.io.IOException;
import java.util.List;

import com.smartcity.dao.ServicesDAO;
import com.smartcity.model.Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/selectBusiness")
public class SelectBusinessServlet extends HttpServlet {

    ServicesDAO servDao = new ServicesDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // 🔐 Session check
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            // 1. Get selected business ID from form
            int businessId = Integer.parseInt(req.getParameter("business_id"));

            // 2. Store in session (IMPORTANT)
            session.setAttribute("selectedBusinessId", businessId);

            // 3. Load services for selected business
            List<Services> services = servDao.getServicesByBusinessId(businessId);

            session.setAttribute("services", services);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "⚠️ Failed to switch business!");
        }

        // 4. Redirect back to dashboard
        resp.sendRedirect("business-dashboard.jsp");
    }
}