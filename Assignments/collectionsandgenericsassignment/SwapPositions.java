package collectionsandgenericsassignment;

import java.util.Scanner;

public class SwapPositions {

	public static <T> T[] swap(T[] list, int firstPos, int secondPos) {
		if (firstPos < 0 || firstPos >= list.length || secondPos < 0 || secondPos >= list.length) {
			throw new IndexOutOfBoundsException("Invalid index. Ensure both positions are within bounds.");
		}

		T temp = list[firstPos];
		list[firstPos] = list[secondPos];
		list[secondPos] = temp;

		return list;
	}

	public static void main(String[] args) {
		// Example usage:
		Scanner scanner = new Scanner(System.in);
		Integer[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

		System.out.println("Enter the First changing Postion:");
		int fs = scanner.nextInt();
		System.out.println("Enter the Second changing Postion:");
		int ss = scanner.nextInt();

		System.out.println("The Array Elements:");

		for (Integer num : numbers) {
			System.out.print(num + " ");
		}
		System.out.println();
		System.out.println("After Swaping the Array Elements:");
		Integer[] numbers1 = SwapPositions.swap(numbers, fs, ss);
		for (Integer num : numbers1) {
			System.out.print(num + " ");
		}

	}

}
