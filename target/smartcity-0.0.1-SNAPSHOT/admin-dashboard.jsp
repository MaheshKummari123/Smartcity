
<%@ page
	import="com.smartcity.model.Job,
					com.smartcity.dao.JobDAO,
						java.util.List,
							com.smartcity.model.Institutions,
								com.smartcity.model.Businesses,
									com.smartcity.model.User,
										com.smartcity.model.JobApplication,
											com.smartcity.model.Event"%>

<!DOCTYPE html>
<html lang="en">

<head>

<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	rel="stylesheet">
	
	<style>
		img{
			height:200px !important	;
			width:300px;
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

	<div class="container-fluid">
		<div class="row">


			<!-- 🔹 LEFT SIDEBAR -->
			<div
				class="col-2 bg-dark text-white vh-100 p-3 position-fixed top-0 start-0">
				<h4 class="text-center mb-4">
					<i class="fa-solid fa-user-shield"></i> Admin
				</h4>

				<ul class="nav nav-pills flex-column gap-2">
					<li class="nav-item">
						<form action="#" method="get"></form>
						<button type="submit"
							class="nav-link text-white active btn btn-link w-100 text-start">
							<i class="fa-solid fa-chart-line me-2"></i> Dashboard
						</button>

					</li>

					<li class="nav-item">
						<form action="admin-user-list.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-users me-2"></i> Users
							</button>
						</form>
					</li>

					<li class="nav-item">

						<form action="admin-institutions.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-building-columns me-2"></i> Institutions
							</button>
						</form>

					</li>

					<li class="nav-item">
						<form action="admin-jobs.jsp" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-briefcase me-2"></i> Jobs
							</button>
						</form>
					</li>
					
					<li class="nav-item">
					    <form action="admin-events.jsp" method="get">
					        <button type="submit"
					            class="nav-link text-white btn btn-link w-100 text-start">
					            <i class="fa-solid fa-calendar-days me-2"></i> Events
					        </button>
					    </form>
					</li>

					<li class="nav-item">
						<form action="messages" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-envelope me-2"></i> Messages
							</button>
						</form>
					</li>

					<li class="nav-item">
						<form action="application" method="get">
							<button type="submit"
								class="nav-link text-white btn btn-link w-100 text-start">
								<i class="fa-solid fa-list"></i> Applications
							</button>
						</form>
					</li>

					<li class="nav-item mt-3">
						<form action="logout" method="get">
							<button type="submit"
								class="text-white btn btn-outline-danger w-100 text-start">
								<i class="fa-solid fa-right-from-bracket me-2"></i> Logout
							</button>
						</form>

					</li>
				</ul>
			</div>

			<!-- 🔹 RIGHT CONTENT AREA -->
			<div class="col-10 p-4" style="margin-left: 250px;">
				<%
String success = (String) session.getAttribute("success");
String error = (String) session.getAttribute("error");

if (success != null) {
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= success %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<%
    session.removeAttribute("success");  // 🔥 VERY IMPORTANT
}

if (error != null) {
%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<%
    session.removeAttribute("error");  // 🔥 VERY IMPORTANT
}
%>


				<h2>
					Welcome Admin <i class="fa-solid fa-user-tie"></i>
				</h2>
				<p>Select an option from the left menu to manage the system.</p>
				<div class="row">
					<div class=" gap-3">
						<!-- Count of each data -->
						<div class="d-flex mb-4">
							<div class="card h-100">
								<div class="card-header">
									<img
										src="https://plus.unsplash.com/premium_photo-1738980401922-70995a1b6ade?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fHVzZXJzJTIwcHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D"
										class="img-fluid">
								</div>
								<div class="card-body">
									<h2>Total Users</h2>
									<%
									Integer usersCountObj = (Integer) session.getAttribute("usersCount");
									int usersCount = (usersCountObj != null) ? usersCountObj : 0;
									%>
									<h4><%=usersCount%></h4>
								</div>
							</div>
							<div class="card h-100">
								<div class="card-header">
									<img
										src="https://images.unsplash.com/photo-1610637988384-3154e5644f4b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGJ1aWxkaW5nc3xlbnwwfHwwfHx8MA%3D%3D"
										class="img-fluid">
								</div>
								<div class="card-body">
									<h2>Total Institutions</h2>
									<%
									Integer instiObj = (Integer) session.getAttribute("instiCount");
									int instiCount = (instiObj != null) ? instiObj : 0;
									%>
									<h4><%=instiCount%></h4>
								</div>
							</div>
							<div class="card h-100">
								<div class="card-header">
									<img
										src="https://media.istockphoto.com/id/2193065392/photo/young-business-professionals-collaborating-in-a-modern-meeting-room.webp?a=1&b=1&s=612x612&w=0&k=20&c=Y_bBV3QOniNMQ2WGLu0FwymTEqs_4Yiw6v0mWfFPYiY="
										class="img-fluid">
								</div>
								<div class="card-body">
									<h2>Total Businesses</h2>
									<%
									Integer busiObj = (Integer) session.getAttribute("busiCount");
									int busiCount = (busiObj != null) ? busiObj : 0;
									%>
									<h4><%=busiCount%></h4>

								</div>
							</div>
							<div class="card h-100">
							    <div class="card-header">
							        <img src="https://images.unsplash.com/photo-1501281668745-f7f57925c3b4"
							             class="img-fluid">
							    </div>
							    <div class="card-body">
							        <h2>Total Events</h2>
							        <%
							        Integer eventObj = (Integer) session.getAttribute("eventsCount");
							        int eventCount = (eventObj != null) ? eventObj : 0;
							        %>
							        <h4><%=eventCount%></h4>
							    </div>
							</div>
						</div>

						<div class="card mb-5">

							<nav
								class="nacbar bg-dark text-white p-2 d-flex justify-content-between rounded">
								<h4>Recent Registered users</h4>
								<a href="add-user.jsp" class="btn btn-primary w-25">Add User
									<i class="fa-solid fa-plus"></i>
								</a>
							</nav>
							<table
								class="table table-bordered table-striped table-hover text-center align-middle">
								<thead class="table-secondary">
									<tr>
										<th>User Id</th>
										<th>Username</th>
										<th>Full Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>User Type</th>
										<th>Craeted At</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody class="text-center bg-white">
									<%
									List<User> userList = (List<User>) session.getAttribute("lastUsers");
									if (userList != null) {
										for (User user : userList) {
									%>
									<tr>
										<td><%=user.getUserId()%></td>
										<td><%=user.getUsername()%></td>
										<td><%=user.getFullName()%></td>

										<td><%=user.getEmail()%></td>
										<td><%=user.getPhone()%></td>
										<td><%=user.getUserType()%></td>
										<td><%=user.getCreatedAt()%></td>
										<td>
											<div class="d-flex gap-2">
												<form action="updateUser" method="get">
												<input type="hidden" name="user_id"
													value="<%=user.getUserId()%>">
												<button type="submit" class="btn btn-primary">
													Update</button>
											</form>
											<form action="delete" method="get">
												<input type="hidden" name="type" value="user"> <input
													type="hidden" name="id" value="<%=user.getUserId()%>">
												<button class="btn btn-danger" type="submit" >Delete</button>
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

						<!-- Recent Added Institutions -->
						<div class="card mb-5">

							<nav
								class="nacbar bg-d text-dark p-2 d-flex justify-content-between rounded">
								<h4>Recent Registered Institutions</h4>
								<a href="add-institute.jsp" class="btn btn-success w-25">Add
									Institute <i class="fa-solid fa-plus"></i>
								</a>
							</nav>
							<table
								class="table table-bordered table-striped table-hover text-center align-middle">
								<thead class="table-secondary">
									<tr>
										<th>Institution Id</th>
										<th>Institute Name</th>
										<th>Location</th>
										<th>Institution Type</th>

										<th>Contact Email</th>
										<th>Created At</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody class="text-center bg-white">
									<%
									List<Institutions> instiList = (List<Institutions>) session.getAttribute("lastInsti");
									if (instiList != null) {
										for (Institutions insti : instiList) {
									%>
									<tr>
										<td><%=insti.getInstitutionId()%></td>
										<td><%=insti.getName()%></td>
										<td><%=insti.getAddress()%></td>

										<td><%=insti.getInstituitionType()%></td>
										<td><%=insti.getContactEmail()%></td>
										<td><%=insti.getCreatedAt()%></td>
										<td>
											<div class="d-flex gap-2">
												<form action="updateIstitute" method="get">
												<input type="hidden" name="institutionId"
													value="<%=insti.getInstitutionId()%>">
												<button class="btn btn-primary" type="submit">Update</button>
											</form>
											<form action="delete" method="get">
												<input type="hidden" name="type" value="institution">
												<input type="hidden" name="id"
													value="<%=insti.getInstitutionId()%>">
												<button class="btn btn-danger" type="submit">Delete</button>
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
					<!-- Recent Added Jobs -->
					<div class="card mb-5">

						<nav
							class="navbar  text-dark p-2 mb-2 d-flex justify-content-between rounded ">
							<h4>Recently added Jobs</h4>
							<a href="add-job.jsp" class="btn btn-primary w-25">Add Job <i
								class="fa-solid fa-plus"></i></a>
						</nav>
						<table
							class="table table-bordered table-striped table-hover text-center align-middle">
							<thead class="table-secondary">
								<tr>
									<th>Job Id</th>
									<th>Company name</th>
									<th>Job Title</th>
									<th>Salary Range</th>
									<th>Job Status</th>

									<th>Posted At</th>
									<th>Action</th>
								</tr>
							</thead>

							<tbody class="text-center bg-white">
								<%
								List<Job> jobList = (List<Job>) session.getAttribute("lastJobs");
								if (jobList != null) {

									for (Job job : jobList) {
								%>
								<tr>
									<td><%=job.getJobId()%></td>
									<td><%=job.getCompanyName()%></td>
									<td><%=job.getJobTitle()%></td>

									<td><%=job.getSalaryRange()%></td>
									<td class="text-success"><%=job.getStatus()%></td>
									<td><%=job.getPostedAt()%></td>
									<td>
										<div class="d-flex gap-2">
									<form action="updateJob" method="get">
										<input type="hidden" name="jobId" value="<%=job.getJobId()%>">
										<button class="btn btn-primary" type="submit">Update</button>
									</form>
									<form action="delete" method="get">
										<input type="hidden" name="type" value="job"> <input
										type="hidden" name="id" value="<%=job.getJobId()%>">
										<button class="btn btn-danger" type="submit">Delete</button>
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
					<!-- Recent Added Businesses -->
					<div class="card mb-5">

						<nav
							class="nacbar p-2 mb-2 d-flex justify-content-between rounded">
							<h4>Recently Added Businesses</h4>
							<a href="add-business.jsp" class="btn btn-primary w-25">Add
								Business <i class="fa-solid fa-plus"></i>
							</a>
						</nav>
						<table
							class="table table-bordered table-striped table-hover text-center align-middle">
							<thead class="table-secondary">
								<tr>
									<th>Business Id</th>
									<th>Business name</th>
									<th>Category</th>
									<th>Contact Phone</th>
									<th>Email</th>
									<th>Created At</th>
									<th>Action</th>
								</tr>

							</thead>

							<tbody class="text-center bg-white">
								<%
								List<Businesses> busiList = (List<Businesses>) session.getAttribute("lastBusi");
								if (busiList != null) {
									for (Businesses busi : busiList) {
								%>
								<tr>
									<td><%=busi.getBusinessId()%></td>
									<td><%=busi.getBusinessName()%></td>
									<td><%=busi.getCategory()%></td>

									<td><%=busi.getContactNumber()%></td>
									<td><%=busi.getContactEmail()%></td>
									<td><%=busi.getCreatedAt()%></td>
									<td>
										<div class="d-flex gap-2">
											<form action="updateBusiness" method="get">
											<input type="hidden" name="businessId"
												value="<%=busi.getBusinessId()%>">
											<button type="submit" class="btn btn-primary">Update</button>
										</form>
										<form action="delete" method="get">
											<input type="hidden" name="type" value="business"> <input
												type="hidden" name="id" value="<%=busi.getBusinessId()%>">
											<button class="btn btn-danger" type="submit">Delete</button>
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
					
					<!-- Recent Added Events -->
					
					<!-- 🔹 Recent Added Events -->
					<div class="card mb-5">
					
					    <nav class="navbar text-dark p-2 mb-2 d-flex justify-content-between rounded">
					        <h4>Recently Added Events</h4>
					        <a href="add-event.jsp" class="btn btn-success w-25">
					            Add Event <i class="fa-solid fa-plus"></i>
					        </a>
					    </nav>
					
					    <table class="table table-bordered table-striped table-hover text-center align-middle">
					        <thead class="table-secondary">
					            <tr>
					                <th>Event Id</th>
					                <th>Event Name</th>
					                <th>Type</th>
					                <th>City</th>
					                <th>Date</th>
					                <th>Status</th>
					                <th>Action</th>
					            </tr>
					        </thead>
					
					        <tbody class="text-center bg-white">
					            <%
					            List<Event> eventList = (List<Event>) session.getAttribute("lastEvents");
					            if (eventList != null) {
					                for (Event e : eventList) {
					            %>
					
					            <tr>
					                <td><%=e.getEventId()%></td>
					                <td><%=e.getEventName()%></td>
					                <td><%=e.getEventType()%></td>
					                <td><%=e.getCity()%></td>
					                <td><%=e.getEventDate()%></td>
					                <td class="text-success"><%=e.getStatus()%></td>
					
					                <td>
					                    <div class="d-flex gap-2">
					
					                        <!-- Update -->
					                        <form action="updateEvent" method="get">
					                            <input type="hidden" name="eventId" value="<%=e.getEventId()%>">
					                            <button class="btn btn-primary" type="submit">Update</button>
					                        </form>
					
					                        <!-- Delete -->
					                        <form action="delete" method="get">
					                            <input type="hidden" name="type" value="event">
					                            <input type="hidden" name="id" value="<%=e.getEventId()%>">
					                            <button class="btn btn-danger" type="submit">Delete</button>
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

					<!-- Recent Added data -->
					<div class="card mb-5">

							<nav
								class="nacbar bg-dark text-white p-2 d-flex justify-content-between rounded">
								<h4>Recent Applications</h4>
								
							</nav>
							<table
								class="table table-bordered table-striped table-hover text-center align-middle">
								<thead class="table-secondary">
									<tr>
										<th>Application ID</th>
                                    	<th>Job Title</th>
                                    	<th>Applicant</th>
                                    	<th>Email</th>
                                    	<th>Phone</th>
                                    	<th>Status</th>
                                    	
                                    	<th>Action</th>
									</tr>
								</thead>

								<tbody class="text-center">
                                <% List<JobApplication> apps =
                                    (List<JobApplication>) session.getAttribute("allApplications");
                                        if(apps !=null){ 
                                        	for(JobApplication app : apps){ 
                                        %>

                                            <tr>
                                                <td>
                                                    <%=app.getApplicationId() %>
                                                </td>
                                                <td>
                                                    <%=app.getJobTitle() %>
                                                </td>
                                                <td>
                                                    <%=app.getFullName() %>
                                                </td>
                                                <td>
                                                    <%=app.getEmail() %>
                                                </td>
                                                <td>
                                                    <%=app.getPhone() %>
                                                </td>
                                                <td>
                                                    <span class="badge bg-info">
                                                        <%=app.getStatus()%>
                                                    </span>
                                                </td>
                                            	
                                                <td>
                                                    <div class="d-flex gap-2">
                                                    	<form action="updateApplication" method="post">
                                                        <input type="hidden" name="applicationId"
                                                            value="<%=app.getApplicationId()%>">

                                                        <select name="status" class="form-select mb-2">
                                                            <option value="selected" <%=app.getStatus().equals("selected")?"selected":"" %>>Selected </option>
                                                            <option value="applied" <%=app.getStatus().equals("applied")?"selected":"" %>>Applied </option>
                                                            <option value="rejected" <%=app.getStatus().equals("rejected")?"selected":"" %>>Rejected </option>
                                                            <option value="shortlisted" <%=app.getStatus().equals("shortlisted")?"selected":"" %>>Shortlisted </option>
                                                            <option value="interview scheduled" <%=app.getStatus().equals("interview scheduled")?"selected":"" %>>Interview Scheduled </option>
                                                            <option value="on hold" <%=app.getStatus().equals("on hold")?"selected":"" %>>On Hold </option>
                                                        </select>

                                                        <button class="btn btn-primary mb-2" type="submit">
                                                            Update
                                                        </button>
                                                    </form>
                                                    <form action="delete" method="get">
                                                    	<input type="hidden" name="id"
                                                            value="<%=app.getApplicationId()%>">
                                                            <input type="hidden" name="type"
                                                            value="jobApplication">
                                                        <button class="btn btn-danger" type="submit">Delete</button>
                                                    </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } } %>
                            </tbody>
								
							</table>
						</div>
					
				</div>
			</div>
			<!-- Future content goes here -->
		</div>

	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>