package StringQuestions;

public class Exercises {

	public static void main(String[] args) {
		// 1
		System.out.println("Exercises -> Question 1 : ");
		String hi = "Hi, ";
		String mom = "mom.";
		// first way
		System.out.println(hi.concat(mom));
		// second way
		System.out.println(hi + mom);
		System.out.println("**********************");
		// 2
		System.out.println("Exercises -> Question 2 : ");
		String name = "Miss Gorimanikonda Elita Hazel";
		System.out.println(name.substring(0, name.indexOf(' ')));
		System.out.println("**********************");
		String fullname = "Miss Gorimanikonda Elita Hazel";
		StringBuffer str = new StringBuffer("");
		for (int i=0;i<fullname.length();i++) { 
			 char val=fullname.charAt(i);
			 if(Character.isUpperCase(val)) { 
				 str.append(fullname.charAt(i)); 
			}else {
				 continue; 
				 }
			} 
		System.out.println(str.substring(1));
		System.out.println("**********************");

	}

}
