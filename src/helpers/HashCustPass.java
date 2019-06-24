package helpers;

import static com.kosprov.jargon2.api.Jargon2.*;

public class HashCustPass {

	/**
	Author: Ibraheem Kolawole
	Purpose: Password hasher helper util
	Date: 22/06/2019
	**/	
	
	
	public static String hashPass(String pass) {
		
		byte[] passwrd = pass.getBytes();
		
		Hasher hashedPass = jargon2Hasher().type(Type.ARGON2d)
				.memoryCost(65536)
				.timeCost(3)
				.parallelism(3)
				.saltLength(16)
				.hashLength(16);
		
		String encodedHash = hashedPass.password(passwrd).encodedHash();
		
		return encodedHash;
		
	}
	
	public static boolean verifyPass(String encodedPass, String pass) {
		
		// encodedPass is the hashed password already in the database
		// pass is the password being supplied during Login
		
		byte[] passwrd = pass.getBytes();
		
		Verifier verifier = jargon2Verifier();
		
		boolean matches = verifier.hash(encodedPass).password(passwrd).verifyEncoded();
		
		return matches;
		
	}
	
}
