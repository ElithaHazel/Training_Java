package exceptions;

import java.util.Scanner;

public class CountLetters {

	public static void main(String[] args) {
		System.out.println("Que 1: Exceptions aren't always errors");
		int []  counts=new int[26];
		Scanner sc =new Scanner(System.in);
		
		//get word from user
		System.out.println("Enter a single word(letters only please): ");
		String word=sc.nextLine();
		
		//convert to all uppercase
		word=word.toUpperCase();
		
		//count frequency of each letter in string
		try {
			for(int i=0;i<word.length();i++) {
				counts[word.charAt(i)-'A']++;
			}
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("Not a letter");
			System.out.println(e);
		}
		
		
		//count frequencies
		System.out.println();
				for(int i=0;i<counts.length;i++) {
					if(counts[i]!=0)
						System.out.println((char)(i+'A')+": "+counts[i]);
				}

	}

}
