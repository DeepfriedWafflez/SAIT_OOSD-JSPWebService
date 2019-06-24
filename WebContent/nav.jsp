<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
Authors: Ibraheem, Brent, Linda, Guido
Purpose: UI/UX
Date: 19/06/2019
 -->
    
    <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
      	<!-- Travel Experts -->
        <a class="navbar-brand" href="home"><img src="images/logo3.png" alt="logo" width="50" height="50"> Travel Experts</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="packagedeals">Packages</a></li>
            <li class="nav-item dropdown">
		       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Account
		       </a>
		       <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		       	 <%
					if(session.getAttribute("customer") == null){
				 %>		
		          <a class="dropdown-item" href="login">Login</a>
		          <a class="dropdown-item" href="register">Register</a>
		         <%
		         } else {
				 %>		
				  <a class="dropdown-item" href="profile">Profile</a>
				  <!-- <a class="dropdown-item" href="bookings">Bookings</a> -->
		          <a class="dropdown-item" href="logout">logout</a>
		         <% 
					}
		          %>
		       </div>
		    </li>
          </ul>
        </div>
      </div>
    </nav>