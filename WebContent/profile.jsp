<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession, entity.Customer" %>

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
	                  		<h5 class="mb-3">Username: <small>{{ customer.custUsername }}</small> </h5>
                    		<h5 class="mb-3">Name: <small>{{ fullName }}</small> </h5>
                    		<h5 class="mb-3">Email: <small>{{ customer.custEmail }}</small> </h5>
                    		<h5 class="mb-3">Address: <br><small>{{ fullAddress }}</small> </h5>
                    		<h5 class="mb-3">Phone (Business): <small>{{ customer.custBusPhone }}</small> </h5>
                    		<h5 class="mb-3">Phone (Home): <small>{{ customer.custHomePhone }}</small> </h5>
	                  		<!-- <button class="btn btn-outline-warning btn-small btn-block">Settings</button> -->
	                  		
	                  		<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-warning btn-small btn-block" data-toggle="modal" data-target="#exampleModalCenter" @click="showModal">
							  Settings
							</button>
                  		</div>
                	</div>
              	</div>
        	</div>
        	<div class="col-md-8">
        		 <span v-if="updateMsg">
				    <div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Account updated successfully</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</span>
        		<div class="probootstrap-animate" style="background:white; min-height: 600px; border-radius:10px;">
        			<h3 class="profile-bookings" style="text-align: center; font-size: 35px; padding-top: 30px;">Your Bookings</h3>
        			<hr>
        			<!-- id="booked" -->
        			<div v-if='bookings.length != 0'>
        				 <table class="table table-borderless table-hover">
							  <thead>
							    <tr>
							      <th scope="col">Number</th>
							      <th scope="col">Booking Date</th>
<!-- 							      <th scope="col">Package</th> -->
							      <th scope="col">Travelers</th>
							      <th scope="col">Trip type</th>
							      <th></th>
							    </tr>
							  </thead>
							  <tbody>
							  							  	
								  <tr v-for="booking in bookings">
								     <td scope="row">{{booking.bookingNo}}</td>
								     <td>{{booking.bookingDate}}</td>
<!-- 								     <td v-if='packageN = booking.packageId'>{{packageName}}</td> -->
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
        			<div v-else>
        				<h5 class="h5-responsive" style="margin-left: 50px;">You have no bookings</h5>
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
						                <td><strong>Trip Start Date</strong></td>:<td>{{bookingDet.tripStart}}</td>
						            </tr>
						            <tr>
						                <td><strong>Trip End Date</strong></td>:<td>{{bookingDet.tripEnd}}</td>
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
									<td><strong>Total Cost</strong></td>:<td>$ {{ getTotal(2, bookingDet.basePrice) }}</td>
						                <!-- <td v-if='totalPrice = booking.travelerCount, bookingDet.basePrice'>{{total}}</td> -->
						            </tr>
							     </tbody>
	  						</table>	  						
	  						<br>
	  						<br>
			      		</div>  						
  					</div>
			      </div>
			      <div class="modal-footer">

			      </div>
			    </div>
			  </div>
			</div>
			</div>
			</div>
			<!-- Modal Booking Details END!!!! -->
					
			<!-- Modal -->
			<div class="modal fade modal-cust" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
			          	  <!-- action="postcustomer" method="post" -->
						  <form @submit.prevent="updateCustomer" class="mb60" style="min-height:500px;">							
					       
			     				          	
			     		  <%-- value="<%= customerSess.getCustomerId() %>" --%>
					      <small><input type="text" style="display:none;" class="mb-3" id="customerId" v-model="customer.customerId"></small>
					      <div class="mb-3">
			                <div class="form-group">
			                	<div class="form-row">
				                	<div class="col-md-6">
					                    <label for="fname" class="sr-only">Username</label>
					                    <%-- value="<%= customerSess.getCustUsername() %>" --%>
					                    <input type="text" class="form-control" id="custUsername" name="username" placeholder="Username" v-model="customer.custUsername">
			                		</div>
			                		<div class="col-md-6">
					                    <label for="fname" class="sr-only">Email</label>
					                    <%-- value="<%= customerSess.getCustEmail() %>" --%>
					                    <input type="text" class="form-control" id="custEmail" name="email" placeholder="Email" v-model="customer.custEmail">
			                		</div>
			                	</div>
			                </div>
			              </div>
			              <div class="mb-3">
			                <div class="form-group">
			                	<div class="form-row">
				                	<div class="col-md-6">
					                    <label for="fname" class="sr-only">First Name</label>
					                    <%-- value="<%= customerSess.getCustFirstName() %>"  --%>
					                    <input type="text" class="form-control" id="custFirstName" name="firstname" placeholder="First Name" v-model="customer.custFirstName">
				               		</div>
				               		<div class="col-md-6"> 
					                    <label for="fname" class="sr-only">Last Name</label>
					                    <%-- value="<%= customerSess.getCustLastName() %>" --%>
					                    <input type="text" class="form-control" id="custLastName" name="lastname" placeholder="Last Name" v-model="customer.custLastName">
				                	</div>
			                	</div>
			                </div>
			              </div>
			              <div class="mb-3">
			                <div class="form-group">
			                    <label for="fname" class="sr-only">Address</label>	
			                    		                    
								<%-- value="<%= customerSess.getCustAddress() %>" --%>		                    		                    
 			                    <textarea cols="30" rows="10" class="form-control"  name="address" placeholder="Enter your address" v-model="customer.custAddress"></textarea>
			                	
 								<%-- <input type="text"  cols="30" rows="10" class = "form-control" id="custAddress" name="address" placeholder="Enter your address" value="<%= customerSess.getCustAddress() %>"> --%>
			                </div>
			              </div>
			              <div class="mb-3">
			                <div class="form-group">
			                	<div class="form-row">
				                	<div class="col-md-6">
					                    <label for="fname" class="sr-only">Home Phone</label>
					                    <%-- value="<%= customerSess.getCustHomePhone() %>" --%>
					                    <input type="text" class="form-control" id="custHomePhone" name="homephone" placeholder="Home Phone" v-model="customer.custHomePhone">
				               		</div>
				               		<div class="col-md-6"> 
					                    <label for="fname" class="sr-only">Postal Code</label>
					                    <%-- value="<%= customerSess.getCustBusPhone() %>" --%>
					                    <input type="text" class="form-control" id="custBusPhone" name="businessphone" placeholder="Business Phone" v-model="customer.custBusPhone">
				                	</div>
			                	</div>
			                </div>
			              </div>
			              <div class="mb-3">
			                <div class="form-group">
			                	<div class="form-row">
				                	<div class="col-md-6">
					                    <label for="fname" class="sr-only">City</label>
					                    <%-- value="<%= customerSess.getCustCity() %>" --%>
					                    <input type="text" class="form-control" id="custCity" name="firstname" placeholder="City" v-model="customer.custCity">
				               		</div>
				               		<div class="col-md-6"> 
					                    <label for="fname" class="sr-only">Province</label>
					                    <%-- value="<%= customerSess.getCustProv() %>" --%>
					                    <input type="text" class="form-control" id="custProv" name="lastname" placeholder="Province" v-model="customer.custProv">
				                	</div>
			                	</div>
			                </div>
			              </div>
			              <div class="mb-3">
			                <div class="form-group">
			                	<div class="form-row">
				                	<div class="col-md-6">
					                    <label for="fname" class="sr-only">Country</label>
					                    <%-- value="<%= customerSess.getCustCountry() %>" --%>
					                    <input type="text" class="form-control" id="custCountry" name="firstname" placeholder="Country" v-model="customer.custCountry">
				               		</div>
				               		<div class="col-md-6"> 
					                    <label for="fname" class="sr-only">Postal Code</label>
					                    <%-- value="<%= customerSess.getCustPostal() %>" --%>
					                    <input type="text" class="form-control" id="custPostal" name="lastname" placeholder="Postal Code" v-model="customer.custPostal">
				                	</div>
			                	</div>
			                </div>
			              </div>			              				              			        
			              <%-- value="<%= customerSess.getAgentId() %>" --%>      
						  <small><input type="text" style="display:none;" class="mb-3" id="custAgentId" v-model="customer.agentId"></small>
						  <%-- value="<%= customerSess.getCustPassword() %>" --%>
						  <small><input type="text" style="display:none;" class="mb-3" id="custPassword" v-model="customer.custPassword"></small>


					      <div class="modal-footer">
					        <button type="button" class="btn btn-outline-secondary btn-small" data-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-outline-primary btn-small" @click="showModal">Save changes</button>
							
					      </div>
			      	</form>
			      		</div>
					</div>
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


/* 
* Author: Ibraheem Kolawole
* Purpose: Vue js ajax communication with REST API/Service
* Date: 25/06/2019
*/
let book = new Vue({
	el: "#booked",
	data: {
		bookings: [],
		bookingDetails: null,
		totalCost: null,
		tripType: '',
		packageName: '',
		
		customer: {},
		
 		showMod: false,
		
		traveler: null,
		
		updateMessage: ""
	},
	
	mounted() {
		this.getBookings();
		this.getCustomer();
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
			
		getTotal(trav, price){
				return trav * price;
			},
			
		getCustomer(){
				axios({
					method: "GET",
					url: "http://localhost:8080/Team3-JSPWebService/rest/customers/getcustomer/" + ${custProf.getCustomerId()}})
					.then(response => {
						console.log(response.data);
						this.customer = response.data;
					})
					.catch(error => {
						console.log(error)
					})
			},
			
		updateCustomer(){
				axios({
					method: "PUT",
					url: "http://localhost:8080/Team3-JSPWebService/rest/customers/putcustomer",
					data: {
 						customerId: this.customer.customerId,
						agentId: this.customer.agentId,
						custAddress: this.customer.custAddress,
						custBusPhone: this.customer.custBusPhone,
						custCity: this.customer.custCity,
						custCountry: this.customer.custCountry,
						custEmail: this.customer.custEmail,
						custFirstName: this.customer.custFirstName,
						custHomePhone: this.customer.custHomePhone,
						custLastName: this.customer.custLastName,
						custPassword: this.customer.custPassword,
						custPostal: this.customer.custPostal,
						custProv: this.customer.custProv,
						custUsername: this.customer.custUsername
					},
					
				}).then(response => {
					console.log(response.data);
					
					this.updateMessage = response.data;
					
					this.getCustomer();
					
					
				})
			},
			
		showModal(){
	            if(this.showMod==false){
	
	                this.showMod = true;
	
	                $(".modal-cust").modal("show");
	
	            } else {
	
	                this.showMod = false;
	
	                $(".modal-cust").modal("hide");
	
	            } 
				
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
		
		fullName() {
			
			return this.customer.custFirstName + " " + this.customer.custLastName;
			
		},
		fullAddress() {
			return this.customer.custAddress + ", " + this.customer.custCity + 
			", \n" + this.customer.custPostal + " " + this.customer.custProv + ", " + this.customer.custCountry;
		}
		,
		
        updateMsg(){
            if(this.updateMessage != ''){
                setTimeout(() => this.updateMessage="", 5000);
                return true;
            } else {
                return false;
            }
        },

		/* totalPrice: {
			
			// Getter
			get: function(){
				this.total;				
			},
			
			// Setter
			set: function(travler, price){
				this.traveler = traveler;
				this.price = price;
				
				this.total = this.traveler * this.price;
			}
		}, */
	}
})

</script>

<script>
//javascript function to send customer data to database as a JSON string
function postCustomerJS()
	{
		var Url = "http://localhost:8080/Team3-JSPWebService/rest/customers/postcustomer";
		$.ajax({
			headers: { 
		        'Accept': '*/*',
		        'Content-Type': 'application/json' 
		    },
			url:Url,
			dataType: "json",
			method:"POST",
			data:JSON.stringify({
			        "customerId": document.getElementById("customerId").value,
			        "custFirstName": document.getElementById("custFirstName").value,
			        "custLastName": document.getElementById("custLastName").value,
			        "custAddress": document.getElementById("custAddress").value,
			        "custCity": document.getElementById("custCity").value,
			        "custProv": document.getElementById("custProv").value,
			        "custPostal": document.getElementById("custPostal").value,
			        "custHomePhone": document.getElementById("custHomePhone").value,
			        "custBusPhone": document.getElementById("custBusPhone").value,
			        "custEmail": document.getElementById("custEmail").value,
			        "custCountry": document.getElementById("custCountry").value,
			        "custPassword": document.getElementById("custPassword").value,
			        "custUsername": document.getElementById("custUsername").value,
			        "agentId": document.getElementById("custAgentId").value
			 })
			 
	   // contentType: "application/json; charset=utf-8",
	   		
		});
		location.reload();
	};
</script>

</body>
</html>