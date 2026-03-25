<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Smart City | Contact Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.hero {
	background: linear-gradient(135deg, #6610f2, #4c0ed8);
	color: white;
	padding: 80px 20px;
	text-align: center;
}

img {
	height: 350px;
	width: 635px;
	background-size: cover;
}
</style>
</head>

<body>

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
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="btn btn-primary ms-2"
						href="register">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- <section class="hero">
<h1>Contact Us</h1>
<p>We’d love to hear from you</p>
</section> -->



	<div class="container my-5">

		<%
		String successMsg = (String) session.getAttribute("msg");
		if (successMsg != null) {
		%>
		<div id="msgAlert" class="alert alert-success text-center w-50 mt-3">
			<p class="text-success"><%=successMsg%></p>
		</div>
		<%
		session.removeAttribute("msg");
		}
		%>

		<div class="row">

			<div class="col-md-6">
				<img
					src="https://images.pexels.com/photos/326576/pexels-photo-326576.jpeg">
				<div class="mt-4">

					<div class="border p-3 rounded">
						<!-- Email -->
						<div class="d-flex align-items-center mb-3">
							<div
								class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center"
								style="height: 50px; width: 50px;">
								<i class="fa-regular fa-envelope"></i>
							</div>

							<div class="ms-3">
								<strong>Email</strong>
								<p class="mb-0 text-muted">support@smartcity.com</p>
							</div>
						</div>

						<!-- Phone -->
						<div class="d-flex align-items-center mb-3">
							<div
								class="bg-success text-white rounded-circle d-flex align-items-center justify-content-center"
								style="height: 50px; width: 50px;">
								<i class="fa-solid fa-phone"></i>
							</div>

							<div class="ms-3">
								<strong>Phone</strong>
								<p class="mb-0 text-muted">+91 9876543210</p>
							</div>
						</div>

						<!-- Address -->
						<div class="d-flex align-items-center">
							<div
								class="bg-danger text-white rounded-circle d-flex align-items-center justify-content-center"
								style="height: 50px; width: 50px;">
								<i class="fa-solid fa-location-dot"></i>
							</div>

							<div class="ms-3">
								<strong>Address</strong>
								<p class="mb-0 text-muted">Vijayawada, Andhra Pradesh</p>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="col-md-6 border p-3 rounded d-flex flex-column">
				<h2 class="mb-4">Get In Touch</h2>
				<p class="text-secondary mb-4">Our Friendly Team would love to
					hear from you</p>
				<form class="d-flex flex-column flex-grow-1" action="contact"
					method="post">
					<div class="mb-4">
						<input type="text" class="form-control" placeholder="Your Name"
							name="name">
					</div>

					<div class="mb-4">
						<input type="email" class="form-control" placeholder="Your Email"
							name="email">
					</div>

					<div class="mb-4">
						<input type="number" class="form-control" placeholder="Your Phone"
							name="phone">
					</div>

					<div class="mb-5">
						<textarea class="form-control" rows="6" placeholder="Your Message"
							name="msg"></textarea>
					</div>

					<button class="btn btn-primary w-100 mt-auto" type="submit">Send
						Message</button>
				</form>
			</div>

		</div>
	</div>

	<footer class="bg-dark text-white text-center py-3"> © 2026
		Smart City Platform </footer>
	<script>
		setTimeout(function() {
			let msg = document.getElementById("msgAlert");
			if (msg) {
				msg.classList.add("fade");
				msg.classList.remove("show");
				setTimeout(function() {
					msg.remove();
				}, 500);
			}
		}, 2500);
	</script>
</body>

</html>