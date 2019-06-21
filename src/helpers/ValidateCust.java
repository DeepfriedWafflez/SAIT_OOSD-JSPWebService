package helpers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import entity.Customer;


public class ValidateCust {
	
	public static ArrayList<String> validatedData = new ArrayList<>();
	
	public static ArrayList<String> invalidData = new ArrayList<>();
	
	public static HashMap<String, String> fieldError = new HashMap<String, String>();
	
	public static String nonFieldError = "";
	
	private static Pattern emailStrMatch = Pattern.compile(
		    "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	
	public static Boolean isValidString(String str) {
		
		if (str.isEmpty() || str.equals("") || str.trim().isEmpty() || str.trim().equals("")) {
			//	fieldError = "This field is required";
			fieldError.put(str, "This field is required");
			invalidData.add(str);
			return false;
		} else {
			validatedData.add(str);
			invalidData.clear();
			// fieldError = "";
			fieldError.remove(str);
			return true;
		}		
	}
	
	public static Boolean isValidEmail(String str) {
		
        Matcher match = emailStrMatch.matcher(str);
        if(match.matches()){
        	fieldError.remove(str);
        	invalidData.clear();
            return true;
        }
        else {
        	fieldError.put(str, "Please enter a valid email");
        	invalidData.add(str);
        	return false;
        }
	}
	
	public static Boolean isValidPassword(String pass1, String pass2) {
		
		if (pass1.equals(pass2)) {
			validatedData.add(pass1);
			invalidData.clear();
			nonFieldError = "";
			return true;			
		} else {			
			nonFieldError = "Passwords do not match. Please try again.";
			invalidData.add(pass1);
			return false;
			
		}
	}
	
	public static Boolean userExists(Customer cust) {
		// TO-DO: use JPA to check if username or 
		// email already exists in the database
				
		return false;
	}
	
	public static Boolean isValidNonSQLScript() {
		
		return false;
	}
		
	// Calling this broke my code several times, will refactor later
	public static Boolean isValid(String str, String pass1, String pass2) {
		
		if (invalidData.isEmpty() && validatedData.size() != 0) {
			return true;
		} else {
			isValidString(str);
			isValidString(pass1);
			isValidString(pass2);
			isValidPassword(pass1, pass2);
			return false;
		}
	}	
}


