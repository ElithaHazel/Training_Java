package CoreJavaAssignments;

public class Main2 {

	public static void main(String[] args) {
		Square square = new Square(5);
        System.out.println("Area of square: " + square.area());
 
        Rectangle rectangle = new Rectangle(4, 6);
        System.out.println("Area of rectangle: " + rectangle.area());
 
        Parallelogram parallelogram = new Parallelogram(7, 3);
        System.out.println("Area of parallelogram: " + parallelogram.area());

	}

}
