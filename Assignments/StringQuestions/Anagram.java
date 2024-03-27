package StringQuestions;

import java.util.Arrays;

public class Anagram {

	public static void main(String[] args) {
		//3
		System.out.println("Exercises -> Question 3 : ");
		//give inputs as:
		//Night,Thing
		//Below,Elbow
		//parliament,partial men
		String string1 = "Below";
		String string2 = "Elbow";
		boolean result = areAnagrams(string1, string2);
		if (result) {
			System.out.println("The strings are anagrams.");
		} else {
		    System.out.println("The strings are not anagrams.");
		}
	}
		 
		 public static boolean areAnagrams(String str1, String str2) {
		 // Remove white space and punctuation from both strings
		 String str1Clean = str1.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
		 String str2Clean = str2.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
		 // Check if the sorted characters of both cleaned strings match
		 char[] charArray1 = str1Clean.toCharArray();
		 char[] charArray2 = str2Clean.toCharArray();
		 Arrays.sort(charArray1);
		 Arrays.sort(charArray2);
		 		return Arrays.equals(charArray1, charArray2);
		 }

}

