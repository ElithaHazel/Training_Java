package StringAssignments;

import java.util.Scanner;

public class ContainStringDigit {

	public static void main(String[] args) {
		System.out.println("Question 1 : ");
		//take input as:
		//ABC1234
		//Hello
		//3456
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter a string: ");  
		String str= sc.nextLine();	
		int count_digit=0;
		int count_string=0;
			
		for(int i=0;i<str.length();i++) {
			char current_char=str.charAt(i);
			if(current_char>='0' && current_char<='9') {
				count_digit++;				
			}else {
				count_string++;
			}
		}
		if(count_digit>0 && count_string>0) {
			System.out.println("It contains a String as well as Digit.");
		}else if(count_digit==0 && count_string>0) {
			System.out.println("It contains only String.");
		}
		else {
			System.out.println("It contains only Digits.");
		}

	}

}
