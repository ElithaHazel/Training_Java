package collectionsandgenericsassignment;

import java.util.List;
import java.util.Vector;
 
public class ArithmeticOperations {
	//ADDITION
    public static <T extends Number> Number add(T t1, T t2) {
        return t1.doubleValue() + t2.doubleValue();
    }
    public static <T extends Number> Number add(List<? extends Number> list) {
        double d = 0;
        for (int i = 0; i < list.size(); i++) {
            d += list.get(i).doubleValue();
        }
        return new Double(d);
    }
    //SUBTRACTION
    public static<T extends Number> Number sub(T t1,T t2) {
    	return t1.doubleValue()-t2.doubleValue();
    }
    public static <T extends Number> Number sub(List<? extends Number> list) {
        double d = 0;
        for (int i = 0; i < list.size(); i++) {
            d -= list.get(i).doubleValue();
        }
        return new Double(d);
    }
    //MULTIPLICATION
    public static <T extends Number> Number mul(T t1, T t2) {
        return t1.doubleValue() * t2.doubleValue();
    }
    public static <T extends Number> Number mul(List<? extends Number> list) {
        double d = 0;
        for (int i = 0; i < list.size(); i++) {
            d *= list.get(i).doubleValue();
        }
        return new Double(d);
    }
    //DIVISION
    public static<T extends Number> Number Div(T t1,T t2) {
    	return t1.doubleValue()/t2.doubleValue();
    }
    public static <T extends Number> Number Div(List<? extends Number> list) {
        double d = 0;
        for (int i = 0; i < list.size(); i++) {
            d /= list.get(i).doubleValue();
        }
        return new Double(d);
    }
    
    public static void dumpList(List<?> list) {
        System.out.println("List dump with unbounded wildcard:");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }
 
    public static void main(String[] args) {
    	//Using Integers :
        Integer i1 = new Integer(34), i2 = new Integer(43);
        System.out.println("Adding Integers with generic method: " + ArithmeticOperations.add(i1, i2));
        System.out.println("Subtracting Integers with generic method: " + ArithmeticOperations.sub(i1, i2));
		System.out.println("Multiplying integers with generic method: " + ArithmeticOperations.mul(i1, i2));
        System.out.println("Dividing Integers with generic method: " + ArithmeticOperations.Div(i1, i2));
        System.out.println();
        //Using Float Numbers :
        Float f1 = new Float(12.56), f2 = new Float(3.6778);
        System.out.println("Adding floats with generic method: " + ArithmeticOperations.add(f1, f2));
        System.out.println("Subtracting floats with generic method: " + ArithmeticOperations.sub(f1, f2));
		System.out.println("Multiplying floats with generic method: " + ArithmeticOperations.mul(f1, f2));
        System.out.println("Dividing floats with generic method: " + ArithmeticOperations.Div(f1, f2));
        System.out.println();
        
        Vector<Number> l = new Vector<Number>();
        l.add(new Integer(34));
        l.add(new Integer(43));
        System.out.println("Addition with upper bounded wildcard: " + ArithmeticOperations.add(l));
        System.out.println("Subtraction with upper bounded wildcard: " + ArithmeticOperations.sub(l));
        System.out.println("Multiplication with upper bounded wildcard: " + ArithmeticOperations.mul(l));
        System.out.println("Division with upper bounded wildcard: " + ArithmeticOperations.Div(l));
        System.out.println();
        // Dumping the list to the console.
        ArithmeticOperations.dumpList(l);
    }
}