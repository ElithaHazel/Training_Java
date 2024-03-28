package workingwithfiles;

import java.io.File;
import java.util.Scanner;

public class FileNameSearch {

	public static void main(String[] args) {
		System.out.println("Question 1 : ");
		Scanner sc= new Scanner(System.in);
        System.out.print("Enter the file extension : ");
        String fileExtension = sc.nextLine();
        System.out.print("Enter the directory path to search: ");
        String searchDirectory = sc.nextLine();
        //Approach 1
        
        //Operations or Process starts
        File dir = new File(searchDirectory);
        String[] filesInDirectory = null;
        if(dir.isDirectory()) {
        	filesInDirectory = dir.list();
        }
        for(String s : filesInDirectory) {
        System.out.println(s);
        }
       
        if (filesInDirectory != null) {
            System.out.println("Matching files:");
            for (String sFile : filesInDirectory) {
            	String[] fileDetails = sFile.split("[.]");
            	if((fileDetails[1]).equals(fileExtension)) {
            		System.out.println("File found with name : "+sFile);
            	}
            }
        } else {
            System.out.println("No files found in the specified directory.");
        }
        
	}

}

