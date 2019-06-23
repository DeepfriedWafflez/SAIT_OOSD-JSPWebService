package helpers;

import java.security.Key;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

public class JWTCust {

	public static Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);

	
	public static String tokenCreate(String usr) {
				
		String jws = Jwts.builder().setSubject(usr).signWith(key).compact();
				
		return jws;
	}
	
	public static Boolean tokenRead(String usr) {
		
		try 
		{
		  Jws<Claims> claims = Jwts.parser().setSigningKey(key).parseClaimsJws(usr);
		  
		  String userClaim = claims.getBody().getSubject();
		
		  if (userClaim.equals(usr)) {
			  return true;  
		  } else {
			  return false;
		  }
		  
		} catch (JwtException e) 
		{
			return false;
		}
		
	}
	
}