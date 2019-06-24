package helpers;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import entity.Customer;

/**
Author: Ibraheem Kolawole
Purpose: Authentication helper util
Date: 22/06/2019
**/


public class AuthenticateCust {

	
	
	
	public static Customer authenticate(String usr, String pass) {
		
		
		EntityManager em = DBHelper.getManager();
		
		//	try {
		
		//	String hashedPass;
		
		//	AND c.custPassword = :passWord
		//	.setParameter("passWord", pass)

		Query query = em.createQuery(
					"SELECT c FROM Customer c where c.custUsername = :userName")
					.setParameter("userName", usr);
		Customer customer = (Customer) query.getSingleResult();
			
		return customer;
			
		//	} catch(NoResultException noresult) {
		//
		//	}

	}
}
