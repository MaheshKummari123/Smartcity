package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.smartcity.dao.EventDAO;
import com.smartcity.model.Event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/events")
public class EventsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EventDAO dao = new EventDAO();

        try {
            List<Event> list = dao.getAllEvents();

            req.setAttribute("eventsList", list);
            req.getRequestDispatcher("tourist-events.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}