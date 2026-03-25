<%@ page import="com.smartcity.model.Job" %>

<%
Job job = (Job) session.getAttribute("jobById");
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Update Job</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center">
<form class="card p-4 shadow" style="width:520px;" action="updateJob" method="post">

<h4 class="text-center mb-4">Update Job</h4>

<%
if(job != null){
%>

<input type="hidden" name="job_id" value="<%=job.getJobId()%>">

<div class="mb-3">
<label class="form-label">Company Name</label>
<input type="text" class="form-control" name="company_name" value="<%=job.getCompanyName()%>">
</div>

<div class="mb-3">
<label class="form-label">Job Title</label>
<input type="text" class="form-control" name="job_title" value="<%=job.getJobTitle()%>">
</div>

<div class="mb-3">
<label class="form-label">Job Description</label>
<textarea class="form-control" name="description"><%=job.getDescription()%></textarea>
</div>

<div class="mb-3">
<label class="form-label">Requirements</label>
<textarea class="form-control" name="requirements"><%=job.getRequirements()%></textarea>
</div>

<div class="mb-3">
<label class="form-label">Salary Range</label>
<input type="text" class="form-control" name="salary_range" value="<%=job.getSalaryRange()%>">
</div>

<div class="mb-3">
<label class="form-label">Job Type</label>
<select class="form-select" name="job_type">
<option value="full_time" <%=job.getJobType().equals("full_time")?"selected":""%>>Full Time</option>
<option value="part_time" <%=job.getJobType().equals("part_time")?"selected":""%>>Part Time</option>
<option value="internship" <%=job.getJobType().equals("internship")?"selected":""%>>Internship</option>
<option value="contract" <%=job.getJobType().equals("contract")?"selected":""%>>Contract</option>
</select>
</div>

<div class="mb-3">
<label class="form-label">Location</label>
<input type="text" class="form-control" name="location" value="<%=job.getLocation()%>">
</div>

<div class="mb-3">
<label class="form-label">Contact Email</label>
<input type="email" class="form-control" name="contact_email" value="<%=job.getContactEmail()%>">
</div>

<div class="mb-3">
<label class="form-label">Status</label>
<select class="form-select" name="status">
<option value="active" <%=job.getStatus().equals("active")?"selected":""%>>Active</option>
<option value="closed" <%=job.getStatus().equals("closed")?"selected":""%>>Closed</option>
</select>
</div>

<div class="mb-3">
<label class="form-label">Posted At</label>
<input type="text" class="form-control" value="<%=job.getPostedAt()%>" readonly>
</div>

<button type="submit" class="btn btn-primary w-100">Update Job</button>

<%
}else{
%>

<p class="text-danger text-center">Job data not found.</p>

<%
}
%>

</form>
</div>

</body>
</html>