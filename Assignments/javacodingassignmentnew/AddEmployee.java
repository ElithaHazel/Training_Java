package javacodingassignmentnew;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AddEmployee {

	private static List<Employee> listOfEmployee = new ArrayList();

	public void addEmployee(Employee emp) {
		listOfEmployee.add(emp);
	}

	public Employee getEmployee(int id) {
		
//		listOfEmployee.forEach(System.out::println);
		
		for (Employee emp : listOfEmployee) {
			if (emp.getEmpId() == id) {
				return emp;
			}
		}
		return null;
	}

	public static void main(String[] args) {

		AddEmployee addEmployee = new AddEmployee();

		addEmployee.addEmployee(new Employee(1, "Sana", "Delhi"));
		addEmployee.addEmployee(new Employee(2, "Vishal", "Patna"));
		addEmployee.addEmployee(new Employee(3, "Pince", "Trupathi"));
		addEmployee.addEmployee(new Employee(4, "Latha", "Srinagar"));
		addEmployee.addEmployee(new Employee(5, "Lisa", "Hyderabad"));
		
		listOfEmployee.forEach(System.out::println);

		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the Employee Id :");
		int searchId = sc.nextInt();
		Employee foundEmployee = addEmployee.getEmployee(searchId);
		if (foundEmployee != null) {
			System.out.println("Employee found: " + foundEmployee);
		} else {
			System.out.println("Employee with ID " + searchId + " not found.");
		}

	}

}
