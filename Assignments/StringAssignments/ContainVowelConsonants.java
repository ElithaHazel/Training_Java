package StringAssignments;

import java.util.Scanner;

public class ContainVowelConsonants {

	public static void main(String[] args) {
		System.out.println("Question 2 : ");
		//2
		Scanner s=new Scanner(System.in);
		System.out.print("Enter a input: ");
		 String t = s.nextLine();
		 s.close();
		 t=t.toUpperCase();
		 t=t.toLowerCase();
		 int vowels=0;
		 int consonants=0;
		 for(int i=0;i<t.length();i++) {
			 char ch=t.charAt(i);
			 if(ch>='a'&& ch<='z') {
				 if(ch=='a'||ch=='e'||ch=='i'||ch=='o'||ch=='u') {
					 vowels++;
				 }
				 else {
					 consonants++;
				 }
			 }
		 }
		 System.out.println("Number of vowels:"+vowels);
		 System.out.println("Number of Consonants:"+consonants);

	}

}
