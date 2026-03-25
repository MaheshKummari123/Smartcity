<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.smartcity.model.Services"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #eef2f3, #ffffff);
}

.card {
	border: none;
	border-radius: 18px;
}

.form-control, .form-select {
	border-radius: 10px;
	padding: 10px;
}

.btn {
	border-radius: 8px;
	padding: 8px 20px;
}

.page-title {
	font-weight: 600;
	letter-spacing: 0.5px;
}
</style>
</head>
<body>

	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-7 col-md-9">

				<div class="card shadow-lg p-4">
					<h3 class="text-center text-primary mb-4 page-title">Update
						Service Details</h3>

					<form action="updateService" method="post">

						<%
						Services service = (Services) session.getAttribute("service");
						if (service != null) {
						%>

						<input type="hidden" name="serviceId"
							value="<%=service.getServiceId()%>">

						<div class="mb-3">
							<label class="form-label fw-semibold">Service Name</label> <input
								type="text" name="serviceName" class="form-control"
								value="<%=service.getServiceName()%>" required>
						</div>

						<div class="mb-3">
							<label class="form-label fw-semibold">Description</label>
							<textarea name="description" class="form-control" rows="3"
								required><%=service.getDescription() != null ? service.getDescription() : ""%></textarea>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-semibold">Price (₹)</label> <input
									type="number" name="price" class="form-control"
									value="<%=service.getPrice()%>" required>
							</div>

							<div class="col-md-6 mb-3">
								<label class="form-label fw-semibold">Duration (Minutes)</label>
								<input type="number" name="durationMinutes" class="form-control"
									value="<%=service.getDurationMinutes()%>" required>
							</div>
						</div>

						<div class="mb-4">
							<label class="form-label fw-semibold">Status</label> <select
								name="status" class="form-select">
								<option value="active"
									<%="active".equals(service.getStatus()) ? "selected" : ""%>>
									Active</option>
								<option value="inactive"
									<%="inactive".equals(service.getStatus()) ? "selected" : ""%>>
									Inactive</option>
							</select>
						</div>

						<div class="d-flex justify-content-between">
							<button type="reset" class="btn btn-outline-secondary">Cancel</button>
							<button type="submit" class="btn btn-primary">Update
								Service</button>
						</div>

						<%
						}
						%>
					</form>

				</div>

			</div>
		</div>
	</div>

</body>
</html>