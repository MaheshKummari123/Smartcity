package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.smartcity.dao.EventDAO;
import com.smartcity.model.Event;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addEvent")
public class AddEventServlet extends HttpServlet {
	
	

    

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Event e = new Event();
        

        e.setEventName(req.getParameter("eventName"));
        e.setDescription(req.getParameter("description"));
        e.setEventType(req.getParameter("eventType"));
        e.setLocation(req.getParameter("location"));
        e.setCity(req.getParameter("city"));
        e.setEventDate(req.getParameter("eventDate"));
        e.setStartTime(req.getParameter("startTime"));
        e.setEndTime(req.getParameter("endTime"));
        e.setOrganizerName(req.getParameter("organizer"));
        e.setContactEmail(req.getParameter("email"));
        e.setTicketPrice(req.getParameter("price"));
        e.setImageUrl(req.getParameter("imageUrl"));
        e.setStatus("active");
        e.setCreatedAt(new Timestamp(System.currentTimeMillis()));

        EventDAO dao = new EventDAO();

        try {
            dao.addEvent(e);
            resp.sendRedirect("admin-events.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}