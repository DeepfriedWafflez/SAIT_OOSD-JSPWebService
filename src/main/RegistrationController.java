package main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helpers.ValidateCust;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/register")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//	request.setAttribute("nonFieldError", ValidateCust.nonFieldError);
		
		response.setContentType("text/html; charset=UTF-8");
		
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String Email = request.getParameter("email");
		String Username = request.getParameter("username");
		String Password1 = request.getParameter("password1");
		String Password2 = request.getParameter("password2");
		
		
		// Validate the inputs to check for invalid attributes 
		// Add userExists(Email, Username) to check if user already 
		// exists in the database
		
		if (ValidateCust.isValidString(Email) &&
				ValidateCust.isValidString(Password1) &&
				ValidateCust.isValidString(Password2) &&
				ValidateCust.isValidPassword(Password1, Password2) &&
				ValidateCust.isValidEmail(Email)
				)
		{
			 //	response.sendRedirect("login.jsp");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
		} 
		else 
		{			
			request.setAttribute("email", Email);
			request.setAttribute("username", Username);
			request.setAttribute("password1", Password1);
			request.setAttribute("password2", Password2);
			
			
			if(ValidateCust.fieldError.size() != 0) {
				
				if (Email.trim().isEmpty()) {
					request.setAttribute("fieldErrorEmail", ValidateCust.fieldError.get(Email));
				} else if (ValidateCust.isValidEmail(Email) == false) {
					request.setAttribute("fieldErrorEmail", ValidateCust.fieldError.get(Email));
				}
				
				if (Username.trim().isEmpty()) {
					request.setAttribute("fieldErrorUsername", ValidateCust.fieldError.get(Username));
				}
				if (Password1.trim().isEmpty()) {
					request.setAttribute("fieldErrorPass1", ValidateCust.fieldError.get(Password1));
				}
				if (Password2.trim().isEmpty()) {
					request.setAttribute("fieldErrorPass2", ValidateCust.fieldError.get(Password2));
				}
				
			}  
			
			if (!ValidateCust.nonFieldError.trim().equals("")) {
				request.setAttribute("nonFieldError", ValidateCust.nonFieldError);
			}
	
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}
		
	}

}
