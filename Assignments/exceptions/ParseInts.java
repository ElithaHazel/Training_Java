package exceptions;

import java.util.Scanner;

public class ParseInts {

	public static void main(String[] args) {
		System.out.println("Que-2: Placing Exception Handling ");
		int val,sum=0;
		Scanner scan=new Scanner(System.in);
		//String line;
		System.out.println("Enter a line of text : ");
		Scanner scanLine=new Scanner(scan.nextLine());
		while(scanLine.hasNext()) {
			try {
				val=Integer.parseInt(scanLine.next());
				sum+=val;
				
			}catch(NumberFormatException e) {
				
			}	
		}
		System.out.println("The sum of the integers on this line is "+sum+".");

	}

}
