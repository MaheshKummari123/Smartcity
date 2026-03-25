package com.smartcity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartcity.model.User;
import com.smartcity.util.DBConnection;

public class UserDAO {
	
	public User login(String username,String password) {
		String sql="select * from users where username=? and password=?";
		
		try (Connection conn=DBConnection.getConnection();){
			if(conn==null) {
				throw new RuntimeException("DB connection failed");
			}
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()) {
				return extractUser(rs);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean register(User user) {
		String sql="INSERT INTO users (username,password,email,user_type,full_name,phone,created_at) values(?, ?, ?, ?::user_type_enum, ?,?,?)";
		
		try (Connection conn=DBConnection.getConnection();){
			if(conn==null) {
				throw new RuntimeException("DB connection failed");
			}
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getUserType());
			pst.setString(5, user.getFullName());
			pst.setString(6, user.getPhone());
			pst.setTimestamp(7, user.getCreatedAt());
			
			return pst.executeUpdate()>0;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public User getUserById(int userId) {
		String sql="SELECT * FROM users where user_id=?";
		
		try (Connection conn=DBConnection.getConnection();){
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, userId);
			
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				return extractUser(rs);
			}
		}
		catch(SQLException e) {
			
		}
		return null;
	}
	
	
	public User extractUser(ResultSet rs) throws SQLException {
		User user=new User();
		user.setUserId(rs.getInt("user_id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setUserType(rs.getString("user_type"));
        user.setFullName(rs.getString("full_name"));
        user.setPhone(rs.getString("phone"));
        user.setCreatedAt(rs.getTimestamp("created_at"));
        return user;
	}
	
	public boolean isUsernameExists(String username) {
		String sql="select 1 from users where username=?";
		try(Connection conn=DBConnection.getConnection()) {
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet rs=pst.executeQuery();
			return rs.next();
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public int countOfAllUsers() throws SQLException {
		UserDAO dao=new UserDAO();
		return dao.getAllUsers().size();
	}
	public List<User> getAllUsers() throws SQLException{
		List<User> list=new ArrayList<>();
		String sql="SELECT * from users";
		try (Connection conn=DBConnection.getConnection();){
			PreparedStatement pst=conn.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				User user=new User(rs.getInt("user_id"),rs.getString("username"),rs.getString("full_name"),rs.getString("email"),rs.getString("phone"),rs.getString("user_type"));
				list.add(user);
			}
			System.out.println("USERS FETCHED"+list.size());
		}
		return list;
		
	}
	public List<User> getLastThreeUsers(){
		String sql="SELECT * FROM users ORDER BY user_id DESC LIMIT 3";
		List<User> list=new ArrayList<>();
		try (Connection conn=DBConnection.getConnection();){
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				User user=new User();
				user.setUserId(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setUserType(rs.getString("user_type"));
				user.setFullName(rs.getString("full_name"));
				user.setPhone(rs.getString("phone"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(user);
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean update(int id,User user) {
		boolean updatePassword = user.getPassword() != null && !user.getPassword().isEmpty();
		
		String sql;
		if(updatePassword) {
			sql="UPDATE users SET username=?,password=?,email=?,user_type=?::user_type_enum,full_name=?,phone=? where user_id=?";
		}
		else {
			sql="UPDATE users SET username=?,email=?,user_type=?::user_type_enum,full_name=?,phone=? where user_id=?";
		}
		
		try (Connection conn=DBConnection.getConnection();){
			PreparedStatement pst=conn.prepareStatement(sql);
			int ind=1;
			pst.setString(ind++, user.getUsername());
			
			if(updatePassword) {
				pst.setString(ind++, user.getPassword());
			}
			
			
			
			pst.setString(ind++, user.getEmail());
			pst.setString(ind++, user.getUserType());
			pst.setString(ind++, user.getFullName());
			pst.setString(ind++, user.getPhone());
			pst.setInt(ind++, id);
			return pst.executeUpdate()>0;
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateProfile(int id,User user) throws SQLException {
		String sql="Update users set username=?,full_name=?,email=?,phone=?,password=? where user_id=?";
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, user.getUsername());
		pst.setString(2, user.getFullName());
		pst.setString(3, user.getEmail());
		pst.setString(4, user.getPhone());
		pst.setString(5, user.getPassword());
		pst.setInt(6, id);
		
		return pst.executeUpdate()>0;
	}
	
	public boolean deleteById(int id) throws SQLException {
		String sql="DELETE FROM users where user_id=?";
		
		Connection conn=DBConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(sql);
		
		pst.setInt(1, id);
		
		return pst.executeUpdate()>0;
	}
}
