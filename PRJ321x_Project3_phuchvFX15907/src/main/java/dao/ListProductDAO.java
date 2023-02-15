package dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ListProductDAO
 */
public class ListProductDAO extends HttpServlet {
	Connection conn = null; //connect to sql server
	PreparedStatement ps = null; //query netbean to sql server 
	ResultSet rs = null; // result return
	public List<Product> search(String characters) throws Exception{
		
		return null;
		
	}
	//List product display on body.jsp
	public List<Product> getProduct(){
		try {
			String query = "SELECT * FROM Products";
			conn = new context.DBContext().getConnection(); //open connect to sql server 
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery(); //execute query and receive result 
			
			List<Product> list = new ArrayList<>();
			while(rs.next()) {
				Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7));
				list.add(a);
			}
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	//List product search
		public List<Product> getProductByName(String namesearch){
			try {
				String query = "SELECT * FROM Products WHERE product_name like ? ";
				conn = new context.DBContext().getConnection(); //open connect to sql server 
				ps = conn.prepareStatement(query);
				ps.setString(1,"%" + namesearch + "%");
				rs = ps.executeQuery(); //execute query and receive result 
				
				List<Product> list = new ArrayList<>();
				while(rs.next()) {
					Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7));
					list.add(a);
				}
				return list;
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return null;
			
		}
	//a product display on inforProduct.jsp
	public Product getProductById(String id){
		String query = "SELECT * FROM Products WHERE product_id=?";
		try {
			
			conn = new context.DBContext().getConnection(); //open connect to sql server 
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery(); //execute query and receive result 
			
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	

	

	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProductDAO() {
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
		// TODO Auto-generated method stub
	}

}
