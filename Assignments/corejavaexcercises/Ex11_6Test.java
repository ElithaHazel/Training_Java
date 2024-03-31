package corejavaexcercises;

class Ex11_6 {
	
	public int a, b;
	public int c = 2;
	public static int x = 6;

}

public class Ex11_6Test {
	public static void main(String[] args) {
		//1
		System.out.println("Question 1 : ");

		Ex11_6 instanceA = new Ex11_6();
		Ex11_6 instanceB = new Ex11_6();

		instanceA.a = 8;
		instanceB.b = instanceA.x;
		instanceA.x++;
		instanceB.a = 10;
		instanceB.c = 90;
		instanceB.x++;
		
		System.out.println("Value Of instanceA.a : "+instanceA.a);
		System.out.println("Value Of instanceB.b : "+instanceB.b);
		System.out.println("Value Of instanceA.x : "+instanceA.x);
		System.out.println("Value Of instanceB.a : "+instanceB.a);
		System.out.println("Value Of instanceB.c : "+instanceB.c);
		System.out.println("Value Of instanceB.x : "+instanceB.x);
	}

}
