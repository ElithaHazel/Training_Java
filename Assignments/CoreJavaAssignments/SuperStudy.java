package CoreJavaAssignments;

public class SuperStudy {
	
	public void X()
	{ System.out.println("I am in SuperStudy.X()"); }
 
	public static void main(String[] args)
	{
		System.out.println("Question 1 : ");
		SuperStudyChild ssc = new SuperStudyChild();
		ssc.X();
	}
}
class SuperStudyChild extends SuperStudy
{
	public void X()
	{
		super.X();
		System.out.println("I am in SuperStudyChild.X()");
	}
}
