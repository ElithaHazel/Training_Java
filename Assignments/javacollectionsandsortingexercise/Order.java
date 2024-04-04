package javacollectionsandsortingexercise;

import java.time.LocalDate;
import java.util.List;

public class Order {
	private Long orderId;
	private LocalDate orderDate;
	private LocalDate deliveryDate;
	private String orderStatus;
	private List<Product> products;
	private Long customerId;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(Long orderId, LocalDate orderDate, LocalDate deliveryDate, String orderStatus, Long customerId) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.deliveryDate = deliveryDate;
		this.orderStatus = orderStatus;
		this.customerId = customerId;
	}
	public Long getOrderId() {
		return orderId;
	}
	public LocalDate getOrderDate() {
		return orderDate;
	}
	public LocalDate getDeliveryDate() {
		return deliveryDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public Long getCustomerId() {
		return customerId;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderDate=" + orderDate + ", deliveryDate=" + deliveryDate
				+ ", orderStatus=" + orderStatus + ", customerId=" + customerId + "]";
	}
	
}	