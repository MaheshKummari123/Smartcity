<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart City | About Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.hero {
    background: linear-gradient(135deg,#0d6efd,#0a58ca);
    color: white;
    padding: 80px 20px;
    text-align: center;
}
.section-padding {
    padding: 60px 0;
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">Smart City</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="btn btn-primary ms-2"
						href="register">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>

<!-- Hero -->
<section class="hero">
<h1>About Smart City</h1>
<p>Connecting People, Businesses & Opportunities</p>
</section>

<!-- About Content -->
<section class="section-padding">
<div class="container">
<div class="row align-items-center">

<div class="col-md-6">
<h3>Our Mission</h3>
<p>
Smart City is a unified digital platform designed to simplify urban life. 
We connect tourists, students, job seekers and businesses under one system 
to make city services accessible and efficient.
</p>

<h3 class="mt-4">Our Vision</h3>
<p>
To build a smart, connected, and opportunity-driven city ecosystem 
where everyone can explore, grow, and succeed.
</p>
</div>

<div class="col-md-6">
<img src="https://images.unsplash.com/photo-1492724441997-5dc865305da7"
     class="img-fluid rounded shadow">
</div>

</div>
</div>
</section>

<footer class="bg-dark text-white text-center py-3">
© 2026 Smart City Platform
</footer>

</body>
</html>