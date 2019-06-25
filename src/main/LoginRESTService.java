package main;

import java.lang.reflect.Type;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import entity.Customer;
import helpers.AuthenticateCust;
import helpers.DBHelper;
import helpers.JWTCust;
import helpers.ValidateCust;




@Path("/loginAPI")
public class LoginRESTService {

	
	@POST
	@Path("/custLogin")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	public String loginCust(String userCred) {
		
		Gson gson = new Gson();		
		Type type = new TypeToken<Customer>() {}.getType();		
		Customer customer = gson.fromJson(userCred, type);
		
		String Username = customer.getCustUsername();
		String Password = customer.getCustPassword();
		
		String msg = "";
		
		
		if (ValidateCust.isValidString(Username) &&
				ValidateCust.isValidString(Password) && 
				ValidateCust.enterValidCredentials(Username, Password)) 
		{
			String usrToken = JWTCust.tokenCreate(Username);
			
			Boolean authCust = JWTCust.tokenRead(usrToken);
			
			if(authCust != false) {
				
				Customer cust = AuthenticateCust.authenticate(Username, Password);
				
				String customerJson = gson.toJson(cust);				
				
				//	msg = "Authentication succeeded";
				
				msg = customerJson;
				
			} else {
				
				msg = "Authentication failed";
				
			}
		}
		else {
						
			// NOQA	
			
			if(ValidateCust.fieldError.size() != 0) 
			{
								
				if (Username.trim().isEmpty()) {
					 
					msg = gson.toJson(ValidateCust.fieldError.get(Username));
					//	msg = "Invalid data entry";
										
					//	request.setAttribute("fieldErrorUsername", ValidateCust.fieldError.get(Username));
				}
				
				if (Password.trim().isEmpty()) {
					
					msg = gson.toJson(ValidateCust.fieldError.get(Password));
					//	msg = "Invalid data entry";
					
					//	request.setAttribute("fieldErrorPassword", ValidateCust.fieldError.get(Password));
				}
			}
			
			if (!ValidateCust.nonFieldError.trim().equals("")) {
				msg = gson.toJson(ValidateCust.nonFieldError);
				//	msg = "Invalid data entry";
				//	request.setAttribute("nonFieldError", ValidateCust.nonFieldError);
			}
		}
		return msg;
	}
	
}

