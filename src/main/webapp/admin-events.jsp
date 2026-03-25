<%@page import="java.util.List"%>
<%@ page import="com.smartcity.model.Event"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<style>
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

<div class="container-fluid">
<div class="row">

<!-- 🔹 LEFT SIDEBAR -->
<div class="col-2 bg-dark text-white vh-100 p-3 position-fixed top-0 start-0">

<h4 class="text-center mb-4">
<i class="fa-solid fa-user-shield"></i> Admin
</h4>

<ul class="nav nav-pills flex-column gap-2">

<li class="nav-item">
<form action="admin-dashboard.jsp" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-chart-line me-2"></i> Dashboard
</button>
</form>
</li>

<li class="nav-item">
<form action="admin-user-list.jsp" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-users me-2"></i> Users
</button>
</form>
</li>

<li class="nav-item">
<form action="admin-institutions.jsp" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-building-columns me-2"></i> Institutions
</button>
</form>
</li>

<li class="nav-item">
<form action="admin-jobs.jsp" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-briefcase me-2"></i> Jobs
</button>
</form>
</li>

<!-- ✅ EVENTS MENU -->
<li class="nav-item">
<form action="admin-events.jsp" method="get">
<button type="submit" class="nav-link text-white active btn btn-link w-100 text-start">
<i class="fa-solid fa-calendar-days me-2"></i> Events
</button>
</form>
</li>

<li class="nav-item">
<form action="messages" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-envelope me-2"></i> Messages
</button>
</form>
</li>

<li class="nav-item">
<form action="admin-applications.jsp" method="get">
<button type="submit" class="nav-link text-white btn btn-link w-100 text-start">
<i class="fa-solid fa-list"></i> Applications
</button>
</form>
</li>

<li class="nav-item mt-3">
<form action="logout" method="get">
<button type="submit" class="text-white btn btn-outline-danger w-100 text-start">
<i class="fa-solid fa-right-from-bracket me-2"></i> Logout
</button>
</form>
</li>

</ul>
</div>

<!-- 🔹 RIGHT CONTENT -->
<div class="col-10 p-4" style="margin-left: 250px;">

<h1 class="text-center mb-4">Events List</h1>

<table class="table table-bordered table-striped table-hover text-center align-middle">

<thead class="table-dark">
<tr>
<th>Event Id</th>
<th>Name</th>
<th>Type</th>
<th>City</th>
<th>Date</th>
<th>Time</th>
<th>Price</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
List<Event> list = (List<Event>) session.getAttribute("eventsList");

if (list != null && !list.isEmpty()) {
for (Event e : list) {
%>

<tr>

<td><%=e.getEventId()%></td>
<td><%=e.getEventName()%></td>
<td><%=e.getEventType()%></td>
<td><%=e.getCity()%></td>
<td><%=e.getEventDate()%></td>
<td><%=e.getStartTime()%> - <%=e.getEndTime()%></td>
<td><%=e.getTicketPrice()%></td>

<td>
<span class="badge bg-success">
<%=e.getStatus()%>
</span>
</td>

<td>
<div class="d-flex gap-2">

<form action="updateEvent" method="get">
<input type="hidden" name="eventId" value="<%=e.getEventId()%>">
<button class="btn btn-primary">Update</button>
</form>

<form action="delete" method="get">
<input type="hidden" name="type" value="event">
<input type="hidden" name="id" value="<%=e.getEventId()%>">
<button class="btn btn-danger">Delete</button>
</form>

</div>
</td>

</tr>

<%
}
}
%>

</tbody>
</table>

</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>