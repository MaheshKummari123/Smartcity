package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.Contact;
import com.smartcity.util.DBConnection;

public class ContactDAO {
	
	public boolean save(Contact contact) throws SQLException {
		String sql="INSERT INTO contact_messages(name, email, phone, message,created_at) VALUES(?,?,?,?,?)";
		
		try(Connection conn=DBConnection.getConnection()) {
			PreparedStatement pst=conn.prepareStatement(sql);
			
			pst.setString(1, contact.getName());
			pst.setString(2, contact.getEmail());
			pst.setString(3, contact.getPhone());
			pst.setString(4, contact.getMessage());
			pst.setTimestamp(5, contact.getCreatedAt());
			
			return pst.executeUpdate()>0;
		}
	}
	public List<Contact> selectAllMessages() {

	    List<Contact> contacts = new ArrayList<>();

	    String sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {

	            Contact contact = new Contact();

	            contact.setId(rs.getInt("id"));
	            contact.setName(rs.getString("name"));
	            contact.setEmail(rs.getString("email"));
	            contact.setPhone(rs.getString("phone"));
	            contact.setMessage(rs.getString("message"));
	            contact.setCreatedAt(rs.getTimestamp("created_at"));

	            contacts.add(contact);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return contacts;
	}
	
	public boolean deleteMsg(int id) throws SQLException {
		String sql="DELETE FROM contact_messages where id=?";
		
		try(Connection conn=DBConnection.getConnection()) {
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			return pst.executeUpdate()>0;
		}
		
	}
}
