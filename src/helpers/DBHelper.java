package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class DBHelper {
	
	public static Connection getConn() {		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/travelexperts?serverTimezone=UTC", 
					"admin", 
					"P@ssw0rd");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}
	
	public static EntityManager getManager() {
		
		EntityManager em = Persistence.createEntityManagerFactory("Team3-JSPWebService").createEntityManager();
		
		return em;
		
	}
}
