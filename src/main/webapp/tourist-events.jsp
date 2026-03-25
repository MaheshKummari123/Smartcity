<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.smartcity.model.Event,java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>SmartCity | Events</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#f8f9fa;}
.filter-box{background:white;padding:20px;border-radius:10px;}
.card:hover{transform:translateY(-5px);transition:0.3s;}
.event-img {
    height: 200px;          /* fixed height */
    width: 100%;            /* full width */
    object-fit: cover;      /* crop image nicely */
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
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

<!-- Navbar -->
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
                <li class="nav-item"><a class="nav-link" href="tourist">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="tourist-attractions.jsp">Attractions</a></li>
                <li class="nav-item"><a class="nav-link" href="tourist-hotels.jsp">Hotels</a></li>
                <li class="nav-item"><a class="nav-link active" href="events">Events</a></li>
                <li class="nav-item"><a class="nav-link btn btn-danger text-white ms-2" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Heading -->
<div class="container my-4">
<h2>🎉 Events</h2>
</div>

<!-- Filters -->
<div class="container mb-4">
<div class="filter-box shadow-sm">

<form action="searchEvent" method="get">

<div class="row g-3">

<div class="col-md-4">
<select class="form-select" name="eventType">
<option value="">All Types</option>
<option value="festival">Festival</option>
<option value="concert">Concert</option>
<option value="sports">Sports</option>
</select>
</div>

<div class="col-md-4">
<input type="text" class="form-control" name="city" placeholder="City">
</div>

<div class="col-md-4">
<button class="btn btn-primary w-100">Search</button>
</div>

</div>

</form>

</div>
</div>

<!-- Events -->
<div class="container">
<div class="row g-4">

<%
List<Event> list = (List<Event>) request.getAttribute("eventsList");

if(list != null){
for(Event e : list){
%>

<div class="col-md-4">

<div class="card shadow-sm h-100">

<img src="<%= e.getImageUrl()!=null ? e.getImageUrl() : "https://source.unsplash.com/400x250/?event" %>"
     class="card-img-top event-img">

<div class="card-body">

<!-- Title + Type -->
<div class="d-flex justify-content-between mb-2">

<h5><%=e.getEventName()%></h5>

<span class="badge bg-success">
<%=e.getEventType()%>
</span>

</div>

<p>📅 <%=e.getEventDate()%></p>
<p>📍 <%=e.getCity()%></p>

<p><%=e.getDescription()%></p>

<p>💰 <%=e.getTicketPrice()%></p>

<div class="d-flex gap-2">
<button class="btn btn-outline-primary w-50">View</button>
<button class="btn btn-primary w-50">Book</button>
</div>

</div>
</div>
</div>

<%
}
}
%>

</div>
</div>

</body>
</html>