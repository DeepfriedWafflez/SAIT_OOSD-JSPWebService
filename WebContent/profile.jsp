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
	<div class="container" id="booked">
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
        			<!-- id="booked" -->
        			<div>
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
								     <td v-if='packageN = booking.packageId'>{{packageName}}</td>
								     <td>{{booking.travelerCount}}</td>
									 <td v-if='tripT = booking.tripTypeId'>{{tripType}}</td>
								     
								     <!-- Button trigger modal booking detail -->
									<td>
										<button @click="getBookingDetails(booking.bookingId)" class="btn-outline-success btn-small" data-toggle="modal" data-target="#exampleModal">
										  Detail
										</button>
									</td>
								  </tr>
								  	<tr v-if="bookingDetails != null">
								  		<span v-for="bookingDet in bookingDetails">
								  			{{bookingDet.itenaryNo}}
								  		</span>
								  	</tr>
							  </tbody>
						 </table>		
        			</div>
        		</div>
        	</div>        	
			
			<!-- Modal Booking Details START!!!! -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Detail</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      <div class="col-md-12 probootstrap-animate probootstrap-form-box">
			      <div class="table-responsive-md">
			      	<div v-if="bookingDetails != null">
			      		<div v-for="bookingDet in bookingDetails">
						     <table class="table table-separated">						     
							     <tbody>
							     	<tr>
						               <td><strong>Itinerary No</strong></td>:<td>{{ bookingDet.itineraryNo }}</td>
						            </tr>
						            <tr>
						                <td><strong>Start Date</strong></td>:<td>{{bookingDet.tripStart}}</td>
						            </tr>
						            <tr>
						                <td><strong>End Date</strong></td>:<td>{{bookingDet.tripEnd}}</td>
						            </tr>
						            <tr>
						                <td><strong>Description</strong></td>:<td>{{bookingDet.description}}</td>
						            </tr>
						            <tr>
						                <td><strong>Destination</strong></td>:<td>{{bookingDet.destination}}</td>
						            </tr>
						            <tr>
						                <td><strong>Class</strong></td>:<td>{{bookingDet.classId}}</td>
						            </tr>
						            <tr>
						                <td><strong>Region</strong></td>:<td>{{bookingDet.regionId}}</td>
						            </tr>
						            <tr>
						                <td><strong>Base Cost</strong></td>:<td> $ {{bookingDet.basePrice}}</td>
						            </tr>
						            <tr>
						                <td><strong>Total Cost</strong></td>:<td></td>
						            </tr>
							     </tbody>
	  						</table>	  						
	  						<br>
	  						<br>
			      		</div>  						
  					</div>
			      </div>
			      <div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button> -->
			      </div>
			    </div>
			  </div>
			</div>
			</div>
			</div>
			<!-- Modal Booking Details END!!!! -->
					
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

let book = new Vue({
	el: "#booked",
	data: {
		bookings: [],
		bookingDetails: null,
		totalCost: null,
		tripType: '',
		packageName: ''
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
					console.log(response.data);
					this.bookingDetails = response.data;
				})
				.catch(error => {
					console.log(error);
				});
			},
	},
	
	computed: {
		
		tripT :{
			
			// Getter
			get: function(){
				return this.tripType;
			},
			
			// Setter
			set: function(trip) {
			
				if (trip=='B')
				{
					this.tripType = 'Business';
				} else if(trip=='L')
				{
					this.tripType = 'Leisure';
				} else if(trip=='G')
				{
					this.tripType = 'Group';
				}
			},	
		},
		
		packageN: {
			
			// Getter
			get: function(){
				return this.packageName;
			},
			
			// Setter
			set: function(pckId){
				if (pckId===1) {
					this.packageName = 'Caribbean New Year';
				} else if (pckId===2) {
					this.packageName = 'Polynesian Paradise';
				} else if (pckId===3) {
					this.packageName = 'Asian Expedition';
				} else if (pckId===4) {
					this.packageName = 'European Vacation';
				}
			},
		},
				
		getTotalPrice(){
			
		}
	}
})

</script>

</body>
</html>