package javacodingassignmentnew;

public class Number {
	public int checkIsPrime(int x) {
		if (x <= 1) {
			return 0;
		}
		for (int i = 2; i * i <= x; i++) {
			if (x % i == 0) {
				return 0;
			}
		}
		return 1;
	}

	public boolean checkIsArmstrong(int x) {
		int ON = x;
		int result = 0;
		int Number = String.valueOf(x).length();
		while (ON != 0) {
			int digit = ON % 10;
			result += Math.pow(digit, Number);
			ON /= 10;
		}
		return result == x;

	}

	public boolean checkIsPalindrome(int x) {
		int originalNumber = x;
		int reversedNumber = 0;

		while (originalNumber != 0) {
			int digit = originalNumber % 10;
			reversedNumber = reversedNumber * 10 + digit;
			originalNumber /= 10;
		}

		return reversedNumber == x;
	}

}
