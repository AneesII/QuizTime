package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Human;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("Name");
		String password = request.getParameter("pswd");
		
		Human ob = new Human();
		boolean status = ob.validateLogin(username, password);
		String Type = ob.getType();
		String name = ob.getName();
			
		if(status){
			request.getSession().setAttribute("Name", name);
			request.getSession().setAttribute("Type", Type);
			response.sendRedirect("home.jsp");
			
		} else {
				request.getSession().setAttribute("ErrorMsg", "Invalid username or password");
				response.sendRedirect("index.jsp");
		}
	}

}
