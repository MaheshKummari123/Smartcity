package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.smartcity.dao.BusinessDAO;
import com.smartcity.dao.ContactDAO;
import com.smartcity.dao.EventDAO;
import com.smartcity.dao.InstitutionDAO;
import com.smartcity.dao.JobApplicationDAO;
import com.smartcity.dao.JobDAO;
import com.smartcity.dao.ServicesDAO;
import com.smartcity.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class Delete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null) {
			resp.sendRedirect("login.jsp");
			return;
		}
		String type=req.getParameter("type");
		String strId=req.getParameter("id");
		if(strId==null) {
			session.setAttribute("error", "Invalid Id ❌");
			resp.sendRedirect("admin-dashboard");
			return;
		}
		int id=Integer.parseInt(strId);
		
		if("user".equals(type)) {
			UserDAO userDao=new UserDAO();
			try {
				userDao.deleteById(id);
				session.setAttribute("success", "User deleted successfully ✅");
				resp.sendRedirect("admin-dashboard");
				return;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("institution".equals(type)){
			InstitutionDAO instiDao=new InstitutionDAO();
			try {
				instiDao.deleteById(id);
				session.setAttribute("success", "Institute deleted successfully ✅");
				resp.sendRedirect("admin-dashboard");
				return;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("job".equals(type)) {
			JobDAO jobDao=new JobDAO();
			try {
				jobDao.deleteById(id);
				session.setAttribute("success", "Job deleted successfully ✅");
				resp.sendRedirect("admin-dashboard");
				return;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("business".equals(type)) {
			BusinessDAO busiDao=new BusinessDAO();
			try {
				busiDao.deleteById(id);
				session.setAttribute("success", "Business deleted successfully ✅");
				resp.sendRedirect("admin-dashboard");
				return;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if("service".equals(type)) {
			ServicesDAO servDao=new ServicesDAO();
				servDao.deleteService(id);
				session.setAttribute("success", "Service deleted successfully ✅");
				resp.sendRedirect("business");
				return;
		}
		
		else if("event".equals(type)) {
		    EventDAO dao = new EventDAO();
		    try {
				dao.deleteById(id);
				resp.sendRedirect("admin-dashboard");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if("jobApplication".equals(type)) {
			JobApplicationDAO jobAppliDao=new JobApplicationDAO();
			try {
				jobAppliDao.deleteApplication(id);
				session.setAttribute("success", "Application deleted successfully ✅");
				resp.sendRedirect("application");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if("contactMessages".equals(type)) {
			ContactDAO contactDao=new ContactDAO();
			try {
				contactDao.deleteMsg(id);
				session.setAttribute("success", "Message deleted successfully ✅");
				resp.sendRedirect("messages");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else {
			session.setAttribute("error", "Invalid Type...❌");
			resp.sendRedirect("admin-dashboard");
			return;
		}
	}
	
	
}
