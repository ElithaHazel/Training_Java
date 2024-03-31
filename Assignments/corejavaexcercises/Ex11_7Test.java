package corejavaexcercises;

public class Ex11_7Test {

	public static void main(String[] args) {
		//2
		System.out.println("Question 2 : ");
		
		int[] nInPack = { 5, 10, 10 };
		Capsule[][] pack = new Capsule[3][];
		for (int i = 0; i < pack.length; i++) {
			pack[i] = new Capsule[nInPack[i]];
			for (int j = 0; j < pack[i].length; j++) {
				pack[i][j] = new Capsule(0.5, "Formular" + i + j);
			}
		}
		System.out.println(Capsule.nCapsules);
	}
}
