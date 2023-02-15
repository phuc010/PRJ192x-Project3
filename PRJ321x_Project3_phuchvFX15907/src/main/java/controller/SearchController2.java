package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.ListProductDAO;

/**
 * Servlet implementation class SearchController2
 */
public class SearchController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		
		String txtSearch = request.getParameter("txtsearch");
		
		ListProductDAO listPDAO = new ListProductDAO();
		List<Product> list = listPDAO.getProductByName(txtSearch);
		request.setAttribute("listProduct", list);
		//set value input header.jsp
		request.setAttribute("txtSearchName", txtSearch);
		if (list.size() == 0 ) {
			session.setAttribute("empty", "CAN NOT FIND THE PRODUCT");
			RequestDispatcher rdp = request.getRequestDispatcher("home.jsp");
			rdp.forward(request, response);
			
		} else {
			session.removeAttribute("empty");
			RequestDispatcher rdp = request.getRequestDispatcher("home.jsp");
			rdp.forward(request, response);
		}
		
	}

}
