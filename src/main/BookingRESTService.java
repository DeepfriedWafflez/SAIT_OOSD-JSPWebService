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

import entity.Bookings;

@SuppressWarnings("unchecked")
@Path("/bookings")
public class BookingRESTService {
	
	@GET
	@Path("/history/id={ Customer }")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCountryProvinces(@PathParam("Customer") String cust) {
		int CustomerId = Integer.parseInt(cust);
		EntityManager em =Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		Query query = em.createQuery("SELECT b, bd FROM Bookings b JOIN BookingDetails db ON b.BookingId=bd.BookingId" + 
							"WHERE b.BookingId = " + CustomerId);
		List<Bookings> bookings = query.getResultList();
		
		Gson gson = new Gson();
		Type type = new TypeToken<List<Bookings>>() {}.getType();
		
		String jsonString = gson.toJson(bookings, type);
		em.close();
		
		return jsonString;
	}
}
