package StringQuestions;

public class ComputeResult {

	public static void main(String[] args) {
		//4
		System.out.println("Question 4 : ");
		String original = "software";
		System.out.println(original.length());
		StringBuffer result = new StringBuffer("hi");
		int index = original.indexOf('a');
		System.out.println(index);
		/*1*/result.setCharAt(0, original.charAt(0));
		System.out.println(result);
		/*2*/ result.setCharAt(1, original.charAt(original.length()-1));
		System.out.println(result);
		/*3*/ result.insert(1, original.charAt(4));
		System.out.println(result);
		/*4*/ result.append(original.substring(1,4));//end index-1
		System.out.println(result);
		/*5*/ result.insert(3, (original.substring(index, index+2) + " "));
		System.out.println(result);

	}

}
