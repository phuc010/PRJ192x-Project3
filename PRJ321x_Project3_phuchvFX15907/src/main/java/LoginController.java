

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

import dao.AccountDAO;

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
		
		RequestDispatcher rd = request.getRequestDispatcher("LoginServlet.jsp");
		rd.forward(request, response);
		
		HttpSession session = request.getSession();
		session.invalidate();
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		try {
			request.getSession(true).invalidate();
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			//collect data from a login form
			String userID = request.getParameter("username");
			String password = request.getParameter("password");
			Boolean re = Boolean.parseBoolean(request.getParameter("remember"));
			//read information account in db
			AccountDAO accdao = new AccountDAO();
			Account a = accdao.login(userID, password);
			HttpSession session = request.getSession();
			if (a==null) {
				if (!password.matches(regex) || !userID.matches(regexMail)) {
					session.setAttribute("error", "invalid syntax");
					response.sendRedirect("login");
					}else {
						session.setAttribute("error", "wrong username or password");
						response.sendRedirect("login");
					}
			} else {
				
				//set session
				session.setAttribute("account", a);
				session.setAttribute("userID", userID);
				//check remember me
				if(re) {
					//set and add cookie
					Cookie userCookie = new Cookie("username", userID);
					userCookie.setMaxAge(24*3600);
					response.addCookie(userCookie);
					
					Cookie passCookie = new Cookie("password", password);
					passCookie.setMaxAge(24*3600);
					response.addCookie(passCookie);
					}	
				//login is valid
				response.sendRedirect("home");
			}
			
			
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login");
			rd.forward(request, response);
		}
		
		catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}
}
