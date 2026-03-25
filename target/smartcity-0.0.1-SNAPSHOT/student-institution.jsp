<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.smartcity.model.Institutions,java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SmartCity | Institutions</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .filter-box {
            background: white;
            padding: 20px;
            border-radius: 8px;
        }
        .card:hover {
            transform: translateY(-5px);
            transition: 0.3s;
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
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="student-dashboard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="#">Institutions</a></li>
                <li class="nav-item"><a class="nav-link" href="student-application.jsp">My Applications</a></li>
                <li class="nav-item">
						<form action="profile" method="get">
							<input type="hidden" name="role" value="student">
							<button type="submit" class="nav-link">Profile</button>
						</form>
				</li>
                <li class="nav-item"><a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 🔹 Page Heading -->
<div class="container my-4">
    <h2 class="fw-bold">Institutions & Colleges</h2>
    <p class="text-muted">Find colleges and training institutes near you</p>
</div>

<!-- 🔹 Filters -->
<div class="container mb-4">
    <div class="filter-box shadow-sm">

        <form action="searchInstitution" method="get">
            <div class="row g-3">

                <div class="col-md-3">
                    <select class="form-select" name="type">
                        <option value="">Institution Type</option>
                        <option value="college">College</option>
                        <option value="school">School</option>
                        <option value="training_center">Training Center</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <select class="form-select" name="course">
                        <option value="">Course</option>
                        <option value="Java">Java Full Stack</option>
                        <option value="Python">Python</option>
                        <option value="MERN">MERN Stack</option>
                        <option value="Data Science">Data Science</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <select class="form-select" name="location">
                        <option value="">Location</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chennai">Chennai</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <button class="btn btn-primary w-100" type="submit">
                        Search
                    </button>
                </div>

            </div>
        </form>

    </div>
</div>

<!-- 🔹 Institution Cards -->
<div class="container">
    <div class="row g-4">
		<%List<Institutions> instiList=(List<Institutions>)session	.getAttribute("allList");
			if(instiList!=null){
				for(Institutions insti : instiList){ 
		%>
        <!-- Card 1 -->
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                	<%String type=insti.getInstituitionType();
                	if(type.equals("university")){
                	%>
                    <span class="badge bg-primary mb-2"><%=insti.getInstituitionType() %></span>
                    <%}
                	else if(type.equals("college")){
                	%>
                	<span class="badge bg-success mb-2"><%=insti.getInstituitionType() %></span>
                	
                	<% }
                	else if(type.equals("school")) {
                	%>
                	<span class="badge bg-info mb-2"><%=insti.getInstituitionType() %></span>
                	<%} 
                	else{
                	%>
                	<span class="badge bg-warning mb-2"><%=insti.getInstituitionType() %></span>
                	<%} %>
                    <h5 class="card-title"><%=insti.getName() %></h5>
                    <p class="text-muted">📍 <%=insti.getAddress() %></p>
                    <p class="card-text">
                        Courses: <%=insti.getCourseOffer() %>
                    </p>
                    <div class="d-flex gap-2">
                        <a href="#" class="btn btn-outline-primary w-50">View</a>
                        <a href="#" class="btn btn-primary w-50">Apply</a>
                    </div>
                </div>
            </div>
        </div>
		<%
		}
		}
		%>
    </div>
</div>

<!-- 🔹 Footer -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    © 2026 SmartCity Application
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
