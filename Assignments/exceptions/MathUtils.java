package exceptions;

public class MathUtils {
	public static int factorial(int n) {
		int fac=1;
		try {
			if(n<0) {
				throw new IllegalArgumentException("Its a negative number!");
			}else if(n>16) {
				throw new IllegalArgumentException("It a bigger number to calculate!");
			}	
			else{
				for(int i=n;i>0;i--) {
					fac*=i;
				}	
			}
		}catch(IllegalArgumentException e) {
			throw e;
		}
		return fac;
	}
}
