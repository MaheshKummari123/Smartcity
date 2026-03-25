<%@page import="java.util.List"%>
<%@ page import="com.smartcity.model.User"%>

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
								class="nav-link text-white active btn btn-link w-100 text-start">
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
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-envelope me-2"></i> Messages
							</button>
						</form>
					</li>

					<li class="nav-item">
						<form action="application" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-outline-danger btn btn-link w-100 text-start">
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
				<h1 class="text-center mb-4">Users List</h1>

				<table
					class="table table-bordered table-striped table-hover text-center align-middle">
					<thead class="table-dark">
						<tr>
							<th>User Id</th>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>User Type</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody class="text-center">
						<%
						List<User> list = (List<User>) session.getAttribute("userList");
						%>
						<%
						if (list != null && !list.isEmpty()) {
							for (User user : list) {
						%>
						<tr>
							<td><%=user.getUserId()%></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getFullName()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getPhone()%></td>
							<td><%=user.getUserType()%></td>
							<td>
								<div class="d-flex gap-2">
									<form action="updateUser" method="get">
									<input type="hidden" name="user_id"
										value="<%=user.getUserId()%>">
									<button type="submit" class="btn btn-primary btn-sm">
										Update</button>
								</form>
								<form action="delete" method="get">
									<input type="hidden" name="type" value="user"> <input
										type="hidden" name="id" value="<%=user.getUserId()%>">
									<button class="btn btn-danger" type="submit">Delete</button>
								</form>
								</div>
							</td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
				<!-- Future content goes here -->
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>