<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.smartcity.model.Event"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Event</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #eef2f3, #ffffff);
}

.card {
    border-radius: 18px;
}

.form-control, .form-select {
    border-radius: 10px;
    padding: 10px;
}

.btn {
    border-radius: 8px;
}
</style>
</head>

<body>

<div class="container py-5">
<div class="row justify-content-center">
<div class="col-lg-7">

<div class="card shadow-lg p-4">

<h3 class="text-center text-primary mb-4">Update Event</h3>

<form action="updateEvent" method="post">

<%
Event e = (Event) session.getAttribute("eventById");
if (e != null) {
%>

<input type="hidden" name="eventId" value="<%=e.getEventId()%>">

<div class="mb-3">
<label class="form-label">Event Name</label>
<input type="text" name="eventName" class="form-control"
value="<%=e.getEventName()%>" required>
</div>

<div class="mb-3">
<label>Description</label>
<textarea name="description" class="form-control" rows="3">
<%=e.getDescription()!=null ? e.getDescription() : ""%>
</textarea>
</div>

<div class="row">
<div class="col-md-6 mb-3">
<label>Event Type</label>
<select name="eventType" class="form-select">

<option value="festival" <%= "festival".equals(e.getEventType())?"selected":"" %>>Festival</option>
<option value="concert" <%= "concert".equals(e.getEventType())?"selected":"" %>>Concert</option>
<option value="sports" <%= "sports".equals(e.getEventType())?"selected":"" %>>Sports</option>
<option value="exhibition" <%= "exhibition".equals(e.getEventType())?"selected":"" %>>Exhibition</option>

</select>
</div>

<div class="col-md-6 mb-3">
<label>City</label>
<input type="text" name="city" class="form-control"
value="<%=e.getCity()%>">
</div>
</div>

<div class="mb-3">
<label>Location</label>
<input type="text" name="location" class="form-control"
value="<%=e.getLocation()%>">
</div>

<div class="row">
<div class="col-md-4 mb-3">
<label>Date</label>
<input type="date" name="eventDate" class="form-control"
value="<%=e.getEventDate()%>">
</div>

<div class="col-md-4 mb-3">
<label>Start Time</label>
<input type="time" name="startTime" class="form-control"
value="<%=e.getStartTime()%>">
</div>

<div class="col-md-4 mb-3">
<label>End Time</label>
<input type="time" name="endTime" class="form-control"
value="<%=e.getEndTime()%>">
</div>
</div>

<div class="mb-3">
<label>Organizer</label>
<input type="text" name="organizer" class="form-control"
value="<%=e.getOrganizerName()%>">
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control"
value="<%=e.getContactEmail()%>">
</div>

<div class="row">
<div class="col-md-6 mb-3">
<label>Price</label>
<input type="text" name="price" class="form-control"
value="<%=e.getTicketPrice()%>">
</div>

<div class="col-md-6 mb-3">
<label>Status</label>
<select name="status" class="form-select">

<option value="active" <%= "active".equals(e.getStatus())?"selected":"" %>>Active</option>
<option value="cancelled" <%= "cancelled".equals(e.getStatus())?"selected":"" %>>Cancelled</option>

</select>
</div>
</div>

<div class="mb-3">
<label>Image URL</label>
<input type="text" name="imageUrl" class="form-control"
value="<%=e.getImageUrl()%>">
</div>

<div class="d-flex justify-content-between">
<button type="reset" class="btn btn-secondary">Cancel</button>
<button type="submit" class="btn btn-primary">Update Event</button>
</div>

<% } %>

</form>

</div>
</div>
</div>
</div>

</body>
</html>