<%@ page import="com.smartcity.model.User" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | SmartCity</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
        }

        .profile-section {
            max-width: 800px;
            margin: auto;
        }

        .profile-header {
            background: linear-gradient(135deg, #0d6efd, #6610f2);
            color: white;
            padding: 40px;
            border-radius: 15px 15px 0 0;
            text-align: center;
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
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 4px solid white;
            object-fit: cover;
            margin-top: -60px;
            background: white;
        }

        .profile-card {
            border-radius: 0 0 15px 15px;
        }

        footer {
            background: #212529;
            color: white;
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
		<%String role=(String)session.getAttribute("role");
			if("student".equals(role)){
		%>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="student-dashboard">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="student-institution.jsp">Institutions</a></li>
                <li class="nav-item"><a class="nav-link" href="student-application.jsp">My Applications</a></li>
                <li class="nav-item"><a class="nav-link active" href="profile" id="student">Profile</a></li>
                <li class="nav-item"><a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a></li>
            </ul>
        </div>
        <%}
			else{%>
			<div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="jobseeker">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Browse Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="myApplications">My Applications</a></li>
                <li class="nav-item">
                	<form action="profile" method="get">
                		<input type="hidden" name="role" value="jobSeeker"> 
                		<button type="submit" class="nav-link active">
                			Profile
                		</button>
                	</form>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a>
                </li>
            </ul>
        </div>
        <%} %>
			
    </div>
</nav>

<!-- 🔹 Profile Section -->
<div class="container my-5 profile-section">

    <!-- Profile Header -->
    <div class="profile-header">
        <h3>My Profile</h3>
        <p>Manage your personal details</p>
    </div>

    <!-- Profile Card -->
    <div class="card shadow profile-card p-4">

        <!-- Profile Image -->
        <div class="text-center">
            <img src="https://plus.unsplash.com/premium_photo-1738590561029-33c9c5d64af2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBpYyUyMGNhcnRvb258ZW58MHx8MHx8fDA%3D" class="profile-img">
        </div>

        <!-- Profile Form -->
        <form class="mt-4" action="profile" method="post">

            <div class="row g-3">
				<%User user=(User)session.getAttribute("user"); 
					if(user!=null){
				%>
				<input name="id" type="hidden" value="<%=user.getUserId() %>">
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" value="<%=user.getFullName() %>" name="fullname">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" value="<%=user.getUsername() %>" name="username">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" value="<%=user.getEmail() %>" name="email">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Phone Number</label>
                    <input type="text" class="form-control" value="<%=user.getPhone() %>" name="phone">
                </div>
                
                <div class="col-md-6">
                    <label class="form-label">Password</label>
                    <input type="text" class="form-control" value="<%=user.getPassword() %>" name="password">
                </div>
				<%} %>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary px-5">
                    Update Profile
                </button>
            </div>

        </form>

    </div>
</div>

<footer class="py-3 text-center">
    © 2026 SmartCity Portal
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
