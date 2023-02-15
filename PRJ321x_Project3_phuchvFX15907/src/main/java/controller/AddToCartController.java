package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.ListProductDAO;

/**
 * Servlet implementation class AddToCartController
 */
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Cart> cart = new ArrayList<Cart>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		switch (action) {
		case "buynow": {
			
			HttpSession session = request.getSession();
		    session.setAttribute("cart",cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		}
		case "addcart": {
			ListProductDAO PDAO = new ListProductDAO();
			Product p = PDAO.getProductById(id);
			
			addToCart(p);
			HttpSession session = request.getSession();
	        session.setAttribute("cart",cart);
	        
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		}
		case "removecart": {
			ListProductDAO PDAO = new ListProductDAO();
			Product p = PDAO.getProductById(id);
			
			removeFromCart(p);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		}
		case "dec": {
			ListProductDAO PDAO = new ListProductDAO();
			Product p = PDAO.getProductById(id);
			
			decFromCart(p);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		}
		case "inc": {
			ListProductDAO PDAO = new ListProductDAO();
			Product p = PDAO.getProductById(id);
			
			incFromCart(p);
			HttpSession session = request.getSession();
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			break;
		}
		
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
		
		}
		
	// add new product to cart 
		public String addToCart(Product p) {
			for (Cart item : cart) {
				if (item.getProduct().getId() == p.getId()) {
					item.setQuantity(item.getQuantity() + 1);
					return "cart";
				}
			}
			Cart c = new Cart();
			c.setProduct(p);
			c.setQuantity(1);
			cart.add(c);
			return "cart";
		}
		
		//remove product line on cart
		private String removeFromCart(Product p) {
			for (Cart item : cart) {
				if (item.getProduct().getId() == p.getId()) {
					cart.remove(item);
					return "cart";
				}
			}
			return "cart";
		}
		//decrease 1 product quantity on cart
		public String decFromCart(Product p) {
			for (Cart item : cart) {
				if (item.getProduct().getId() == p.getId() && item.getQuantity()>1) {
					item.setQuantity(item.getQuantity() - 1);
					return "cart";
				}
			}
			return "cart";
		}
		//decrease 1 product quantity on cart
		public String incFromCart(Product p) {
			for (Cart item : cart) {
				if (item.getProduct().getId() == p.getId()) {
					item.setQuantity(item.getQuantity() + 1);
					return "cart";
				}
			}
			return "cart";
		}
		
		

}
