package workingwithfiles;

import java.util.Map;

public class Main3 {

	public static void main(String[] args) {
		String filePath = "D:\\country.csv";
	    Map<String, String> countryCapitalMap = CountryMap.loadCsvFileToMap(filePath);
	    char startsWith = 'I'; // no country name start with s actually
	    String outputFile = "D:\\country_filter.txt";
	    CountryMap.writeFilteredCountries(outputFile, countryCapitalMap, startsWith);
	    System.out.println("Filtered countries have been written to the file.");
	}

}
