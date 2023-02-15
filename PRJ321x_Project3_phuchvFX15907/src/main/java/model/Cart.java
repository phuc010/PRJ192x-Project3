package model;


public class Cart{
	private Product product;
	private double total;
	private int quantity;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Cart(Product product, double total, int quantity) {
		super();
		this.product = product;
		this.total = total;
		this.quantity = quantity;
	}
	public Cart() {
		
	}
	
	
	
}
