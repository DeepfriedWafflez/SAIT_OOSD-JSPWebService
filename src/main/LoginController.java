package main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helpers.ValidateCust;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		
		if (ValidateCust.isValidString(Username) &&
				ValidateCust.isValidString(Password)) 
		{
			request.getRequestDispatcher("/profile.jsp").forward(request, response);
		}
		else {
			request.setAttribute("username", Username);
			request.setAttribute("password1", Password);
			
			if(ValidateCust.fieldError.size() != 0) {
				
				if (Username.trim().isEmpty()) {
					request.setAttribute("fieldErrorUsername", ValidateCust.fieldError.get(Username));
				}
				
				if (Password.trim().isEmpty()) {
					request.setAttribute("fieldErrorPassword", ValidateCust.fieldError.get(Password));
				}
			}
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
