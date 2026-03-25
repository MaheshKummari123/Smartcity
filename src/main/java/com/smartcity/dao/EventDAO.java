package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.Event;
import com.smartcity.util.DBConnection;

public class EventDAO {

    // 🔹 Get All Events
    public List<Event> getAllEvents() throws SQLException {

        String sql = "SELECT * FROM events WHERE status='active'";
        List<Event> list = new ArrayList<>();

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while(rs.next()) {

            Event e = new Event();

            e.setEventId(rs.getInt("event_id"));
            e.setEventName(rs.getString("event_name"));
            e.setDescription(rs.getString("description"));
            e.setEventType(rs.getString("event_type"));
            e.setLocation(rs.getString("location"));
            e.setCity(rs.getString("city"));
            e.setEventDate(rs.getString("event_date"));
            e.setStartTime(rs.getString("start_time"));
            e.setEndTime(rs.getString("end_time"));
            e.setOrganizerName(rs.getString("organizer_name"));
            e.setContactEmail(rs.getString("contact_email"));
            e.setTicketPrice(rs.getString("ticket_price"));
            e.setImageUrl(rs.getString("image_url"));
            e.setStatus(rs.getString("status"));
            e.setCreatedAt(rs.getTimestamp("created_at"));

            list.add(e);
        }

        return list;
    }

    // 🔹 Get Event By ID
    public Event getEventById(int id) throws SQLException {

        String sql = "SELECT * FROM events WHERE event_id=?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setInt(1, id);

        Event e = new Event();

        ResultSet rs = pst.executeQuery();

        if(rs.next()) {

            e.setEventId(rs.getInt("event_id"));
            e.setEventName(rs.getString("event_name"));
            e.setDescription(rs.getString("description"));
            e.setEventType(rs.getString("event_type"));
            e.setLocation(rs.getString("location"));
            e.setCity(rs.getString("city"));
            e.setEventDate(rs.getString("event_date"));
            e.setStartTime(rs.getString("start_time"));
            e.setEndTime(rs.getString("end_time"));
            e.setOrganizerName(rs.getString("organizer_name"));
            e.setContactEmail(rs.getString("contact_email"));
            e.setTicketPrice(rs.getString("ticket_price"));
            e.setImageUrl(rs.getString("image_url"));
            e.setStatus(rs.getString("status"));
            e.setCreatedAt(rs.getTimestamp("created_at"));
        }

        return e;
    }

    // 🔹 Add Event
    public boolean addEvent(Event e) throws SQLException {

        String sql = "INSERT INTO events (" +
                "event_name, description, event_type, location, city, " +
                "event_date, start_time, end_time, organizer_name, contact_email, " +
                "ticket_price, image_url, status, created_at" +
                ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setString(1, e.getEventName());
        pst.setString(2, e.getDescription());
        pst.setString(3, e.getEventType());
        pst.setString(4, e.getLocation());
        pst.setString(5, e.getCity());
        pst.setDate(6, java.sql.Date.valueOf(e.getEventDate()));   // ✅ FIX
        pst.setTime(7, java.sql.Time.valueOf(e.getStartTime() + ":00"));
        pst.setTime(8, java.sql.Time.valueOf(e.getEndTime() + ":00"));
        pst.setString(9, e.getOrganizerName());
        pst.setString(10, e.getContactEmail());
        pst.setString(11, e.getTicketPrice());
        pst.setString(12, e.getImageUrl());
        pst.setString(13, e.getStatus());
        pst.setTimestamp(14, e.getCreatedAt());

        return pst.executeUpdate() > 0;
    }

    // 🔹 Delete Event
    public boolean deleteById(int id) throws SQLException {

        String sql = "DELETE FROM events WHERE event_id=?";

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setInt(1, id);

        return pst.executeUpdate() > 0;
    }

    // 🔹 Get Events By Type
    public List<Event> getEventsByType(String type) throws SQLException {

        String sql = "SELECT * FROM events WHERE event_type=? AND status='active'";
        List<Event> list = new ArrayList<>();

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        pst.setString(1, type);

        ResultSet rs = pst.executeQuery();

        while(rs.next()) {

            Event e = new Event();

            e.setEventId(rs.getInt("event_id"));
            e.setEventName(rs.getString("event_name"));
            e.setDescription(rs.getString("description"));
            e.setEventType(rs.getString("event_type"));
            e.setLocation(rs.getString("location"));
            e.setCity(rs.getString("city"));
            e.setEventDate(rs.getString("event_date"));
            e.setStartTime(rs.getString("start_time"));
            e.setEndTime(rs.getString("end_time"));
            e.setOrganizerName(rs.getString("organizer_name"));
            e.setContactEmail(rs.getString("contact_email"));
            e.setTicketPrice(rs.getString("ticket_price"));
            e.setImageUrl(rs.getString("image_url"));
            e.setStatus(rs.getString("status"));
            e.setCreatedAt(rs.getTimestamp("created_at"));

            list.add(e);
        }

        return list;
    }

    // 🔹 Search Events (like your Institution search)
    public List<Event> searchEvents(String type, String city) throws SQLException {

        List<Event> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT * FROM events WHERE status='active'"
        );

        List<Object> params = new ArrayList<>();

        if(type != null && !type.isEmpty()){
            sql.append(" AND event_type = ? ");
            params.add(type);
        }

        if(city != null && !city.isEmpty()){
            sql.append(" AND LOWER(city) LIKE ? ");
            params.add("%" + city.toLowerCase() + "%");
        }

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql.toString());

        for(int i = 0; i < params.size(); i++){
            pst.setObject(i + 1, params.get(i));
        }

        ResultSet rs = pst.executeQuery();

        while(rs.next()) {

            Event e = new Event();

            e.setEventId(rs.getInt("event_id"));
            e.setEventName(rs.getString("event_name"));
            e.setEventType(rs.getString("event_type"));
            e.setLocation(rs.getString("location"));
            e.setEventDate(rs.getString("event_date"));

            list.add(e);
        }

        return list;
    }
    
    public List<Event> getLastThreeEvents() throws SQLException {

        String sql = "SELECT * FROM events ORDER BY event_id DESC LIMIT 3";

        List<Event> list = new ArrayList<>();

        Connection conn = DBConnection.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {

            Event e = new Event();

            e.setEventId(rs.getInt("event_id"));
            e.setEventName(rs.getString("event_name"));
            e.setEventType(rs.getString("event_type"));
            e.setCity(rs.getString("city"));
            e.setEventDate(rs.getString("event_date"));
            e.setStatus(rs.getString("status"));

            list.add(e);
        }

        return list;
    }
    
    public boolean updateEvent(int id, Event e) {

        String sql = "UPDATE events SET event_name=?, description=?, event_type=?, location=?, city=?, event_date=?, start_time=?, end_time=?, organizer_name=?, contact_email=?, ticket_price=?, image_url=?, status=? WHERE event_id=?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement pst = conn.prepareStatement(sql);

            pst.setString(1, e.getEventName());
            pst.setString(2, e.getDescription());
            pst.setString(3, e.getEventType());
            pst.setString(4, e.getLocation());
            pst.setString(5, e.getCity());
            pst.setDate(6, java.sql.Date.valueOf(e.getEventDate()));
            pst.setTime(7, java.sql.Time.valueOf(e.getStartTime()));
            pst.setTime(8, java.sql.Time.valueOf(e.getEndTime()));
            pst.setString(9, e.getOrganizerName());
            pst.setString(10, e.getContactEmail());
            pst.setString(11, e.getTicketPrice());
            pst.setString(12, e.getImageUrl());
            pst.setString(13, e.getStatus());
            pst.setInt(14, id);

            return pst.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}