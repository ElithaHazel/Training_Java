package CoreJavaAssignments;

public class Parallelogram extends Quadrilateral{
	public Parallelogram(int base, int height) {
        super(base, height);
    }
 
    @Override
    public double area() {
        return getBase() * getHeight();
    }
}
