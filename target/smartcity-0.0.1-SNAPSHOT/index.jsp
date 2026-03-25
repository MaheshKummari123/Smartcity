<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart City Platform</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

	<style>
	body {
		background-color: #f8f9fa;
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
	
	.hero {
		height: 80vh;
		background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
			url('https://images.unsplash.com/photo-1505761671935-60b3a7427bad');
		background-size: cover;
		background-position: center;
		color: white;
		padding: 120px 20px;
		text-align: center;
	}
	
	.role-card:hover, .service-card:hover {
		transform: translateY(-6px);
		transition: 0.3s;
	}
	
	.stats-section {
		background: #0d6efd;
		color: white;
		padding: 60px 0;
	}
	
	footer {
		background: #212529;
		color: white;
		padding: 40px 0;
	}
	
	.icon-box {
		width: 80px;
		height: 80px;
		background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		color: white;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 2rem;
		margin: 0 auto 20px;
	}
	</style>
</head>
<body>

	<!-- ================= NAVBAR ================= -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="btn btn-primary ms-2"
						href="register">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ================= HERO SECTION ================= -->
	<section class="hero d-flex align-items-center text-center">
		<div class="container ">
			<h1 class="display-4 fw-bold">Explore, Study, Work & Grow in
				Smart City</h1>
			<p class="lead mt-3">Your one-stop platform for tourism,
				education, business & jobs.</p>
			<div class="mt-4">
				<a href="tourist" class="btn btn-primary btn-lg me-3">Explore
					City</a> <a href="register" class="btn btn-outline-light btn-lg">Get
					Started</a>
			</div>
		</div>
	</section>

	<!-- ================= ROLE CARDS ================= -->
	<section class="container my-5">
		<h2 class="text-center mb-4">Choose Your Role</h2>

		<div class="row g-4 text-center">

			<div class="col-md-3">
				<div class="card shadow role-card p-4">
					<div class="icon-box">
						<i class="fas fa-map-marked-alt"></i>
					</div>
					<h5>Tourists</h5>
					<p>Discover places, hotels & events</p>
					<a href="login" class="btn btn-outline-primary mt-3">Explore</a>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow role-card p-4">
					<div class="icon-box">
						<i class="fas">🎓</i>
					</div>
					<h5>Students</h5>
					<p>Colleges, hostels & libraries</p>
					<a href="login" class="btn btn-outline-primary mt-3">Explore</a>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow role-card p-4">
					<div class="icon-box">
						<i class="fas ">💼</i>
					</div>
					<h5>Job Seekers</h5>
					<p>Find jobs & companies</p>
					<a href="login" class="btn btn-outline-primary mt-3">Explore</a>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow role-card p-4">
					<div class="icon-box">
						<i class="fas">🏢</i>
					</div>
					<h5>Businesses</h5>
					<p>Promote your services</p>
					<a href="login" class="btn btn-outline-primary mt-3">Explore</a>
				</div>
			</div>

		</div>
	</section>

	<!-- ================= POPULAR SERVICES ================= -->
	<section class="container my-5">
		<h2 class="text-center mb-4">Popular Services</h2>

		<div class="row g-4">

			<div class="col-md-3">
				<div class="card shadow service-card">
					<img
						src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5"
						height="180" class="card-img-top">
					<div class="card-body">
						<h6>ABC Restaurant</h6>
						<p>⭐ 4.5 | Vijayawada</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow service-card">
					<img
						src="https://images.unsplash.com/photo-1566073771259-6a8506099945"
						height="180" class="card-img-top">
					<div class="card-body">
						<h6>Grand Palace Hotel</h6>
						<p>⭐ 4.7 | City Center</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow service-card">
					<img
						src="https://images.unsplash.com/photo-1509062522246-3755977927d7"
						height="180" class="card-img-top">
					<div class="card-body">
						<h6>XYZ Engineering College</h6>
						<p>⭐ 4.3 | Hyderabad</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card shadow service-card">
					<img
						src="https://images.unsplash.com/photo-1492724441997-5dc865305da7"
						height="180" class="card-img-top">
					<div class="card-body">
						<h6>TechZone IT Solutions</h6>
						<p>⭐ 4.6 | Bangalore</p>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- ================= HOW IT WORKS ================= -->
	<section class="container my-5 text-center">
		<h2 class="mb-4">How It Works</h2>

		<div class="row g-4">

			<div class="col-md-4">
				<h3>1️⃣</h3>
				<h5>Register</h5>
				<p>Create your account in minutes</p>
			</div>

			<div class="col-md-4">
				<h3>2️⃣</h3>
				<h5>Choose Role</h5>
				<p>Select Tourist, Student, Job Seeker or Business</p>
			</div>

			<div class="col-md-4">
				<h3>3️⃣</h3>
				<h5>Access Services</h5>
				<p>Start exploring city opportunities</p>
			</div>

		</div>
	</section>

	<!-- ================= STATS SECTION ================= -->
	<section class="stats-section text-center">
		<div class="container">
			<div class="row">

				<div class="col-md-3">
					<h2>100+</h2>
					<p>Businesses</p>
				</div>

				<div class="col-md-3">
					<h2>50+</h2>
					<p>Colleges</p>
				</div>

				<div class="col-md-3">
					<h2>200+</h2>
					<p>Jobs</p>
				</div>

				<div class="col-md-3">
					<h2>1000+</h2>
					<p>Users</p>
				</div>

			</div>
		</div>
	</section>

	<!-- ================= FOOTER ================= -->
	<footer>
		<div class="container text-center">
			<p>
				<strong>Smart City Platform</strong>
			</p>
			<p>Email: smartcityplatformwebsite@gmail.com</p>
			<p>Follow us on Social Media</p>
			<p class="mt-3">© 2026 Smart City. All Rights Reserved.</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>