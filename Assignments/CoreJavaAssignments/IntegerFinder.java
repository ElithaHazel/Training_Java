package CoreJavaAssignments;

public class IntegerFinder {
	//4
	private IntegerListener Listener;
	 
	public IntegerFinder(IntegerListener listener) {
		Listener = listener;
	}
	public void findIntegers(int[] inputArray, int target) {
		for (int i = 0; i < inputArray.length; i++) {
	        if (inputArray[i] == target) {
	            Listener.onIntegerFound(target, i);
	        }
	    }
	}
}
