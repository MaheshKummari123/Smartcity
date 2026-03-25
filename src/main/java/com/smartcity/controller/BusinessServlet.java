package com.smartcity.controller;

import java.io.IOException;
import java.util.List;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.dao.ServicesDAO;
import com.smartcity.model.Businesses;
import com.smartcity.model.Services;
import com.smartcity.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/business")
public class BusinessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        BusinessDAO busiDao = new BusinessDAO();
        ServicesDAO servDao = new ServicesDAO();

        try {
            // 1. Get all businesses
            List<Businesses> busiList =
                    busiDao.getBusinessByOwnerId(user.getUserId());

            session.setAttribute("business", busiList);

            // 2. Get selected business from session
            Integer selectedBusinessId =
                    (Integer) session.getAttribute("selectedBusinessId");

            // 3. If not selected → pick first
            if (selectedBusinessId == null && busiList != null && !busiList.isEmpty()) {
                selectedBusinessId = busiList.get(0).getBusinessId();
                session.setAttribute("selectedBusinessId", selectedBusinessId);
            }

            // 4. Load services ONLY for selected business
            if (selectedBusinessId != null) {
                List<Services> services =
                        servDao.getServicesByBusinessId(selectedBusinessId);

                session.setAttribute("services", services);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 5. Redirect
        resp.sendRedirect("business-dashboard.jsp");
    }
}