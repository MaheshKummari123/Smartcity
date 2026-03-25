<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.smartcity.model.JobApplication,java.util.List"%>

<%@ page import="com.smartcity.model.User"%>

<%
User user = (User) session.getAttribute("user");
String role = user != null ? user.getUserType() : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart City | My Applications</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

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
body {
	background-color: #f8f9fa;
}

.hero {
	background: linear-gradient(135deg, #0d6efd, #0a58ca);
	color: white;
	padding: 60px 20px;
	text-align: center;
}

.status-badge {
	font-size: 0.85rem;
}

.table-card {
	border-radius: 15px;
}

.btn-sm {
	border-radius: 8px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">
<div class="container d-flex align-itmes-center">
			<div class="d-flex align-items-center">
				<div class="app-icon">
                <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <!-- City building -->
                    <rect x="6" y="18" width="8" height="14" fill="#0e6ea8" rx="1" />
                    <rect x="8" y="20" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="12" y="20" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="8" y="24" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Tall center building -->
                    <rect x="16" y="10" width="10" height="22" fill="#0a5080" rx="1" />
                    <rect x="20" y="7" width="2" height="5" fill="#00e5b0" opacity="0.7" />
                    <rect x="18" y="13" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="22" y="13" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="18" y="18" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <rect x="22" y="18" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Right building -->
                    <rect x="28" y="16" width="7" height="16" fill="#0e6ea8" rx="1" />
                    <rect x="29" y="19" width="2" height="2" fill="#00c8ff" opacity="0.7" />
                    <rect x="33" y="19" width="2" height="2" fill="#00c8ff" opacity="0.5" />
                    <!-- Ground line -->
                    <line x1="4" y1="32" x2="34" y2="32" stroke="#00c8ff" stroke-width="1.2" stroke-opacity="0.5" />
                    <!-- Signal arc -->
                    <path d="M21 4 Q28 4 28 11" stroke="#00e5b0" stroke-width="1.2" fill="none" opacity="0.6"
                        stroke-linecap="round" />
                    <path d="M21 2 Q31 2 31 11" stroke="#00e5b0" stroke-width="0.8" fill="none" opacity="0.35"
                        stroke-linecap="round" />
                </svg>
            </div>
			
			<a class="navbar-brand fw-bold" href="#">Smart City</a>
			</div>

<div class="collapse navbar-collapse">
<ul class="navbar-nav ms-auto">

<!-- 🔹 Home -->
<li class="nav-item">
<a class="nav-link"
href="<%= "student".equals(role) ? "student-dashboard" : "jobseeker" %>">
Home
</a>
</li>

<!-- 🔹 Role-based menu -->
<%
if("student".equals(role)){
%>
<li class="nav-item">
<a class="nav-link" href="student-institution.jsp">Institutions</a>
</li>
<%
}else{
%>
<li class="nav-item">
<a class="nav-link" href="browse-jobs.jsp">Browse Jobs</a>
</li>
<%
}
%>

<!-- 🔹 My Applications -->
<li class="nav-item">
<a class="nav-link active" href="my-applications.jsp">My Applications</a>
</li>

<!-- 🔹 Profile -->
<li class="nav-item">
<form action="profile" method="get">
<input type="hidden" name="role" value="<%=role%>">
<button type="submit" class="nav-link">Profile</button>
</form>
</li>

<!-- 🔹 Logout -->
<li class="nav-item">
<a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a>
</li>

</ul>
</div>
</div>
</nav>

	<!-- Hero Section -->
	<section class="hero">
		<h2>My Job Applications 💼</h2>
		<p>Track and manage all the jobs you've applied for</p>
	</section>

	<!-- Applications Table -->
	<div class="container my-5">

		<div class="card shadow table-card p-4">
			<h5 class="mb-3">Application History</h5>

			<table class="table table-hover align-middle">
				<thead class="table-dark">
					<tr>
						<th>Job Title</th>
						<th>Company</th>
						<th>Applied Date</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<%
					List<JobApplication> applications = (List<JobApplication>) session.getAttribute("applicationsByUserId");
					if (applications != null) {
						for (JobApplication appli : applications) {
					%>
					<tr>
						<td><%=appli.getJobTitle()%></td>
						<td><%=appli.getCompanyName()%></td>
						<td><%=appli.getAppliedAt()%></td>
						<td><span class="badge bg-warning status-badge"><%=appli.getStatus()%></span>
						</td>
						<td>

							<button class="btn btn-outline-primary btn-sm">View</button>
							<form action="delete" method="get"
								onsubmit="return confirmWithPopup();">
								<input type="hidden" name="id"
									value="<%=appli.getApplicationId()%>"> <input
									type="hidden" name="type" value="jobApplication">
								<button class="btn btn-outline-danger btn-sm" type="submit">Withdraw</button>
							</form>
						</td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>

		</div>

	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3"> © 2026
		Smart City Job Portal </footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function confirmWithPopup() {
			return confirm("Are you sure you want to withdraw this application?");
		}
	</script>
</body>
</html>