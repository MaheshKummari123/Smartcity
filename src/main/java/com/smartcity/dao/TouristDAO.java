package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.TouristPlace;
import com.smartcity.util.DBConnection;

public class TouristDAO {
	
	public List<TouristPlace> getAllTourists() throws SQLException{
		String sql="SELECT * FROM tourist_places";
		List<TouristPlace> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			TouristPlace tp = new TouristPlace();

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
			list.add(tp);
		}
		return list;
	}
	
	public TouristPlace getTouristsById(int id) throws SQLException{
		String sql="SELECT * FROM tourist_places where attraction_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		
		TouristPlace tp = new TouristPlace();
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
		}
		return tp;
	}
	
	public List<TouristPlace> getHotelTourists() throws SQLException{
		String sql="SELECT * FROM tourist_places where category='hotel'";
		List<TouristPlace> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			TouristPlace tp = new TouristPlace();

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
			list.add(tp);
		}
		return list;
	}
	
	public List<TouristPlace> getMuseumHistoricalPlaces() throws SQLException{
		String sql="SELECT * FROM tourist_places where category in ('historical','Museum')";
		List<TouristPlace> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			TouristPlace tp = new TouristPlace();

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
			list.add(tp);
		}
		return list;
	}
	
	public List<TouristPlace> getEntertainments() throws SQLException{
		String sql="SELECT * FROM tourist_places where category in ('entertainment')";
		List<TouristPlace> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			TouristPlace tp = new TouristPlace();

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
			list.add(tp);
		}
		return list;
	}
	
	public List<TouristPlace> getPgOrHostels() throws SQLException{
		String sql="SELECT * FROM tourist_places where category in ('PG','Hostel')";
		List<TouristPlace> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			TouristPlace tp = new TouristPlace();

			tp.setAttractionId(rs.getInt("attraction_id"));
			tp.setName(rs.getString("name"));
			tp.setCategory(rs.getString("category"));
			tp.setDescription(rs.getString("description"));
			tp.setAddress(rs.getString("address"));
			tp.setLatitude(rs.getBigDecimal("latitude"));
			tp.setLongitude(rs.getBigDecimal("longitude"));
			tp.setEntryFee(rs.getBigDecimal("entry_fee"));
			tp.setOpeningHours(rs.getString("opening_hours"));
			tp.setImageUrl(rs.getString("image_url"));
			tp.setRating(rs.getBigDecimal("rating"));
			tp.setCreatedAt(rs.getTimestamp("created_at"));
			
			list.add(tp);
		}
		return list;
	}
	
	public boolean deleteById(int id) throws SQLException {
		String sql="DELETE FROM tourist_places where attraction_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		
		return pst.executeUpdate()>0;
	}
}
