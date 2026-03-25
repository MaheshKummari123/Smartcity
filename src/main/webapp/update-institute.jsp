<%@ page import="com.smartcity.model.Institutions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-5">
            <%Institutions insti=(Institutions)request.getAttribute("instiById");
    			if(insti!=null){
            
            %>
                <form action="updateIstitute" method="post" class="card p-4">
                <h1 class="heading mb-4">Update Institution</h1>
                <div>
                	<input type="hidden" name="institutionId" value="<%=insti.getInstitutionId() %>">
                </div>
                <div class="mb-3">
                	<label class="form-label">Institution Name</label>
                    <input type="text" name="instiName" class="form-control" placeholder="Institution Name" value="<%=insti.getName() %>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Institution Type</label>
                   <select name="type" class="form-select">
                    <option value="school" <%=insti.getInstituitionType().equals("school")?"selected":"" %>>School</option>
                    <option value="training_center" <%=insti.getInstituitionType().equals("training_center")?"selected":"" %>>Training Center</option>
                    <option value="college" <%=insti.getInstituitionType().equals("college")?"selected":"" %>>College</option>
                    <option value="university" <%=insti.getInstituitionType().equals("university")?"selected":"" %>>University</option>
                   </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea name="address" placeholder="Adress" class="form-control" value="<%=insti.getAddress() %>"></textarea>
                </div>
                <div class="mb-3">
                	<label class="form-label">Email</label>
                    <input type="text" name="email" class="form-control" placeholder="Contact Email" value="<%=insti.getContactEmail() %>">
                </div>
                <div class="mb-3">
                	<label class="form-label">Contact Phone</label>
                    <input type="text" name="phone" class="form-control" placeholder="Contact Phone" value="<%=insti.getContactPhone() %>">
                </div>
             
                <div class="mb-3">
                	<label class="form-label">Courses Offered</label>
                    <textarea name="courseOffer" class="form-control" placeholder="Courses Offered"></textarea>
                </div>

                <div class="mb-3">
                <label class="form-label">Website</label>
                    <input type="text" name="website" class="form-control" placeholder="Website" value="<%=insti.getWebsite() %>">
                </div>
                <div class="mb-3">
                <label class="form-label">Facilities</label>
                    <input type="text" name="facilities" class="form-control" placeholder="Facilities" value="<%=insti.getFacilities() %>">
                </div>

                <button class="btn btn-primary mb-2">Update</button>
                <button class="btn btn-danger">Cancel</button>
            </form>
            <%} %>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>