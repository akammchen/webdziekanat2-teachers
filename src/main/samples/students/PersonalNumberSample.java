package main.samples.students;

import java.util.List;

import model.students.PersonalNumber;
import model.students.Student;
import dao.impl.students.HibernatePersonalNumberDaoImpl;
import dao.interf.students.PersonalNumberDaoInterface;
import dao.interf.students.StudentDaoInterface;

/**
 * @author Paweł
 *
 */
public class PersonalNumberSample {
	PersonalNumberDaoInterface personalNumberDaoInterface;

	public PersonalNumberSample() {
		personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
	}

	public static void main(String[] args) {
		//wszystko dziala tak samo jak w StudentSample.java oraz CourseSample.java
		PersonalNumberSample personalNumbersample = new PersonalNumberSample();
		personalNumbersample.printAllPersonalNumbers();
	}

	public String printAllPersonalNumbers() {
		
		
		
		
String ret="";
		List personalNumber = personalNumberDaoInterface.getAll();

		java.util.Iterator iterator = personalNumber.iterator();

		while (iterator.hasNext()) {
			PersonalNumber student = (PersonalNumber) iterator.next();

			ret+=student;
			System.out.println("PERSONAL NUMBER");
			System.out.println(student);

		}

		return ret;
	}
}
