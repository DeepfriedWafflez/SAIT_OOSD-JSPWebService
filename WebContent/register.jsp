<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="base.jsp" />

<jsp:include page="nav.jsp" />



<section class="probootstrap-cover overflow-hidden relative" style="background-image: url('images/register.jpg'); max-height: 450px;" data-stellar-background-ratio="0.5" id="section-home">
   <div class="overlay"></div>
     <div class="container">
       <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Register</h2>
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
	            <form action="#" method="post" class="mb60" style="min-height:500px;">
	              <br>
	              <br>
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="fname" class="sr-only">Email</label>
	                    <input type="email" class="form-control" id="fname" name="fname" placeholder="Email">
	                </div>
	              </div>
	              <br>
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="lname" class="sr-only sr-only-focusable">Username</label>
	                    <input type="text" class="form-control" id="lname" name="lname" placeholder="Username">
	                  </div>
	              </div>
	              <br>
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="lname" class="sr-only sr-only-focusable">Password</label>
	                    <input type="password" class="form-control" id="lname" name="lname" placeholder="Password">
	                  </div>
	              </div>
	              <br>
	              <div class="mb-3">
	                  <div class="form-group">
	                    <label for="lname" class="sr-only sr-only-focusable">Confirm Password</label>
	                    <input type="password" class="form-control" id="lname" name="lname" placeholder="Confirm Password">
	                  </div>
	              </div>
	              <br>
	              <p>Already have an account, please <a href='login.jsp'>login</a>  </p>
	              <div class="form-group">
	                <input type="submit" class="btn btn-outline-primary btn-sm" id="submit" name="submit" value="Signup">
	              </div>
	            </form>
            </div>
			<div class="col-md-6" style="align:center;">
            	<br>
	            <br>
	            <img src='images/register.png' alt='' class="img-fluid">
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