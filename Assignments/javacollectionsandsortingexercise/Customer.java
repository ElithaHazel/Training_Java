package javacollectionsandsortingexercise;

public class Customer {
	private Long customerId;
	private String customerName;
	private Integer customerTier;
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(Long customerId, String customerName, Integer customerTier) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.customerTier = customerTier;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public Integer getCustomerTier() {
		return customerTier;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", customerTier="
				+ customerTier + "]";
	}
	
	
}
