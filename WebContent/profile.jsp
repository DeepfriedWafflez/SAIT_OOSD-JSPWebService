<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession, entity.Customer"%>

<%
	
	if(session.getAttribute("customer") != null){
		Customer customerSess = (Customer) session.getAttribute("customer");		
	} else {
		response.sendRedirect("login.jsp");
	}
	
%>
    
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
            <%
			if(session.getAttribute("customer") != null) {
				Customer customerSess = (Customer) session.getAttribute("customer");	
			%>
            <p class="lead mb-5 text-uppercase probootstrap-animate">Welcome <%= customerSess.getCustUsername() %> </p>
            <% 
			}
            %>
          </div> 
       </div>
   	 </div>
    
</section>

<section class="probootstrap_section bg-light" id="section-contact">
	<div class="container">
		<div class="row">
		<%
			if(session.getAttribute("customer") != null) {
				Customer customerSess = (Customer) session.getAttribute("customer");	
		%>
        	<div class="col-md-4">
            	<div class="probootstrap-animate">
              		<div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate" style="border-radius:10px;">
                  		<img src="images/profile_img.jpg" alt="profile image" class="img-fluid" style="border-radius:10px;">
                  		<div class="media-body">
	                  		<h5 class="mb-3">Username: <small><%= customerSess.getCustUsername() %></small> </h5>
                    		<h5 class="mb-3">Name: <small><%= customerSess.getCustFirstName() + " " + customerSess.getCustLastName() %></small> </h5>
                    		<h5 class="mb-3">Email: <small><%= customerSess.getCustEmail() %></small> </h5>
                    		<h5 class="mb-3">Address: <br><small><%= customerSess.getCustAddress() %></small> </h5>
                    		<h5 class="mb-3">Phone (Business): <small><%= customerSess.getCustBusPhone() %></small> </h5>
                    		<h5 class="mb-3">Phone (Home): <small><%= customerSess.getCustHomePhone() %></small> </h5>
	                  		<!-- <button class="btn btn-outline-warning btn-small btn-block">Settings</button> -->
	                  		
	                  		 <!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-warning btn-small btn-block" data-toggle="modal" data-target="#exampleModalCenter">
							  Settings
							</button>
                  		</div>
                	</div>
              	</div>
        	</div>
        	<div class="col-md-8">
        		<div class="probootstrap-animate" style="background:white; min-height: 600px; border-radius:10px;">
        			<h3 class="profile-bookings" style="text-align: center; font-size: 35px; padding-top: 30px;">Your Bookings</h3>
        			<hr>
        			<div id="booked">
        				 <table class="table table-borderless table-hover">
							  <thead>
							    <tr>
							      <th scope="col">Number</th>
							      <th scope="col">Date</th>
							      <th scope="col">Package</th>
							      <th scope="col">Travelers</th>
							      <th scope="col">Trip type</th>
							      <th></th>
							    </tr>
							  </thead>
							  <tbody>
								  <tr v-for="booking in bookings">
								     <td scope="row">{{booking.bookingNo}}</td>
								     <td>{{booking.bookingDate}}</td>
								     <td>package</td>
								     <td>{{booking.travelerCount}}</td>
								     <td>{{booking.tripTypeId}}</td>
								     <td><button class="btn-outline-success btn-small">Detail</button></td>    
								  </tr>
							  </tbody>
						 </table>		
        			</div>
        		</div>
        	</div>        	
			
					
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Account Settings</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
					<div class="col-md-12 probootstrap-animate probootstrap-form-box probootstrap-form">
			          	<div class="row">
							<form action="" method="post" class="mb60" style="min-height:500px;">							
					          	<div class="col-md-6">
							        <br>
						            <br>								
								</div>							
							</form>
						</div>
					</div>

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-secondary btn-small" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-outline-primary btn-small">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
        <%
			}
        %>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp" />

<jsp:include page="jslinks.jsp" />

<script>

let bookings = new Vue({
	el: "#booked",
	data: {
		bookings: [],
		bookingDetails: null,
		totalCost: null,
	},
	mounted() {
		this.getBookings();
	},
	
	methods: {
		getBookings(){
					
			axios({
				method: "GET",
				url: "http://localhost:8080/Team3-JSPWebService/rest/bookings/getbookings/" + ${custProf.getCustomerId()}})
				.then(response => {
					this.bookings = response.data;
				})
				.catch(error => {
					console.log(error);
				});
			},
			
		getBookingDetails(id){
			axios({
				method: "GET",
				url: "http://localhost:8080/Team3-JSPWebService/rest/bookings/getbookingdetails/" + id})
				.then(response => {
					this.bookingDetails = response.data;
				})
				.catch(error => {
					console.log(error);
				});
			}
	},
	
	computed: {
		
	}
})

</script>

</body>
</html>