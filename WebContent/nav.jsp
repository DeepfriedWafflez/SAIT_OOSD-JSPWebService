<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      	<!-- Travel Experts -->
        <a class="navbar-brand" href="home.jsp"><img src="images/logo3.png" alt="logo" width="50" height="50"> Travel Experts</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link" href="home.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="packages.jsp">Packages</a></li>
            <!-- <li class="nav-item"><a class="nav-link" href="services.html">Agents</a></li> -->
<!--             <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li> -->
            <li class="nav-item dropdown">
		       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Account
		       </a>
		       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="login.jsp">Login</a>
		          <a class="dropdown-item" href="register.jsp">Register</a>
		          <a class="dropdown-item" href="profile.jsp">Profile</a>
		          <a class="dropdown-item" href="bookings.jsp">Bookings</a>
<!-- 		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="#">Something else here</a> -->
		       </div>
		    </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->