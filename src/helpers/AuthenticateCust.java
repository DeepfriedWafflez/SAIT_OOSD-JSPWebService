package helpers;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import entity.Customer;

public class AuthenticateCust {

	
	
	
	public static Customer authenticate(String usr, String pass) {
		
		
		EntityManager em = DBHelper.getManager();
		
//		try {
		
		String hashedPass;
		
		Query query = em.createQuery(
					"SELECT c FROM Customer c where c.custUsername = :userName AND c.custPassword = :passWord")
					.setParameter("userName", usr)
					.setParameter("passWord", pass);
		Customer customer = (Customer) query.getSingleResult();
			
		return customer;
			
//		} catch(NoResultException noresult) {
//			
//		}

	}
}
