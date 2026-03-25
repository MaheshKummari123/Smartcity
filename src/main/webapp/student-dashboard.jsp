<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.smartcity.model.Institutions,java.util.List,com.smartcity.model.Job,com.smartcity.model.TouristPlace"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SmartCity | Student Portal</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
}

.hero {
	height: 60vh;
	background: 
		url('https://images.pexels.com/photos/6147369/pexels-photo-6147369.jpeg');
	background-size: cover;
	background-position: center;
	color: white;
	padding: 120px 20px;
	text-align: center;
}

.card:hover {
	transform: translateY(-5px);
	transition: 0.3s;
}

footer {
	background-color: #212529;
	color: white;
}
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
</head>
<body>

	<!-- 🔹 Navbar -->
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
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						href="student-dashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="student-institution.jsp">Institutions</a></li>
					<li class="nav-item"><a class="nav-link" href="student-application.jsp">My
							Applications</a></li>
					<li class="nav-item">
						<form action="profile" method="get">
							<input type="hidden" name="role" value="student">
							<button type="submit" class="nav-link">Profile</button>
						</form>
					</li>
					<li class="nav-item"><a
						class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 🔹 Hero Section -->
	<section class="hero text-center">
		<div class="container">
			<h1 class="fw-bold">Welcome, Student 👋</h1>
			<p class="lead mt-3">Explore colleges, training institutes, jobs,
				and opportunities in your city</p>
			<a href="student-institution.jsp" class="btn btn-light btn-lg mt-3">Explore
				Institutions</a>
		</div>
	</section>

	<!-- 🔹 Institutions Section -->
	<section class="container my-5">
		<h2 class="text-center fw-bold mb-4">Top Institutions</h2>
		<div class="row g-4">
			<%
			List<Institutions> instiList = (List<Institutions>) session.getAttribute("instiList");
			if (instiList != null) {
				for (Institutions insti : instiList) {
			%>

			<!-- Card 1 -->
			<div class="col-md-4">
				<div class="card shadow-sm h-100">
					<input type="hidden" name="type"
						value="<%=insti.getInstituitionType()%>">
					<div class="card-body">
						<h5 class="card-title"><%=insti.getName()%></h5>
						<p class="card-text">
							<%=insti.getCourseOffer()%>
						</p>
						<p class="text-muted">
							📍
							<%=insti.getAddress()%></p>
						<form action="institutionDetails" method="get">
							<input type="hidden" value="institution" name="type"> <input
								type="hidden" value="<%=insti.getInstitutionId()%>" name="id">
							<button class="btn btn-outline-primary w-100" type="submit">View
								Details</button>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>

	</section>

	<section class="container my-5">
		<h2 class="text-center fw-bold mb-4">Internship Opportunities</h2>
		<div class="row g-4">
			<%
			List<Job> internshipList = (List<Job>) session.getAttribute("internshipList");
			if (internshipList != null) {
				for (Job intern : internshipList) {
			%>

			<!-- Card 1 -->
			<div class="col-md-4">
				<div class="card shadow-sm h-100">
					<div class="card-body">
						<h5 class="card-title"><%=intern.getCompanyName()%></h5>
						<p class="card-text">
							<%=intern.getRequirements()%>
						</p>
						<p class="text-muted">
							📍
							<%=intern.getLocation()%></p>
						<form action="applyJob" method="get">
							<input type="hidden" value="student" name="type"> <input
								type="hidden" value="<%=intern.getJobId()%>" name="id">
							<button class="btn btn-primary" type="submit">Apply now</button>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>

	</section>

	<section class="container my-5">
		<h2 class="text-center fw-bold mb-4">Hostels & Pg's</h2>
		<div class="row g-4">
			<%
			List<TouristPlace> pg = (List<TouristPlace>) session.getAttribute("Pg's");
			if (pg != null) {
				for (TouristPlace hostel : pg) {
			%>

			<!-- Card 1 -->
			<div class="col-md-4">
				<div class="card shadow-sm h-100">
					<div class="card-body">
						<h5 class="card-title"><%=hostel.getName()%></h5>
						<p class="card-text">
							<%=hostel.getDescription()%>
						</p>
						<p class="text-muted">
							📍
							<%=hostel.getAddress()%></p>
						<form action="touristDetails" method="get">
							<input type="hidden" value="studentDashboard" name="source">
							<input type="hidden" value="<%=hostel.getAttractionId()%>"
								name="id">
							<button class="btn btn-outline-primary" type="submit">View
								Details</button>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>

	</section>

	<section class="container my-5">
		<h2 class="text-center fw-bold mb-4">Top Colleges & Schools</h2>

		<div class="row g-4">
			<%
			List<Institutions> collegeList = (List<Institutions>) session.getAttribute("collegeList");
			if (collegeList != null) {
				for (Institutions clgs : collegeList) {
			%>
			<!-- Card 1 -->
			<div class="col-md-4">
				<input type="hidden" name="type"
					value="<%=clgs.getInstituitionType()%>">
				<div class="card shadow-sm h-100">
					<div class="card-body">
						<h5 class="card-title"><%=clgs.getName()%></h5>
						<p class="card-text">
							<%=clgs.getCourseOffer()%>
						</p>
						<p class="text-muted">
							📍
							<%=clgs.getAddress()%></p>
						<form action="institutionDetails" method="get">
							<input type="hidden" value="institution" name="type"> <input
								type="hidden" value="<%=clgs.getInstitutionId()%>" name="id">
							<button class="btn btn-outline-primary w-100" type="submit">View
								Details</button>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>

	</section>

	<!-- 🔹 Services Section -->
	<section class="bg-white py-5">
		<div class="container">
			<h2 class="text-center fw-bold mb-4">What You Can Do</h2>

			<div class="row text-center">
				<div class="col-md-3">
					<h5>🎓 Apply Courses</h5>
					<p>Apply to institutions directly from the platform</p>
				</div>
				<div class="col-md-3">
					<h5>📄 Track Status</h5>
					<p>Check your application status anytime</p>
				</div>
				<div class="col-md-3">
					<h5>🏢 Find Jobs</h5>
					<p>Explore nearby job opportunities</p>
				</div>
				<div class="col-md-3">
					<h5>👤 Manage Profile</h5>
					<p>Update your details and preferences</p>
				</div>
			</div>
		</div>
	</section>

	<!-- 🔹 Footer -->
	<footer class="py-4 mt-5">
		<div class="container text-center">
			<p class="mb-1">© 2026 SmartCity Application</p>
			<small>Designed for Students • Built with Bootstrap</small>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
