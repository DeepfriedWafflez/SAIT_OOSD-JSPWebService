/*

function populate(){
	var customerId = 143;
	var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	        var response = xhttp.responseText;
	        console.log("ok"+response);
	    }
	};
	
	xhttp.open("GET", "http://localhost:8080/Team-3JSPWebService/bookings/getbookings/" + customerId, true);

	//populates
	xhttp.onload = function() {
		  if (this.readyState == 4 && this.status == 200) {
		    var bookings = JSON.parse(xhttp.responseText);
		    let booking;
		    bookingsTable = document.getElementById("BookingsContainer");
		    for (let i = 0; i < bookings.length; i++) {
		      booking = document.createElement('tr');
		      
		      //building the booking
		      let ItineraryNo = document.createElement('td');
		      ItineraryNo.text = bookings[i].itineraryNo;
		      booking.add(ItineraryNo);
		      
		      let BookingDate = document.createElement('td');
		      BookingDate.text = bookings[i].bookingDate;
		      booking.add(BookingDate);
		      
		      let TravelerCount = document.createElement('td');
		      TravelerCount.text = bookings[i].travelerCount;
		      booking.add(TravelerCount);
		      
		      let TripStart = document.createElement('td');
		      TripStart.text = bookings[i].tripStart;
		      booking.add(TripStart);
		      
		      let TripEnd = document.createElement('td');
		      TripEnd.text = bookings[i].tripEnd;
		      booking.add(TripEnd);
		      
		      let Description = document.createElement('td');
		      Description.text = bookings[i].description;
		      booking.add(Description);
		      
		      let Destination = document.createElement('td');
		      Destination.text = bookings[i].destination;
		      booking.add(Destination);
		      
		      let BasePrice = document.createElement('td');
		      BasePrice.text = bookings[i].basePrice;
		      booking.add(BasePrice);
		      
		      let BookingId = document.createElement('button')
		      BookingId.text = "Details";
		      BookingId.value = bookings[i].bookingId;
		      booking.add(BookingId);
		      

		      //adds the booking to the table
		      bookingsTable.add(booking);
		    }
		   }  
		}
	
	xhttp.send();
}*/

























