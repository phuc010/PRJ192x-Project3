

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

import java.io.IOException;

import dao.AccountDAO;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
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
		//collect data from a register form
		String nameU = request.getParameter("yourName");
		String emailU = request.getParameter("yourEmail");
		String addU = request.getParameter("yourAdd");
		String phoneU = request.getParameter("yourPhone");
		String passU = request.getParameter("yourPass");
		
		request.setAttribute("atbNameU",nameU);
		request.setAttribute("atbYourEmail",emailU);
		request.setAttribute("atbYourAdd",addU);
		request.setAttribute("atbYourPhone",phoneU);
		request.setAttribute("atbYourPass",passU);
		
		//read information account in db
		AccountDAO accdao = new AccountDAO();
		Account a = accdao.checkAccExist(emailU);
		
		
		/* if a == null -> no data in db -> register susscess
		 * if a != null -> available data -> register fail 
		 */
		if (a == null) {
			accdao.register(emailU, passU, nameU, addU, phoneU);
			response.sendRedirect("home");
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("unavailable", "This email is already associated");
			//response.sendRedirect("register");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
