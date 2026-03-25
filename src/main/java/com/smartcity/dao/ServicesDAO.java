package com.smartcity.dao;

import com.smartcity.model.Services;
import com.smartcity.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServicesDAO {

    // 1️⃣ Add Service
    public boolean addService(Services service) {
        boolean status = false;

        String sql = "INSERT INTO services \n"
        		+ "(business_id, service_name, description, price, duration_minutes, status, created_at, updated_at)\n"
        		+ "VALUES (?, ?, ?, ?, ?, ?::service_status, NOW(), NOW());";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, service.getBusinessId());
            ps.setString(2, service.getServiceName());
            ps.setString(3, service.getDescription());
            ps.setBigDecimal(4, service.getPrice());
            ps.setInt(5, service.getDurationMinutes());
            ps.setString(6, service.getStatus());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 2️⃣ Get Services By Business ID
    public List<Services> getServicesByBusinessId(int businessId) {
        List<Services> list = new ArrayList<>();

        String sql = "SELECT * FROM services WHERE business_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, businessId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Services service = new Services();

                service.setServiceId(rs.getInt("service_id"));
                service.setBusinessId(rs.getInt("business_id"));
                service.setServiceName(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getBigDecimal("price"));
                service.setDurationMinutes(rs.getInt("duration_minutes"));
                service.setStatus(rs.getString("status"));
                service.setCreatedAt(rs.getTimestamp("created_at"));
                service.setUpdatedAt(rs.getTimestamp("updated_at"));

                list.add(service);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 3️⃣ Update Service
    public boolean updateService(Services service) {
        boolean status = false;

        String sql = "UPDATE services SET service_name=?, description=?, price=?, duration_minutes=?, status=?::service_status "
                + "WHERE service_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, service.getServiceName());
            ps.setString(2, service.getDescription());
            ps.setBigDecimal(3, service.getPrice());
            ps.setInt(4, service.getDurationMinutes());
            ps.setString(5, service.getStatus());
            ps.setInt(6, service.getServiceId());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 4️⃣ Delete Service
    public boolean deleteService(int serviceId) {
        boolean status = false;

        String sql = "DELETE FROM services WHERE service_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, serviceId);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public Services getServicesById(int serviceId) {
        List<Services> list = new ArrayList<>();

        String sql = "SELECT * FROM services WHERE service_id = ?";
        Services service = new Services();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, serviceId);

            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                

                service.setServiceId(rs.getInt("service_id"));
                service.setBusinessId(rs.getInt("business_id"));
                service.setServiceName(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setPrice(rs.getBigDecimal("price"));
                service.setDurationMinutes(rs.getInt("duration_minutes"));
                service.setStatus(rs.getString("status"));
                service.setCreatedAt(rs.getTimestamp("created_at"));
                service.setUpdatedAt(rs.getTimestamp("updated_at"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return service;
    }

}