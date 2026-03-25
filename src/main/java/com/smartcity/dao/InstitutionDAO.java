package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.Institutions;
import com.smartcity.model.User;
import com.smartcity.util.DBConnection;

public class InstitutionDAO {
	
	
	public List<Institutions> getAllInstitutions() throws SQLException{
		String sql="SELECT * FROM institutions";
		List<Institutions> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Institutions insti=new Institutions();
			insti.setInstitutionId(rs.getInt("institution_id"));
			insti.setName(rs.getString("name"));
			insti.setInstituitionTyoe(rs.getString("type"));
			insti.setAddress(rs.getString("address"));
			insti.setContactEmail(rs.getString("contact_email"));
			insti.setContactPhone(rs.getString("contact_phone"));
			insti.setCourseOffer(rs.getString("courses_offered"));
			insti.setWebsite(rs.getString("website"));
			list.add(insti);
		}
		return list;
	}
	public int countOfInstitutions() throws SQLException {
		InstitutionDAO dao=new InstitutionDAO();
		return dao.getAllInstitutions().size();
	}
	public List<Institutions> getLastThreeInstitutions() throws SQLException{
		String sql="SELECT * FROM institutions ORDER BY institution_id DESC LIMIT 3";
		List<Institutions> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Institutions insti=new Institutions();
			insti.setInstitutionId(rs.getInt("institution_id"));
			insti.setName(rs.getString("name"));
			insti.setInstituitionTyoe(rs.getString("type"));
			insti.setAddress(rs.getString("address"));
			insti.setContactEmail(rs.getString("contact_email"));
			insti.setContactPhone(rs.getString("contact_phone"));
			insti.setCourseOffer(rs.getString("courses_offered"));
			insti.setWebsite(rs.getString("website"));
			insti.setCreatedAt(rs.getTimestamp("created_at"));
			list.add(insti);
		}
		return list;
	}
	public Institutions getInstituteById(int id) throws SQLException {
		String sql="SELECT * FROM institutions where institution_id=?";
		Connection conn=DBConnection.getConnection();
		
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			Institutions insti=new Institutions();
			insti.setInstitutionId(rs.getInt("institution_id"));
			insti.setName(rs.getString("name"));
			insti.setInstituitionTyoe(rs.getString("type"));
			insti.setAddress(rs.getString("address"));
			insti.setContactEmail(rs.getString("contact_email"));
			insti.setContactPhone(rs.getString("contact_phone"));
			insti.setCourseOffer(rs.getString("courses_offered"));
			insti.setWebsite(rs.getString("website"));
			insti.setFacilities(rs.getString("facilities"));
			insti.setCreatedAt(rs.getTimestamp("created_at"));
			return insti;
		}
		return null;
	}
	public boolean update(int id,Institutions insti) throws SQLException {
		String sql="UPDATE institutions SET name=?,type=?::institution_type,address=?,contact_email=?,contact_phone=?,courses_offered=?,website=?,facilities=? where institution_id=?";
		Connection conn=DBConnection.getConnection();
		
		PreparedStatement pst=conn.prepareStatement(sql);
		int idx=1;
		pst.setString(idx++, insti.getName());
		pst.setString(idx++, insti.getInstituitionType());
		pst.setString(idx++, insti.getAddress());
		pst.setString(idx++, insti.getContactEmail());
		pst.setString(idx++, insti.getContactPhone());
		pst.setString(idx++, insti.getCourseOffer());
		pst.setString(idx++, insti.getWebsite());
		pst.setString(idx++, insti.getFacilities());
		pst.setInt(idx++, id);
		
		return pst.executeUpdate()>0;
	}
	public boolean addInstitution(Institutions institute) {

	    String sql = "INSERT INTO institutions " +
	            "(name, type, address, contact_email, contact_phone, " +
	            "courses_offered, website, facilities, created_at) " +
	            "VALUES (?,?::institution_type,?,?,?,?,?,?,?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement pst = conn.prepareStatement(sql)) {

	        pst.setString(1, institute.getName());
	        pst.setString(2, institute.getInstituitionType());
	        pst.setString(3, institute.getAddress());
	        pst.setString(4, institute.getContactEmail());
	        pst.setString(5, institute.getContactPhone());
	        pst.setString(6, institute.getCourseOffer());
	        pst.setString(7, institute.getWebsite());
	        pst.setString(8, institute.getFacilities());
	        pst.setTimestamp(9, institute.getCreatedAt());

	        return pst.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	public List<Institutions> getByTrainingInstitutions() throws SQLException {
		String sql="SELECT * FROM institutions where type=?::institution_type";
		
		List<Institutions> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setString(1, "training_center");
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Institutions insti=new Institutions();
			insti.setInstitutionId(rs.getInt("institution_id"));
			insti.setName(rs.getString("name"));
			insti.setInstituitionTyoe(rs.getString("type"));
			insti.setAddress(rs.getString("address"));
			insti.setContactEmail(rs.getString("contact_email"));
			insti.setContactPhone(rs.getString("contact_phone"));
			insti.setCourseOffer(rs.getString("courses_offered"));
			insti.setWebsite(rs.getString("website"));
			insti.setFacilities(rs.getString("facilities"));
			insti.setCreatedAt(rs.getTimestamp("created_at"));
			list.add(insti);
		}
		return list;
	}
	public List<Institutions> getByCollegeAndSchool() throws SQLException {
		String sql="SELECT * FROM institutions where type in (?::institution_type,?::institution_type)";
		
		List<Institutions> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setString(1, "college");
		pst.setString(2, "school");
		
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Institutions insti=new Institutions();
			insti.setInstitutionId(rs.getInt("institution_id"));
			insti.setName(rs.getString("name"));
			insti.setInstituitionTyoe(rs.getString("type"));
			insti.setAddress(rs.getString("address"));
			insti.setContactEmail(rs.getString("contact_email"));
			insti.setContactPhone(rs.getString("contact_phone"));
			insti.setCourseOffer(rs.getString("courses_offered"));
			insti.setWebsite(rs.getString("website"));
			insti.setFacilities(rs.getString("facilities"));
			insti.setCreatedAt(rs.getTimestamp("created_at"));
			list.add(insti);
		}
		return list;
	}
	
//	public List<Institutions> getByCollegeAndSchool() throws SQLException {
//		String sql="SELECT * FROM institutions where type in (?::institution_type,?::institution_type)";
//		
//		List<Institutions> list=new ArrayList<>();
//		Connection conn=DBConnection.getConnection();
//		PreparedStatement pst=conn.prepareStatement(sql);
//		
//		pst.setString(1, "college");
//		pst.setString(2, "school");
//		
//		ResultSet rs=pst.executeQuery();
//		while(rs.next()) {
//			Institutions insti=new Institutions();
//			insti.setInstitutionId(rs.getInt("institution_id"));
//			insti.setName(rs.getString("name"));
//			insti.setInstituitionTyoe(rs.getString("type"));
//			insti.setAddress(rs.getString("address"));
//			insti.setContactEmail(rs.getString("contact_email"));
//			insti.setContactPhone(rs.getString("contact_phone"));
//			insti.setCourseOffer(rs.getString("courses_offered"));
//			insti.setWebsite(rs.getString("website"));
//			insti.setFacilities(rs.getString("facilities"));
//			insti.setCreatedAt(rs.getTimestamp("created_at"));
//			list.add(insti);
//		}
//		return list;
//	}
	
	
	public boolean deleteById(int id) throws SQLException {
		String sql="DELETE FROM institutions where institution_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		return pst.executeUpdate()>0;
	}
	
	public List<Institutions> searchInstitutions(
	        String type,
	        String location,
	        String course) throws SQLException {

	    List<Institutions> list = new ArrayList<>();

	    StringBuilder sql = new StringBuilder(
	        "SELECT * FROM institutions WHERE 1=1 "
	    );

	    List<Object> params = new ArrayList<>();

	    if (type != null && !type.isEmpty()) {
	        sql.append(" AND type = ?::institution_type ");
	        params.add(type);
	    }

	    if (location != null && !location.isEmpty()) {
	        sql.append(" AND LOWER(address) LIKE ? ");
	        params.add("%" + location.toLowerCase() + "%");
	    }

	    if (course != null && !course.isEmpty()) {
	        sql.append(" AND LOWER(courses_offered) LIKE ? ");
	        params.add("%" + course.toLowerCase() + "%");
	    }

	    Connection conn = DBConnection.getConnection();
	    PreparedStatement pst = conn.prepareStatement(sql.toString());

	    for (int i = 0; i < params.size(); i++) {
	        pst.setObject(i + 1, params.get(i));
	    }

	    ResultSet rs = pst.executeQuery();

	    while (rs.next()) {
	        Institutions insti = new Institutions();
	        insti.setInstitutionId(rs.getInt("institution_id"));
	        insti.setName(rs.getString("name"));
	        insti.setInstituitionTyoe(rs.getString("type"));
	        insti.setAddress(rs.getString("address"));
	        insti.setContactEmail(rs.getString("contact_email"));
	        insti.setContactPhone(rs.getString("contact_phone"));
	        insti.setCourseOffer(rs.getString("courses_offered"));
	        insti.setWebsite(rs.getString("website"));
	        insti.setFacilities(rs.getString("facilities"));
	        insti.setCreatedAt(rs.getTimestamp("created_at"));
	        list.add(insti);
	    }

	    return list;
	}
}
