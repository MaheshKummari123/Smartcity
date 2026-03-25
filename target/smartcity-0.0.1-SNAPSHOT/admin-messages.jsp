<%@page import="java.util.List"%>
<%@ page import="com.smartcity.model.Contact,java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	rel="stylesheet">
</head>
<style>
.app-icon {
	            width: 30px;
	            height: 30px;
	            border-radius: 5px;
	            background: linear-gradient(135deg, #0a2a52, #0d3a6e);
	            border: 1.5px solid rgba(0, 200, 255, 0.3);
	            display: flex;
	            align-items: center;
	            justify-content: center;
	            margin-right: 10px;
	            box-shadow: 0 4px 20px rgba(0, 150, 255, 0.25), 0 0 30px rgba(0, 200, 255, 0.1);
	        }
</style>

<body>

	<div class="container-fluid">
		<div class="row">

			<!-- 🔹 LEFT SIDEBAR -->
			<div
				class="col-2 bg-dark text-white vh-100 p-3 position-fixed top-0 start-0">
				<h4 class="text-center mb-4">
					<i class="fa-solid fa-user-shield"></i> Admin
				</h4>

				<ul class="nav nav-pills flex-column gap-2">
					<li class="nav-item">
						<form action="admin-dashboard.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-chart-line me-2"></i> Dashboard
							</button>
						</form>
					</li>

					<li class="nav-item">
						<form action="admin-user-list.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-users me-2"></i> Users
							</button>
						</form>
					</li>

					<li class="nav-item">

						<form action="admin-institutions.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-building-columns me-2"></i> Institutions
							</button>
						</form>

					</li>

					<li class="nav-item">
						<form action="admin-jobs.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-briefcase me-2"></i> Jobs
							</button>
						</form>
					</li>

					<li class="nav-item">
						<form action="messages" method="get">
							<button type="submit"
								class="nav-link active text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-envelope me-2"></i> Messages
							</button>
						</form>
					</li>

					<li class="nav-item">

						<form action="admin-applications.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-list"></i> Applications
							</button>
						</form>

					</li>

					<li class="nav-item mt-3">
						<form action="logout" method="get">
							<button type="submit"
								class="text-white btn btn-outline-danger w-100 text-start">
								<i class="fa-solid fa-right-from-bracket me-2"></i> Logout
							</button>
						</form>

					</li>
				</ul>
			</div>

			<!-- 🔹 RIGHT CONTENT AREA -->
			<div class="col-10 p-4" style="margin-left: 250px;">
				<h1 class="text-center mb-4">Institutions List</h1>

				<table
					class="table table-bordered table-striped table-hover text-center align-middle">
					<thead class="table-dark">
						
						<tr>
							<th>Message ID</th>
                			<th>Name</th>
			                <th>Email</th>
			                <th>Phone</th>
			                <th>Message</th>
			                <th>Date</th>
			                <th>Action</th>
            			</tr>
						
					</thead>
					<%List<Contact> msgs=(List<Contact>)session.getAttribute("messages"); 
						if(msgs!=null){
							for(Contact msg:msgs){
					%>
					<tbody class="text-center">
						<td><%=msg.getId() %></td>
						<td><%=msg.getName() %></td>
						<td><%=msg.getEmail() %></td>
						<td><%=msg.getPhone() %></td>
						<td><%=msg.getMessage() %></td>
						<td><%=msg.getCreatedAt() %></td>
						<td>
							<form action="delete" method="get">
								<input type="hidden" name="type" value="contactMessages">
								<input type="hidden" name="id" value="<%=msg.getId() %>">
								<button class="btn btn-danger">Delete</button>
							</form>
						</td>
					</tbody>
					<%}
							}%>
				</table>
				<!-- Future content goes here -->
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>