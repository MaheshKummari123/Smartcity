<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.smartcity.model.Job,java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SmartCity | Job Seeker Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .hero {
            background: url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d') no-repeat center center/cover;
            height: 75vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .hero-overlay {
            background: rgba(0,0,0,0.6);
            padding: 40px;
            border-radius: 10px;
        }
        .card:hover {
            transform: scale(1.03);
            transition: 0.3s;
        }
        footer {
            background: #212529;
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
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="browse-jobs.jsp">Browse Jobs</a></li>
                <li class="nav-item">
                	<form action="myApplications" method="get">
                		<!-- <input type="hidden" name="role" value="jobSeeker"> -->
                		<button type="submit" class="nav-link">
                			My Applications
                		</button>
                	</form>
                </li>
                <!-- <li class="nav-item"><a class="nav-link" href="myApplications">My Applications</a></li> -->
                <li class="nav-item">
                	<form action="profile" method="get">
                		<input type="hidden" name="role" value="jobSeeker">
                		<button type="submit" class="nav-link">
                			Profile
                		</button>
                	</form>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 🔹 Hero Section -->
<section class="hero">
    <div class="hero-overlay">
        <h1 class="display-4 fw-bold">Find Your Dream Job 💼</h1>
        <p class="lead">Explore thousands of opportunities in SmartCity</p>
        <a href="#" class="btn btn-primary btn-lg mt-3">Start Exploring</a>
    </div>
</section>

<!-- 🔹 Featured Jobs -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Featured Jobs</h2>

    <div class="row g-4">
		<%List<Job> expiJobs=(List<Job>)session.getAttribute("expiJobs");
			if(expiJobs!=null){
				for(Job job:expiJobs){
		%>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%=job.getJobTitle() %></h5>
                    <p class="text-muted"><%=job.getCompanyName() %></p>
                    <p><%=job.getLocation() %> | ₹<%=job.getSalaryRange() %></p>
                    <div class="d-flex gap-2">
                    	<a href="#" class="btn btn-outline-primary w-50">View Details</a>
                    	<form action="applyJob" method="get">
                    		<input type="hidden" value="job_seeker" name="type">
                    		<input type="hidden" value="<%=job.getJobId() %>" name="id">
                    		<button class="btn btn-primary" type="submit">Apply now</button>
                    	</form>
                    </div>
                    
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
    <h2 class="text-center fw-bold mb-4">Fresher Jobs</h2>

    <div class="row g-4">
		<%List<Job> fresherJobs=(List<Job>)session.getAttribute("fresherJobs");
			if(expiJobs!=null){
				for(Job job:expiJobs){
		%>
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%=job.getJobTitle() %></h5>
                    <p class="text-muted"><%=job.getCompanyName() %></p>
                    <p><%=job.getLocation() %> | ₹<%=job.getSalaryRange() %></p>
                    <a href="#" class="btn btn-outline-primary w-100">View Details</a>
                </div>
            </div>
        </div>
		<%
				}
			}
		%>
    </div>
</section>

<!-- 🔹 Why Choose SmartCity -->
<section class="bg-white py-5">
    <div class="container text-center">
        <h2 class="fw-bold mb-4">Why Choose SmartCity?</h2>

        <div class="row">
            <div class="col-md-4">
                <h5>🔍 Easy Job Search</h5>
                <p>Find jobs quickly with powerful filters.</p>
            </div>
            <div class="col-md-4">
                <h5>📄 Track Applications</h5>
                <p>Monitor your job application status easily.</p>
            </div>
            <div class="col-md-4">
                <h5>🚀 Career Growth</h5>
                <p>Connect with top companies and grow faster.</p>
            </div>
        </div>
    </div>
</section>

<!-- 🔹 Footer -->
<footer class="py-4 text-center">
    © 2026 SmartCity Job Portal
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
