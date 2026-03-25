<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #eef2f3, #ffffff);
        }
        .card {
            border-radius: 18px;
            border: none;
        }
        .form-control, .form-select {
            border-radius: 10px;
        }
        .btn {
            border-radius: 8px;
            padding: 8px 20px;
        }
        .section-title {
            font-weight: 600;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<div class="container py-5">

    <h2 class="text-center mb-5 text-primary"></h2>

    <div class="row g-4 justify-content-center">

        <!-- ================= ADD SERVICE FORM ================= -->
        <div class="col-lg-6">
            <div class="card shadow-lg p-4">
                <h4 class="mb-4 text-success section-title">Add New Service</h4>

                <form action="addService" method="post">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Service Name</label>
                        <input type="text" class="form-control" placeholder="Enter service name" required name="service_name">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea class="form-control" rows="3" placeholder="Enter service description" required name="description"></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Price (₹)</label>
                            <input type="number" class="form-control" placeholder="Enter price" required name="price">
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Duration (Minutes)</label>
                            <input type="number" class="form-control" placeholder="Enter duration" required name="duration">
                        </div>
                    </div>

                    <div class="mb-4">
					    <label class="form-label fw-semibold">Status</label>
					    <select name="status" class="form-select">
					        <option value="active" selected>Active</option>
					        <option value="inactive">Inactive</option>
					    </select>
					</div>

                    <button type="submit" class="btn btn-success w-100">
                        Add Service
                    </button>

                </form>
            </div>
        </div>

</div>
        <!-- ================= UPDATE SERVICE FORM ================= -->
        
</div>

</body>
</html>