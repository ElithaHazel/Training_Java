package javacodingassignmentnew;

import java.util.Scanner;

public class MainNumber {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the Number:");
		int a=sc.nextInt();
		Number num=new Number();
		System.out.println(a+ " is prime: " + (num.checkIsPrime(a) == 1));
        System.out.println(a+ " is an Armstrong number: " + num.checkIsArmstrong(a));
        System.out.println(a+ " is a palindrome: " + num.checkIsPalindrome(a));
		
	}
	

}
