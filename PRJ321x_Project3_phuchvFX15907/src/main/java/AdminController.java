

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import jakarta.servlet.http.Cookie;

import java.io.IOException;

import dao.AccountDAO;



/**
 * Servlet implementation class AdminController
 */
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 
		 * Check session "account"
		 * 	 	+ if account != null --> /admin
		 * 		+ if account == null --> check cookie
		 * 			+ if cookie = 	"" --> /home
		 * 			+ if cookie !=	"" --> check information in cookie match information in db?
		 * 				+ if match --> /admin
		 * 				+ if un match --> /home
		 * */
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			
			if(account!= null) {
				RequestDispatcher rd = request.getRequestDispatcher("./admin/indexAdmin.jsp");
				rd.forward(request, response);
				
			} else {
				Cookie[] cookies = request.getCookies();
			 	String name = "";
			 	String pass = "";
			 	
			 	for (Cookie c : cookies){
			 		if (c.getName().equals("username")){
			 			name = c.getValue();
			 		}
			 		if (c.getName().equals("password")){
			 			pass = c.getValue();
			 		}
			 	}
			 	
			 	if(name=="" || pass== "" ) {
			 		response.sendRedirect("home");
			 	} else {
			 		AccountDAO accdao = new AccountDAO();
					Account a = accdao.login(name, pass);
					String uid = a.getUsr();
					String pwd = a.getPwd();
					
						if (pass.equals(pwd) && name.equalsIgnoreCase(uid) ) {
					 		session.setAttribute("userID", name);
					 		RequestDispatcher rd = request.getRequestDispatcher("./admin/indexAdmin.jsp");
							rd.forward(request, response);
					 		} else {
					 		response.sendRedirect("home");
					 				}
			 			}
					}
			}
		 catch (Exception e) {
			response.getWriter().println(e);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
