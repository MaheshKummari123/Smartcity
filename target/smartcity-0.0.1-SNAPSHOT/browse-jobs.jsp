<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.smartcity.model.Job,java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SmartCity | Browse Jobs</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background-color:#f8f9fa;
}

.filter-box{
    background:white;
    padding:20px;
    border-radius:8px;
}

.card:hover{
    transform:translateY(-5px);
    transition:0.3s;
}
</style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">SmartCity</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="jobseeker">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="browse-jobs.jsp">Browse Jobs</a></li>
                <li class="nav-item">
                	<form action="myApplications" method="get">
                		<!-- <input type="hidden" name="role" value="jobSeeker"> -->
                		<button type="submit" class="nav-link">
                			My Applications
                		</button>
                	</form>
                </li>
                <!-- <li class="nav-item"><a class="nav-link" href="myApplications">My Applications</a></li> -->
                <li class="nav-item">
                	<form action="profile" method="get">
                		<input type="hidden" name="role" value="jobSeeker">
                		<button type="submit" class="nav-link">
                			Profile
                		</button>
                	</form>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-danger text-white ms-2" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Heading -->

<div class="container my-4">
<h2 class="fw-bold">Browse Jobs</h2>
<p class="text-muted">Find jobs and internships near you</p>
</div>


<!-- Filters -->

<div class="container mb-4">
<div class="filter-box shadow-sm">

<form action="searchJob" method="get">

<div class="row g-3 align-items-end">

<div class="col-md-2">
<label class="form-label">Job Type</label>
<select class="form-select" name="jobType">
<option value="">All</option>
<option value="full_time">Full Time</option>
<option value="part_time">Part Time</option>
<option value="internship">Internship</option>
<option value="contract">Contract</option>
</select>
</div>

<div class="col-md-2">
<label class="form-label">Experience</label>
<select class="form-select" name="experience">
<option value="">Any</option>
<option value="Fresher">Fresher</option>
<option value="1-3 Years">1-3 Years</option>
<option value="3-5 Years">3-5 Years</option>
</select>
</div>

<div class="col-md-2">
<label class="form-label">Skill</label>
<select class="form-select" name="skill">
<option value="">Any Skill</option>
<option value="Java">Java</option>
<option value="Python">Python</option>
<option value="Spring Boot">Spring Boot</option>
<option value="SQL">SQL</option>
<option value="React">React</option>
</select>
</div>

<div class="col-md-3">
<label class="form-label">Location</label>
<input type="text" class="form-control" name="location" placeholder="City or Area">
</div>

<div class="col-md-3 d-flex">
<button class="btn btn-primary w-100">
🔍 Search Jobs
</button>
</div>

</div>

</form>

</div>
</div>


<!-- Job Cards -->

<div class="container">

<div class="row g-4">

<%
List<Job> jobsList = (List<Job>)session.getAttribute("allJobs");

if(jobsList != null){

for(Job job : jobsList){
%>

<div class="col-md-4">

<div class="card shadow-sm h-100">

<div class="card-body">

<!-- Job Title + Job Type Row -->
<div class="d-flex justify-content-between align-items-center mb-2">

<h5 class="card-title mb-0"><%=job.getJobTitle()%></h5>

<%
String type = job.getJobType();

if(type.equals("full_time")){
%>
<span class="badge bg-success">Full Time</span>
<%
}else if(type.equals("internship")){
%>
<span class="badge bg-warning text-dark">Internship</span>
<%
}else if(type.equals("part_time")){
%>
<span class="badge bg-info text-dark">Part Time</span>
<%
}else{
%>
<span class="badge bg-secondary"><%=type.replace("_"," ")%></span>
<%
}
%>

</div>

<p class="text-muted">
🏢 <%=job.getCompanyName()%>
</p>

<p>
📍 <%=job.getLocation()%>
</p>

<p>
💰 <%=job.getSalaryRange()%>
</p>

<p>
🎯 Experience: <%=job.getExperience()%>
</p>

<div class="d-flex gap-2">

<a href="viewJob?id=<%=job.getJobId()%>" class="btn btn-outline-primary w-50">
View
</a>

<a href="applyJob?id=<%=job.getJobId()%>" class="btn btn-primary w-50">
Apply
</a>

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


<!-- Footer -->

<footer class="bg-dark text-white text-center py-3 mt-5">
© 2026 SmartCity Application
</footer>

</body>
</html>