package com.smartcity.controller;

import java.io.IOException;

import com.smartcity.dao.EventDAO;
import com.smartcity.model.Event;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateEvent")
public class UpdateEvent extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("eventId"));

        EventDAO dao = new EventDAO();

        try {
            Event e = dao.getEventById(id);

            HttpSession session = req.getSession();
            session.setAttribute("eventById", e);

            req.getRequestDispatcher("update-event.jsp").forward(req, resp);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("eventId"));

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
        e.setStatus(req.getParameter("status"));

        EventDAO dao = new EventDAO();

        try {
            dao.updateEvent(id, e);
            resp.sendRedirect("admin-events.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}