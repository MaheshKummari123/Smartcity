package com.smartcity.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.smartcity.dao.ContactDAO;
import com.smartcity.model.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		
		if(session==null) {
			resp.sendRedirect("index.jsp");
			return;
		}
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String message=req.getParameter("msg");
		
		if(name == null || name.trim().isEmpty() ||
			       email == null || email.trim().isEmpty() ||
			       phone == null || phone.trim().isEmpty() ||
			       message == null || message.trim().isEmpty()) {

			        session.setAttribute("msg","⚠ Please fill all fields before sending message.");
			        resp.sendRedirect("contact.jsp");
			        return;
			    }
		
		Contact contact=new Contact();
		contact.setName(name);
		contact.setEmail(email);
		contact.setMessage(message);
		contact.setPhone(phone);
		contact.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		
		ContactDAO dao=new ContactDAO();
		try {
			dao.save(contact);
			session.setAttribute("msg", "Message Sent: Thank you for contacting Smart City. Our team will reach you soon.✅");
			resp.sendRedirect("contact.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
}
