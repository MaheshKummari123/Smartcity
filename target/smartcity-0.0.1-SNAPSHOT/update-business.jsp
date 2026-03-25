<%@ page import="com.smartcity.model.Businesses" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Business</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">

    <%
        Businesses business = (Businesses) request.getAttribute("businessById");
        if (business != null) {
    %>

    <form action="updateBusiness" method="post" class="card p-4 shadow" style="width: 500px;">
        <h4 class="text-center mb-3">Update Business</h4>

        <!-- REQUIRED -->
        <input type="hidden" name="businessId" value="<%=business.getBusinessId()%>">

        <div class="mb-2">
            <label class="form-label">Business Name</label>
            <input type="text" class="form-control" name="businessName"
                   value="<%=business.getBusinessName()%>" required>
        </div>

        <div class="mb-2">
            <label class="form-label">Category</label>
            <input type="text" class="form-control" name="category"
                   value="<%=business.getCategory()%>" required>
        </div>

        <div class="mb-2">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="desc" rows="2"><%=business.getDescription()%></textarea>
        </div>

        <div class="mb-2">
            <label class="form-label">Address</label>
            <textarea class="form-control" name="address" rows="2"><%=business.getAdress() %></textarea>
        </div>

        <div class="mb-2">
            <label class="form-label">Contact Phone</label>
            <input type="text" class="form-control" name="phone"
                   value="<%=business.getContactNumber() %>">
        </div>

        <div class="mb-2">
            <label class="form-label">Contact Email</label>
            <input type="email" class="form-control" name="email"
                   value="<%=business.getContactEmail()%>">
        </div>

        <div class="mb-2">
            <label class="form-label">Website</label>
            <input type="url" class="form-control" name="website"
                   value="<%=business.getWebsite()%>">
        </div>

        <div class="mb-2">
            <label class="form-label">Rating</label>
            <input type="number" step="0.1" class="form-control" name="rating"
                   value="<%=business.getRating()%>">
        </div>

        <!-- READ ONLY -->
        <div class="mb-3">
            <label class="form-label">Created At</label>
            <input type="text" class="form-control" value="<%=business.getCreatedAt()%>" readonly>
        </div>

        <button class="btn btn-primary w-100">Update Business</button>
    </form>

    <% } %>
</div>

</body>
</html>
