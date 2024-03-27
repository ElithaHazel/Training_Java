package StringAssignments;

import java.util.Scanner;

public class ReverseString {

	public static void main(String[] args) {
		System.out.println("Question 4 : ");
		//
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter a input: ");
		 String a = sc.nextLine();
		 sc.close();
		 String reversedString=reverseStringRecursively(a);
		 System.out.println("Original text:"+a);
		 System.out.println("Reversed text:"+reversedString);
		}
		//recursion
		public static String reverseStringRecursively(String a) {
			if(a.isEmpty()) {
				return a;
			}
			//method recursively calls itself with the substring
			//exclude the first character,append it to the end
			return reverseStringRecursively(a.substring(1))+a.charAt(0);
		}

}
