<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="base.jsp" />

<jsp:include page="nav.jsp" />

<!-- 
Authors: Ibraheem, Brent, Linda, Guido
Purpose: UI/UX
Date: 19/06/2019
 -->

<section class="probootstrap-cover overflow-hidden relative" style="background-image: url('images/profile3.jpg'); max-height: 450px;" data-stellar-background-ratio="0.5" id="section-home">
   <div class="overlay"></div>
     <div class="container">
       <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Your Account</h2>
          </div> 
       </div>
   	 </div>
    
</section>

<section class="probootstrap_section bg-light" id="section-contact">
	<div class="container">
		<div class="row">
        	<div class="col-md-4">
            	<div class="probootstrap-animate">
              		<div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate" style="border-radius:10px;">
                  		<img src="images/profile_img.jpg" alt="profile image" class="img-fluid" style="border-radius:10px;">
                  		<div class="media-body">
	                  		<h5 class="mb-3">Username: <small>jdoe</small> </h5>
                    		<h5 class="mb-3">Name: <small>John Doe</small> </h5>
                    		<h5 class="mb-3">Email: <small>jdoe@gmail.com</small> </h5>
                    		<h5 class="mb-3">Address: <small>112 Silicon Valley, <br> Kick Ass Software Dev. Way, <br> Calgary, Alberta</small> </h5>
                    		<h5 class="mb-3">Phone (Business): <small>403-455-6781</small></h5>
                    		<h5 class="mb-3">Phone (Home): <small>403-455-6781</small></h5>
	                  		<button class="btn btn-outline-warning btn-small btn-block">Settings</button>
                  		</div>

                	</div>
              	</div>
        	</div>
        	<div class="col-md-8">
        		<div class="probootstrap-animate" style="background:white; min-height: 600px; border-radius:10px;">
        			<h3 class="profile-bookings" style="text-align: center; font-size: 35px; padding-top: 30px;">Your Bookings</h3>
        			<hr>
        		</div>
        	</div>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp" />

<jsp:include page="jslinks.jsp" />

</body>
</html>