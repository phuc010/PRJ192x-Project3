package dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class AccountDAO
 */
public class AccountDAO extends HttpServlet {
	
	Connection conn = null; //connect to sql server
	PreparedStatement ps = null; //query netbean to sql server 
	ResultSet rs = null; // result return
	
	
	public Account login(String user, String pass) {
		try {
			String query = "select * from Account\r\n"
					+ "where user_mail = ? and password = ?";
			conn = new context.DBContext().getConnection(); //open connect to sql server 
			ps = conn.prepareStatement(query);
			ps.setString(1,user);
			ps.setString(2,pass);
			rs = ps.executeQuery(); //execute query and receive result 
			
			while(rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public Account checkAccExist(String user) {
		try {
			String query = "select * from Account\r\n"
					+ "where user_mail = ?";
			conn = new context.DBContext().getConnection(); //open connect to sql server 
			ps = conn.prepareStatement(query);
			ps.setString(1,user);
			rs = ps.executeQuery(); //execute query and receive result 
			
			while(rs.next()) {
				return new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public void register(String user, String pass, String name, String address, String phone) {
		try {
			String query = "insert into Account\r\n"
					+ "values(?,?,1,?,?,?,0)";
			conn = new context.DBContext().getConnection(); //open connect to sql server 
			ps = conn.prepareStatement(query);
			ps.setString(1,user);
			ps.setString(2,pass);
			ps.setString(3,name);
			ps.setString(4,address);
			ps.setString(5,phone);
			ps.executeUpdate(); //execute query (no receive result) 
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountDAO() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
