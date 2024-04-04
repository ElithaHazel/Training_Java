package javacollectionsandsortingexercise;

public class Product {
	private Long productId;
	private String productName;
	private String category;
	private Double productPrice;
	public Product(Long productId, String productName, String category, Double productPrice) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.category = category;
		this.productPrice = productPrice;
	}
	
	
	public Long getProductId() {
		return productId;
	}


	public void setProductId(Long productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public Double getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}


	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", category=" + category
				+ ", productPrice=" + productPrice + "]";
	}
	
	
}
