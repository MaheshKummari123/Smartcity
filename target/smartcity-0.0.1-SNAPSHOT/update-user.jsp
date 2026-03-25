<%@ page import="com.smartcity.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container vh-100 d-flex justify-content-center align-items-center">
    <form class="card p-4 shadow" style="width: 420px;" action="updateUser" method="post">

        <h4 class="text-center mb-4">Update User (Admin)</h4>
        
        <%User user =(User)request.getAttribute("userById"); 
        	if(user!=null){
        
        %>

        <!-- hidden -->
        <input type="hidden" name="user_id" value="<%=user.getUserId() %>">

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" value="<%=user.getUsername()  %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="<%=user.getEmail()  %>">
        </div>

        <div class="mb-3">
            <label class="form-label">User Type</label>
            <select class="form-select" name="user_type">
                <option value="tourist" <%=user.getUserType().equals("tourist")?"selected":"" %>>Tourist</option>
                <option value="student" <%=user.getUserType().equals("student")?"selected":"" %>>Student</option>
                <option value="admin" <%=user.getUserType().equals("admin")?"selected":"" %>>Admin</option>
                <option value="job_seeker" <%=user.getUserType().equals("job_seeker")?"selected":"" %>>Job Seeker</option>
                <option value="business" <%=user.getUserType().equals("business")?"selected":"" %>>Business</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="full_name" value="<%=user.getFullName() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" value="<%=user.getPhone() %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Reset Password</label>
            <input type="password" class="form-control" name="password" placeholder="Enter new Password">
        </div>

        <div class="mb-3">
            <label class="form-label">Created At</label>
            <input type="text" class="form-control" name="created_at" readonly>
        </div>

        <button class="btn btn-danger w-100" type="submit">Update User</button>
	<%} %>
    </form>
</div>

</body>
</html>
