package main;

import java.lang.reflect.Type;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import entity.Customer;


@Path("/customers")
public class CustomersRESTService {
	
	
	@GET
	@Path("/getcustomer/{ customerId }")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCustomer(@PathParam("customerId") int customerId)
	{
		//	http://localhost:8080/Team3-JSPWebService/rest/customers/getcustomer/104
		EntityManager em =
				Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();

		Query query = em.createQuery("SELECT c FROM Customer c where c.customerId = " + customerId);
		Customer customer = (Customer) query.getSingleResult();
		
		Gson gson = new Gson();
		Type type = new TypeToken<Customer>() {}.getType();
		String jsonString = gson.toJson(customer, type);
		em.close();
		return jsonString;
	}
	
	//POST 
	@POST
    @Path("/postcustomer")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces(MediaType.TEXT_PLAIN)
    public String postCustomer(String jsonString)
    {
		
//		http://localhost:8080/Team3-JSPWebService/rest/customers/postcustomer
		
        Gson gson = new Gson();
        Type type = new TypeToken<Customer>() {}.getType();
        Customer customer = gson.fromJson(jsonString, type);
        EntityManager em =
                Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();

        em.getTransaction().begin();
        em.merge(customer);
        em.getTransaction().commit();
        return "Customer update completed";
    }
	
	
	
	//PUT REST service to put customer into database (add)
	@PUT
	@Path("/putcustomer")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces(MediaType.TEXT_PLAIN)
	public String putCustomer(String jsonString)
	{
//		http://localhost:8080/Team3-JSPWebService/rest/customers/putcustomer
		
		Gson gson = new Gson();
		Type type = new TypeToken<Customer>() {}.getType();
		Customer customer = gson.fromJson(jsonString, type);
		EntityManager em = Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		
		em.getTransaction().begin();
		em.persist(customer);
		em.getTransaction().commit();
				
		return "Customer INSERT completed";
	}
	
}


