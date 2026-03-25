package com.smartcity.dao;

import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.Businesses;
import com.smartcity.util.DBConnection;
import java.sql.*;

public class BusinessDAO {
	
	
	
	public List<Businesses> getAllBusinesses(){
		String sql="SELECT * from businesses";
		List<Businesses> list=new ArrayList<>();
		
		
		try(Connection conn=DBConnection.getConnection()) {
			
			PreparedStatement pst=conn.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				Businesses bs=new Businesses(rs.getInt("business_id"),rs.getString("business_name"),rs.getString("category"),rs.getString("description"),rs.getString("address"),rs.getString("contact_phone"),rs.getString("contact_email"),rs.getString("website"),rs.getInt("rating"),rs.getTimestamp("created_at"));
				list.add(bs);
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	public int countBusinesses() {
		BusinessDAO busiDao=new BusinessDAO();
		return busiDao.getAllBusinesses().size();
	}
	
	public List<Businesses> getLastThreeBusinesses(){
		String sql="SELECT * from businesses ORDER BY business_id DESC LIMIT 3";
		List<Businesses> list=new ArrayList<>();
		
		
		try(Connection conn=DBConnection.getConnection()) {
			
			PreparedStatement pst=conn.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				Businesses bs=new Businesses(rs.getInt("business_id"),rs.getString("business_name"),rs.getString("category"),rs.getString("description"),rs.getString("address"),rs.getString("contact_phone"),rs.getString("contact_email"),rs.getString("website"),rs.getInt("rating"),rs.getTimestamp("created_at"));
				list.add(bs);
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	public Businesses getBusinessById(int id) {
		String sql="SELECT * FROM businesses where business_id=?";
		
		try(Connection conn=DBConnection.getConnection()) {
			
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				Businesses bs=new Businesses(rs.getInt("business_id"),rs.getString("business_name"),rs.getString("category"),rs.getString("description"),rs.getString("address"),rs.getString("contact_phone"),rs.getString("contact_email"),rs.getString("website"),rs.getInt("rating"),rs.getTimestamp("created_at"));
				return bs;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean update(int id,Businesses business) {
		String sql="UPDATE businesses SET business_name=?,category=?,"
				+ "description=?,address=?,contact_phone=?,contact_email=?,website=?,rating=? where business_id=?";
		try {
			Connection conn=DBConnection.getConnection();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,business.getBusinessName());
			pst.setString(2, business.getCategory());
			pst.setString(3, business.getDescription());
			pst.setString(4, business.getAdress());
			pst.setString(5, business.getContactNumber());
			pst.setString(6, business.getContactEmail());
			pst.setString(7, business.getWebsite());
			pst.setInt(8, business.getRating());
			pst.setInt(9, id);
			
			return pst.executeUpdate()>0;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean addBusiness(Businesses business) throws SQLException {
		
		String sql = "INSERT INTO businesses " +
	             "(business_name, category, description, address, contact_phone, " +
	             "contact_email, website, owner_id, rating, created_at) " +
	             "VALUES (?,?,?,?,?,?,?,?,?,?)";
	
		PreparedStatement pst;
		Connection conn=DBConnection.getConnection();
		pst = conn.prepareStatement(sql);
		
		pst.setString(1, business.getBusinessName());
		pst.setString(2, business.getCategory());
		pst.setString(3, business.getDescription());
		pst.setString(4, business.getAdress());
		pst.setString(5, business.getContactEmail());
		pst.setString(6, business.getContactNumber());
		pst.setString(7, business.getWebsite());
		pst.setInt(8, business.getOwnerId());
		pst.setDouble(9, business.getRating());
		pst.setTimestamp(10, business.getCreatedAt());
		return pst.executeUpdate()>0;
	}
	public List<Businesses> getBusinessByOwnerId(int id) {
		String sql="SELECT * FROM businesses where owner_id=?";
		
		try(Connection conn=DBConnection.getConnection()) {
			
			List<Businesses> list=new ArrayList<>();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				Businesses bs=new Businesses(rs.getInt("business_id"),rs.getString("business_name"),rs.getString("category"),rs.getString("description"),rs.getString("address"),rs.getString("contact_phone"),rs.getString("contact_email"),rs.getString("website"),rs.getInt("rating"),rs.getTimestamp("created_at"));
				list.add(bs);
			}
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean deleteById(int id) throws SQLException {
		String sql="DELETE FROM businesses where business_id=?";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		return pst.executeUpdate()>0;
	}
}
