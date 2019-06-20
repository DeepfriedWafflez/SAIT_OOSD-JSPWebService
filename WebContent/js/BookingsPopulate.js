/**
 * 
 */

function populate(){
	var customerId;
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
		      ItineraryNo.text = bookings[i].ItineraryNo;
		      booking.add(ItineraryNo);
		      
		      let BookingDate = document.createElement('td');
		      BookingDate.text = bookings[i].BookingDate;
		      booking.add(BookingDate);
		      
		      let TravelerCount = document.createElement('td');
		      TravelerCount.text = bookings[i].TravelerCount;
		      booking.add(TravelerCount);
		      
		      let TripStart = document.createElement('td');
		      TripStart.text = bookings[i].TripStart;
		      booking.add(TripStart);
		      
		      let TripEnd = document.createElement('td');
		      TripEnd.text = bookings[i].TripEnd;
		      booking.add(TripEnd);
		      
		      let Description = document.createElement('td');
		      Description.text = bookings[i].Description;
		      booking.add(Description);
		      
		      let Destination = document.createElement('td');
		      Destination.text = bookings[i].Destination;
		      booking.add(Destination);
		      
		      let BasePrice = document.createElement('td');
		      BasePrice.text = bookings[i].BasePrice;
		      booking.add(BasePrice);
		      

		      //adds the booking to the table
		      bookingsTable.add(booking);
		    }
		   }  
		}
	
	xhttp.send();
}