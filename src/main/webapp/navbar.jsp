<%@ page import="com.smartcity.model.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-city"></i> Smart City
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="attractions">
                        <i class="fas fa-map-marked-alt"></i> Attractions
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="jobs">
                        <i class="fas fa-briefcase"></i> Jobs
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="institutions">
                        <i class="fas fa-graduation-cap"></i> Education
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="businesses">
                        <i class="fas fa-store"></i> Business
                    </a>
                </li>
                
                <% 
                User user = (User) session.getAttribute("user");
                if (user != null) { 
                %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                           role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user"></i> <%= user.getUsername() %>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="dashboard">Dashboard</a></li>
                            <li><a class="dropdown-item" href="profile">Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary text-white ms-2" href="register">
                            Register
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>