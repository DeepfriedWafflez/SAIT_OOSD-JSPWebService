<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<jsp:include page="base.jsp" />

<jsp:include page="nav.jsp" />

<!-- 
Authors: Ibraheem, Brent, Linda, Guido
Purpose: UI/UX
Date: 19/06/2019
 -->

<section class="probootstrap-cover overflow-hidden relative" style="background-image: url('images/login.jpg'); max-height: 450px;" data-stellar-background-ratio="0.5" id="section-home">
   <div class="overlay"></div>
     <div class="container">
       <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Login</h2>
          </div> 
       </div>
   	 </div>
    
</section>

<section class="probootstrap_section bg-light" id="section-contact">
      <div class="container">
        <div class="row">
        
          <div class="col-md-12 probootstrap-animate probootstrap-form-box probootstrap-form">
          	<div class="row">
          	<div class="col-md-6">
	            <form action="login" method="post" class="mb60" style="min-height:500px;">
	              <br>
	              <br>
	              
	              <% String nonFieldError = (String) request.getAttribute("nonFieldError");
	              
	              if (nonFieldError != null)
	              {
	            	  if (!(nonFieldError.trim().equals(""))) {
	              
	              %> 
		         	  <div class="alert alert-danger alert-dismissible fade show" role="alert">
						   <strong><%= nonFieldError  %></strong>
						   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						     <span aria-hidden="true">&times;</span>
						   </button>
					  	  </div> 
		          <%
		               }
		              }
		          %>
		          
		          <% String success = (String) request.getAttribute("success");
	              
	              if (success != null)
	              {
	            	  if (!(success.trim().equals(""))) {
	              
	            	%> 
	         	  <div class="alert alert-success alert-dismissible fade show" role="alert">
					   <strong><%= success  %></strong>
					   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					     <span aria-hidden="true">&times;</span>
					   </button>
				  	  </div> 
	            <%
	               }
	              }
	            %>	
	              
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="fname" class="sr-only">Username</label>
	                    <input type="text" class="form-control" id="fname" name="username" placeholder="Username" value="${username}">
	                    <span style="color:red;">${fieldErrorUsername}</span>
	                </div>
	              </div>
	              <br>
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="lname" class="sr-only sr-only-focusable">Password</label>
	                    <input type="password" class="form-control" id="lname" name="password" placeholder="Password" value="${password}">
	                   	<span style="color:red;">${fieldErrorPassword}</span>
	                  </div>
	              </div>
	              
	              <br>
	              <p>Don't have an account, please <a href='register'>signup</a>  </p>
	              <div class="form-group">
	                <input type="submit" class="btn btn-outline-primary btn-sm" id="submit" name="submit" value="Login">
	              </div>
	            </form>
            </div>
			<div class="col-md-6" style="align:center;">
            	<br>
	            <br>
	            <img src='images/login2.png' alt='' class="img-fluid">
            </div>
          </div>
        
        </div>
      </div>
      </div>
    </section>


<jsp:include page="footer.jsp" />

<jsp:include page="jslinks.jsp" />

</body>
</html>