<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.smartcity.model.Businesses,java.util.List,com.smartcity.model.Services"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart City - Business Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.hero {
    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
        url('https://images.unsplash.com/photo-1507679799987-c73779587ccf');
    background-size: cover;
    background-position: center;
    height: 80vh;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}
.card { border-radius: 15px; }
footer { background: #212529; color: white; padding: 20px 0; }
</style>
</head>
<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">Smart City - Business</a>

        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav align-items-center">

                <!-- 🔥 Business Switch -->
                <li class="nav-item me-3">
                    <form action="selectBusiness" method="post" class="d-flex">
                        <select name="business_id" class="form-select form-select-sm me-2">

                            <%
                                List<Businesses> businessesList =
                                    (List<Businesses>) session.getAttribute("business");

                                Integer selectedId =
                                    (Integer) session.getAttribute("selectedBusinessId");

                                if (businessesList != null) {
                                    for (Businesses b : businessesList) {
                            %>
                                <option value="<%=b.getBusinessId()%>"
                                    <%= (selectedId != null && selectedId == b.getBusinessId()) ? "selected" : "" %>>
                                    <%=b.getBusinessName()%>
                                </option>
                            <%
                                    }
                                }
                            %>
                        </select>

                        <button class="btn btn-outline-light btn-sm">Switch</button>
                    </form>
                </li>

                <li class="nav-item">
                    <form action="addService" method="get">
                        <button class="btn btn-success btn-sm">+ Add Service</button>
                    </form>
                </li>

                <li class="nav-item ms-2">
                    <a href="logout" class="btn btn-danger btn-sm">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ================= MESSAGE ALERT ================= -->
<div class="container mt-3">
<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>
    <div class="alert alert-success alert-dismissible fade show text-center">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<%
        session.removeAttribute("msg");
    }
%>
</div>

<!-- ================= HERO ================= -->
<section class="hero">
    <div>
        <h1 class="display-4 fw-bold">Grow Your Business in Smart City</h1>
        <p class="lead">Promote your services and expand digitally.</p>
    </div>
</section>

<!-- ================= Business ================= -->
<section class="container my-5">
    <h2 class="text-center mb-4">Your Businesses</h2>
    <div class="row">

<%
List<Businesses> businesses = (List<Businesses>) session.getAttribute("business");

if (businesses != null) {
    for (Businesses b : businesses) {
%>

        <div class="col-md-4">
            <div class="card shadow p-3">
                <div class="card-body">
                    <h5><%=b.getBusinessName()%></h5>
                    <p><%=b.getDescription()%></p>
                    <p><%=b.getRating()%> / 5</p>
                </div>
            </div>
        </div>

<%
    }
}
%>

    </div>
</section>

<!-- ================= SERVICES ================= -->


<section class="container my-5">
    <h2 class="text-center mb-4">Your Services</h2>
    <div class="row">

<%
List<Services> services = (List<Services>) session.getAttribute("services");

if (services != null) {
    for (Services service : services) {
%>

        <div class="col-md-4">
            <div class="card shadow p-3">
                <div class="card-body">

                    <div class="d-flex justify-content-between">
                        <h5><%=service.getServiceName()%></h5>

                        <span class="badge 
                            <%=service.getStatus().equalsIgnoreCase("active") ? "bg-success" : "bg-secondary"%>">
                            <%=service.getStatus()%>
                        </span>
                    </div>

                    <p><%=service.getDescription()%></p>
                    <p><strong>₹ <%=service.getPrice()%></strong></p>

                    <div class="d-flex gap-2">
                        <form action="updateService">
                            <input type="hidden" name="id" value="<%=service.getServiceId()%>">
                            <button class="btn btn-primary w-100">Edit</button>
                        </form>

                        <form action="delete">
                            <input type="hidden" name="type" value="service">
                            <input type="hidden" name="id" value="<%=service.getServiceId()%>">
                            <button class="btn btn-danger w-100">Delete</button>
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

<footer class="text-center">
    <p>© 2026 Smart City Business Portal 🚀</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>