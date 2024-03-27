package CoreJavaAssignments;

public abstract class Quadrilateral {
	private int base;
	private int height;
	
	  // Abstract method for calculating area
	public abstract double area();
	
	public Quadrilateral() {
		
	}
	
	public Quadrilateral(int base, int height) {
		super();
		this.base = base;
		this.height = height;
	}
	
	 // Getter and setter methods for base and height
	public int getBase() {
		return base;
	}
	public void setBase(int base) {
		this.base = base;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}

}
