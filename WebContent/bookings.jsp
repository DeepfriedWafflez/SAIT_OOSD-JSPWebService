<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="base.jsp" />

<jsp:include page="nav.jsp" />

<!-- 
Authors: Ibraheem, Brent, Linda, Guido
Purpose: UI/UX
Date: 19/06/2019
 -->

<section class="probootstrap-cover overflow-hidden relative" style="background-image: url('images/order3.jpg'); max-height: 450px;" data-stellar-background-ratio="0.5" id="section-home">
   	 <div class="overlay"></div>
     <div class="container">
       <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Bookings</h2>
          </div>
       </div>
   	 </div>
   	    
</section>



<div id="app">
	
	<table>
		<tr v-for="booking in bookings">
			<td>{{booking.bookingNo}}</td>
			<td>{{booking.bookingDate}}</td>
			<td>{{booking.travelerCount}}</td>
			<td>{{booking.tripTypeId}}</td>
			<td>
				<button @click="getBookingDetails(booking.bookingId)"class="btn btn-primary" type="button" data-toggle="collapse" 
				data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Details</button>
			</td>
			<td>
				<div class="collapse" id="collapseExample" v-if="bookingDetails != null">
  					<div class="card card-body">
  						<span>Itinerary No: 	{{bookingDetails[0].itineraryNo}}</span>
  						<span>Start Date:		{{bookingDetails[0].tripStart}}</span>
  						<span>End Date:			{{bookingDetails[0].tripEnd}}</span>
  						<span>Description:		{{bookingDetails[0].description}}</span>
  						<span>Destination:		{{bookingDetails[0].destination}}</span>
  						<span>Class:			{{bookingDetails[0].classId}}</span>
  						<span>Region:			{{bookingDetails[0].regionId}}</span>
  						<span>Base Cost:		${{bookingDetails[0].basePrice}}</span>
  						<span>Total Cost:</span>
  					</div>
				</div>
			</td>
		</tr>
	</table>
</div>

	


<jsp:include page="BookingsContent.jsp" /> 

<jsp:include page="footer.jsp" />

<jsp:include page="jslinks.jsp" />

<script>

let app = new Vue({
	el: '#app',
	data: {
		bookings: [],
		bookingDetails: null,
		totalCost: null,
	},
	mounted(){
		this.getBookings();
	},
	methods: {
		
//		fetch("http://localhost:8080/Team-3JSPWebService/bookings/getbookings/143")
//		.then(response => response.json())
//		.then((data) =>{
//			this.bookings = data;
//		})
		
		getBookings(){
			
			axios({
				method: "GET",
				url: "http://localhost:8080/Team3-JSPWebService/rest/bookings/getbookings/143"})
				.then(response => {
					this.bookings = response.data;
					console.log(response.data);
				});
		},
		
		getBookingDetails(id){
			axios({
				method: "GET",
				url: "http://localhost:8080/Team3-JSPWebService/rest/bookings/getbookingdetails/" + id})
				.then(response => {
					this.bookingDetails = response.data;
					console.log(response.data);
				});
		}
	}
});

</script>

</body>
</html>