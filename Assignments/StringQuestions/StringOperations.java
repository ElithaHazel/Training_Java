package StringQuestions;

public class StringOperations {

	public static void main(String[] args) {
		//2
		System.out.println("Question 2 : ");
		String hannah =new String("Did Hannah see bees? Hannah did.");
		System.out.println("Length of hannah : "+hannah.length());
		System.out.println("Character At index 12 in hannah : "+hannah.charAt(12));
		System.out.println("Refering 'b' in hannah : "+hannah.indexOf("b"));
		//3
		System.out.println("Question 3 : ");
		String st = new String("Was it a car or a cat I saw?");
		System.out.println("Substring of st from index 9 to 12 : "+st.substring(9, 12));

	}

}
