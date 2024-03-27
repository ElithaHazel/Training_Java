package CoreJavaAssignments;

public class Square extends Quadrilateral {
	public Square(int side) {
        super(side, side);
    }
 
    @Override
    public double area() {
        return getBase() * getHeight();
    }
}
