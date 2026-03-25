package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.JobApplication;
import com.smartcity.util.DBConnection;

public class JobApplicationDAO {
	
	public List<JobApplication> getAllApplication() throws SQLException{
		String sql="SELECT * FROM job_applications";
		
		List<JobApplication> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			JobApplication job=new JobApplication();
			job.setApplicationId(rs.getInt("application_id"));
			job.setJobId(rs.getInt("job_id"));
			job.setUserId(rs.getInt("user_id"));
			job.setFullName(rs.getString("full_name"));
			job.setEmail(rs.getString("email"));
			job.setPhone(rs.getString("phone"));
			job.setResumeLink(rs.getString("resume_link"));
			job.setStatus(rs.getString("status"));
			job.setAppliedAt(rs.getTimestamp("applied_at"));
			list.add(job);
		}
		return list;
	}
	public JobApplication getApplicationById(int id) throws SQLException {
		String sql="SELECT * FROM job_applications where application_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		JobApplication job=null;
		if(rs.next()) {
			
			job.setApplicationId(rs.getInt("application_id"));
			job.setJobId(rs.getInt("job_id"));
			job.setUserId(rs.getInt("user_id"));
			job.setFullName(rs.getString("full_name"));
			job.setEmail(rs.getString("email"));
			job.setPhone(rs.getString("phone"));
			job.setResumeLink(rs.getString("resume_link"));
			job.setStatus(rs.getString("status"));
			job.setAppliedAt(rs.getTimestamp("applied_at"));
		}
		return job;
	}
	public boolean updateStatus(int id,String updatedStatus) throws SQLException {
		String sql="UPDATE job_applications SET status=? where application_id=?";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, updatedStatus);
		pst.setInt(2, id);
		
		return pst.executeUpdate()>0;
		
	}
	
	public List<JobApplication> getAllApplicationWithJob() throws SQLException{
		String sql="SELECT ja.*, j.job_title,j.company_name from job_applications as ja JOIN jobs as j on ja.job_id=j.job_id ORDER BY ja.applied_at desc ";
		
		List<JobApplication> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			JobApplication job=new JobApplication();
			job.setApplicationId(rs.getInt("application_id"));
			job.setJobId(rs.getInt("job_id"));
			job.setUserId(rs.getInt("user_id"));
			job.setFullName(rs.getString("full_name"));
			job.setEmail(rs.getString("email"));
			job.setPhone(rs.getString("phone"));
			job.setResumeLink(rs.getString("resume_link"));
			job.setStatus(rs.getString("status"));
			job.setAppliedAt(rs.getTimestamp("applied_at"));
			job.setJobTitle(rs.getString("job_title"));
			job.setCompanyName(rs.getString("company_name"));
			list.add(job);
		}
		return list;
	}
	
	public boolean applyJob(JobApplication job) throws SQLException {
		String sql="INSERT INTO job_applications \n"
				+ "(job_id, user_id, full_name, email, phone, resume_link, applied_at)\n"
				+ "VALUES (?,?,?,?,?,?,?)";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, job.getJobId());
		pst.setInt(2, job.getUserId());
		pst.setString(3, job.getFullName());
		pst.setString(4, job.getEmail());
		pst.setString(5, job.getPhone());
		pst.setString(6, job.getResumeLink());
		pst.setTimestamp(7, job.getAppliedAt());
		
		return pst.executeUpdate()>0;
	}
	
	public List<JobApplication>  getAllByUserId(int id) throws SQLException{
		String sql="SELECT * FROM job_applications where user_id=?";
		
		List<JobApplication> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, id);
		
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			JobApplication job=new JobApplication();
			job.setApplicationId(rs.getInt("application_id"));
			job.setJobId(rs.getInt("job_id"));
			job.setUserId(rs.getInt("user_id"));
			job.setFullName(rs.getString("full_name"));
			job.setEmail(rs.getString("email"));
			job.setPhone(rs.getString("phone"));
			job.setResumeLink(rs.getString("resume_link"));
			job.setStatus(rs.getString("status"));
			job.setAppliedAt(rs.getTimestamp("applied_at"));
			list.add(job);
		}
		return list;
	}
	
	public List<JobApplication>getAllApplicationByUserId(int id) throws SQLException{
		String sql="SELECT ja.*, j.job_title,j.company_name from job_applications as ja JOIN jobs as j on ja.job_id=j.job_id WHERE ja.user_id=? ORDER BY ja.applied_at desc ";
		
		List<JobApplication> list=new ArrayList<>();
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		
		ResultSet rs=pst.executeQuery();
		
		while(rs.next()) {
			JobApplication job=new JobApplication();
			job.setApplicationId(rs.getInt("application_id"));
			job.setJobId(rs.getInt("job_id"));
			job.setUserId(rs.getInt("user_id"));
			job.setFullName(rs.getString("full_name"));
			job.setEmail(rs.getString("email"));
			job.setPhone(rs.getString("phone"));
			job.setResumeLink(rs.getString("resume_link"));
			job.setStatus(rs.getString("status"));
			job.setAppliedAt(rs.getTimestamp("applied_at"));
			job.setJobTitle(rs.getString("job_title"));
			job.setCompanyName(rs.getString("company_name"));
			list.add(job);
		}
		return list;
	}
	
	public boolean deleteApplication(int id) throws SQLException {
		String sql="DELETE FROM job_applications where application_id=?";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		
		return pst.executeUpdate()>0;
	}
}
