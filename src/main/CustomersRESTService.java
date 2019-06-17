package main;

import java.lang.reflect.Type;

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

import entityModel.Customer;


@Path("/customers")
public class CustomersRESTService {
	
	
	@GET
	@Path("/getcustomer/{ customerId }")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCustomer(@PathParam("customerId") int customerId)
	{
		//	http://localhost:8080/Team3-JSPWebService/rest/customers/getcustomer/104
		EntityManager em =
<<<<<<< HEAD
				Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		
		//Agent agent = em.find(Agent.class, agentId);
		
		//Query query = em.createQuery("select a from Agent a where a.agentId=" + agentId);
		//Agent agent = (Agent) query.getSingleResult();
		
=======
				Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();		
>>>>>>> Linda
		Query query = em.createQuery("SELECT c FROM Customer c where c.customerId = " + customerId);
		Customer customer = (Customer) query.getSingleResult();
		
		Gson gson = new Gson();
		Type type = new TypeToken<Customer>() {}.getType();
		String jsonString = gson.toJson(customer, type);
		em.close();
		return jsonString;
	}
}
