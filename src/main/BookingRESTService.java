package main;

import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import entity.Booking;
import entity.Bookingdetail;

@SuppressWarnings("unchecked")
@Path("/bookings")
public class BookingRESTService {
	
	
	//gets the base booking information
	@GET
	@Path("/getbookings/{ CustomerId }")
	@Produces(MediaType.APPLICATION_JSON)
	public String getBookings(@PathParam("CustomerId") int CustomerId) {
		//int CustomerId = Integer.parseInt(cust);
		EntityManager em =Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		Query query = em.createQuery("SELECT b FROM Booking b WHERE b.customerId = " + CustomerId);
		List<Booking> bookings = query.getResultList();
		
		Gson gson = new Gson();
		Type type = new TypeToken<List<Booking>>() {}.getType();
		
		String jsonString = gson.toJson(bookings, type);
		em.close();
		
		return jsonString;
	}
	
	//gets the individual booking's details
	@GET
	@Path("/getbookingdetails/{ BookingId }")
	@Produces(MediaType.APPLICATION_JSON)
	public String getBookingDetails(@PathParam("BookingId") int BookingId) {
		EntityManager em =Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		Query query = em.createQuery("SELECT b FROM Bookingdetail b WHERE b.bookingId = " + BookingId);
		List<Bookingdetail> bookingDetails = query.getResultList();
		
		Gson gson = new Gson();
		Type type = new TypeToken<List<Bookingdetail>>() {}.getType();
		
		String jsonString = gson.toJson(bookingDetails, type);
		em.close();
		
		return jsonString;
	}
}
