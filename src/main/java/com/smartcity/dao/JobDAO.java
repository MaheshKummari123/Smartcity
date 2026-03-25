package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.Institutions;
import com.smartcity.model.Job;
import com.smartcity.util.DBConnection;

public class JobDAO {
	
	public List<Job> getAllJobs() throws SQLException{
		String sql="SELECT * FROM jobs";
		List<Job> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setCompanyName(rs.getString("company_name"));
			job.setJobTitle(rs.getString("job_title"));
			job.setDescription(rs.getString("description"));
			job.setRequirements(rs.getString("requirements"));
			job.setSalaryRange(rs.getString("salary_range"));
			job.setJobType(rs.getString("job_type"));
			job.setLocation(rs.getString("location"));
			job.setContactEmail(rs.getString("contact_email"));
			job.setPostedBy(rs.getInt("posted_by"));
			job.setStatus(rs.getString("status"));
			job.setExperience(rs.getString("experience"));
			job.setPostedAt(rs.getTimestamp("posted_at"));
			list.add(job);
		}
		return list;
	}
	public int countOfJobs() throws SQLException {
		JobDAO dao=new JobDAO();
		return dao.getAllJobs().size();
	}
	
	
	public List<Job> getLastThreeJobs() throws SQLException{
		String sql="SELECT * FROM jobs ORDER BY job_id DESC LIMIT 3";
		List<Job> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setCompanyName(rs.getString("company_name"));
			job.setJobTitle(rs.getString("job_title"));
			job.setDescription(rs.getString("description"));
			job.setRequirements(rs.getString("requirements"));
			job.setSalaryRange(rs.getString("salary_range"));
			job.setJobType(rs.getString("job_type"));
			job.setLocation(rs.getString("location"));
			job.setContactEmail(rs.getString("contact_email"));
			job.setPostedBy(rs.getInt("posted_by"));
			job.setStatus(rs.getString("status"));
			job.setExperience(rs.getString("experience"));
			job.setPostedAt(rs.getTimestamp("posted_at"));
			list.add(job);
		}
		return list;
	}
	public boolean addJob(Job job) throws SQLException {
		String sql="INSERT INTO jobs (" +
			    "company_name, job_title, description, requirements, salary_range, " +
			    "job_type, location, contact_email, posted_by, status, experience, posted_at" +
			    ") VALUES (?,?,?,?,?,?::job_type_enum,?,?,?,?::job_status_enum,?,?)";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setString(1, job.getCompanyName());
		pst.setString(2, job.getJobTitle());
		pst.setString(3, job.getDescription());
		pst.setString(4, job.getRequirements());
		pst.setString(5,job.getSalaryRange());
		pst.setObject(6, job.getJobType(), java.sql.Types.OTHER);
		pst.setString(7, job.getLocation());
		pst.setString(8, job.getContactEmail());
		pst.setInt(9, job.getPostedBy());
		pst.setObject(10, job.getStatus(), java.sql.Types.OTHER);
		pst.setString(11, job.getExperience());
		pst.setTimestamp(12, job.getPostedAt());
		
		return (pst.executeUpdate()>0);
	}
	public Job getJobById(int id) {
		Job job=new Job();
		String sql="SELECT * FROM jobs where job_id=?";
		
		try {
			Connection conn=DBConnection.getConnection();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				job.setJobId(rs.getInt("job_id"));
				job.setCompanyName(rs.getString("company_name"));
				job.setJobTitle(rs.getString("job_title"));
				job.setDescription(rs.getString("description"));
				job.setRequirements(rs.getString("requirements"));
				job.setSalaryRange(rs.getString("salary_range"));
				job.setJobType(rs.getString("job_type"));
				job.setLocation(rs.getString("location"));
				job.setContactEmail(rs.getString("contact_email"));
				job.setPostedBy(rs.getInt("posted_by"));
				job.setStatus(rs.getString("status"));
				job.setExperience(rs.getString("experience"));
				job.setPostedAt(rs.getTimestamp("posted_at"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return job;
	}
	
	
	
	public boolean updateJob(int id,Job job) {
		String sql="UPDATE jobs SET company_name=?,job_title=?,description=?,"
				+ "requirements=?,salary_range=?,job_type=?::job_type_enum,location=?,"
				+ "contact_email=?,status=?::job_status_enum,experience=? where job_id=?";
		
		try {
			Connection conn=DBConnection.getConnection();
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, job.getCompanyName());
			pst.setString(2, job.getJobTitle());
			pst.setString(3, job.getDescription());
			pst.setString(4, job.getRequirements());
			pst.setString(5,job.getSalaryRange());
			pst.setString(6, job.getJobType());
			pst.setString(7, job.getLocation());
			
			pst.setString(8, job.getContactEmail());
			
			pst.setString(9, job.getStatus());
			pst.setString(10, job.getExperience());
			pst.setInt(11, id);
			
			return pst.executeUpdate()>0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean deleteById(int id) throws SQLException {
		String sql="DELETE FROM jobs where job_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		
		return pst.executeUpdate()>0;
	}
	
	public List<Job> getInternship() throws SQLException{
		String sql="SELECT * FROM jobs where job_type=?::job_type_enum";
		List<Job> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "internship");
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setCompanyName(rs.getString("company_name"));
			job.setJobTitle(rs.getString("job_title"));
			job.setDescription(rs.getString("description"));
			job.setRequirements(rs.getString("requirements"));
			job.setSalaryRange(rs.getString("salary_range"));
			job.setJobType(rs.getString("job_type"));
			job.setLocation(rs.getString("location"));
			job.setContactEmail(rs.getString("contact_email"));
			job.setPostedBy(rs.getInt("posted_by"));
			job.setStatus(rs.getString("status"));
			job.setExperience(rs.getString("experience"));
			job.setPostedAt(rs.getTimestamp("posted_at"));
			list.add(job);
		}
		return list;
	}
	
	public List<Job> getFresherJobs() throws SQLException{
		String sql="SELECT * FROM jobs where experience=?";
		List<Job> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "Fresher");
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setCompanyName(rs.getString("company_name"));
			job.setJobTitle(rs.getString("job_title"));
			job.setDescription(rs.getString("description"));
			job.setRequirements(rs.getString("requirements"));
			job.setSalaryRange(rs.getString("salary_range"));
			job.setJobType(rs.getString("job_type"));
			job.setLocation(rs.getString("location"));
			job.setContactEmail(rs.getString("contact_email"));
			job.setPostedBy(rs.getInt("posted_by"));
			job.setStatus(rs.getString("status"));
			job.setExperience(rs.getString("experience"));
			job.setPostedAt(rs.getTimestamp("posted_at"));
			list.add(job);
		}
		return list;
	}
	public List<Job> getExperiencedJobs() throws SQLException{
		String sql="SELECT * FROM jobs where experience!=? limit 6";
		List<Job> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "Fresher");
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Job job=new Job();
			job.setJobId(rs.getInt("job_id"));
			job.setCompanyName(rs.getString("company_name"));
			job.setJobTitle(rs.getString("job_title"));
			job.setDescription(rs.getString("description"));
			job.setRequirements(rs.getString("requirements"));
			job.setSalaryRange(rs.getString("salary_range"));
			job.setJobType(rs.getString("job_type"));
			job.setLocation(rs.getString("location"));
			job.setContactEmail(rs.getString("contact_email"));
			job.setPostedBy(rs.getInt("posted_by"));
			job.setStatus(rs.getString("status"));
			job.setExperience(rs.getString("experience"));
			job.setPostedAt(rs.getTimestamp("posted_at"));
			list.add(job);
		}
		return list;
	}
	public List<Job> searchJobs(
	        String jobType,
	        String experience,
	        String skill,
	        String location) throws SQLException {

	    List<Job> list = new ArrayList<>();

	    StringBuilder sql = new StringBuilder(
	            "SELECT * FROM jobs WHERE status='active'"
	    );

	    List<Object> params = new ArrayList<>();

	    if (jobType != null && !jobType.isEmpty()) {
	        sql.append(" AND job_type = ?::job_type_enum ");
	        params.add(jobType);
	    }

	    if (experience != null && !experience.isEmpty()) {
	        sql.append(" AND experience = ? ");
	        params.add(experience);
	    }

	    if (skill != null && !skill.isEmpty()) {
	        sql.append(" AND LOWER(requirements) LIKE ? ");
	        params.add("%" + skill.toLowerCase() + "%");
	    }

	    if (location != null && !location.isEmpty()) {
	        sql.append(" AND LOWER(location) LIKE ? ");
	        params.add("%" + location.toLowerCase() + "%");
	    }

	    Connection conn = DBConnection.getConnection();
	    PreparedStatement pst = conn.prepareStatement(sql.toString());

	    for (int i = 0; i < params.size(); i++) {
	        pst.setObject(i + 1, params.get(i));
	    }

	    ResultSet rs = pst.executeQuery();

	    while (rs.next()) {

	        Job job = new Job();

	        job.setJobId(rs.getInt("job_id"));
	        job.setCompanyName(rs.getString("company_name"));
	        job.setJobTitle(rs.getString("job_title"));
	        job.setDescription(rs.getString("description"));
	        job.setRequirements(rs.getString("requirements"));
	        job.setSalaryRange(rs.getString("salary_range"));
	        job.setJobType(rs.getString("job_type"));
	        job.setLocation(rs.getString("location"));
	        job.setContactEmail(rs.getString("contact_email"));
	        job.setPostedBy(rs.getInt("posted_by"));
	        job.setStatus(rs.getString("status"));
	        job.setExperience(rs.getString("experience"));
	        job.setPostedAt(rs.getTimestamp("posted_at"));

	        list.add(job);
	    }

	    return list;
	}
}
