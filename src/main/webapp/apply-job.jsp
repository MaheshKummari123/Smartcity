
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Apply Job | SmartCity</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .apply-card {
            max-width: 700px;
            margin: auto;
            border-radius: 15px;
        }
        .header-section {
            background: linear-gradient(135deg, #0d6efd, #6610f2);
            color: white;
            padding: 30px;
            border-radius: 15px 15px 0 0;
            text-align: center;
        }
        footer {
            background: #212529;
            color: white;
        }
    </style>
</head>
<body>

<!-- 🔹 Navbar -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <span class="navbar-brand fw-bold">SmartCity Job Portal</span>
        <a href="#" class="btn btn-danger">Logout</a>
    </div>
</nav>

<!-- 🔹 Apply Job Section -->
<div class="container my-5">
    <div class="card shadow apply-card">

        <!-- Header -->
        <div class="header-section">
            <h3>Apply for Job 💼</h3>
            <p>Fill in your details to submit application</p>
        </div>

        <!-- Form -->
        <div class="card-body p-4">

            <form action="applyJob" method="post">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="full_name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Resume Link</label>
                    <input type="url" name="resume_link" class="form-control" 
                           placeholder="Paste your Google Drive / Resume link" required>
                    <small class="text-muted">
                        Example: https://drive.google.com/your-resume
                    </small>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary px-5">
                        Submit Application
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>

<footer class="py-3 text-center">
    © 2026 SmartCity Job Portal
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
