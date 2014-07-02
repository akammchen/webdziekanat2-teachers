package main.samples.students;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import model.products.Course;
import model.students.PersonalNumber;
import model.students.Student;
import dao.impl.products.HibernateCourseDaoImpl;
import dao.impl.students.HibernatePersonalNumberDaoImpl;
import dao.impl.students.HibernateStudentDaoImpl;
import dao.interf.products.CourseDaoInterface;
import dao.interf.students.PersonalNumberDaoInterface;
import dao.interf.students.StudentDaoInterface;

/**
 * @author PaweÅ‚
 * 
 */
public class StudentSample {
	private StudentDaoInterface studentDaoInterface;
	// do rownoczesnego dodania indeksu dla danego studenta
	private PersonalNumberDaoInterface personalNumberDaoInterface;

	public StudentSample() {
		this.studentDaoInterface = new HibernateStudentDaoImpl();
		this.personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
	}

	public void addStudentAndPersonalNumber() {
		// student
		Student student = new Student();
		student.setFirstname("Janek");
		student.setLastname("Kowal");
		student.setAddress("wawa");

		// index
		PersonalNumber personalNumber = new PersonalNumber();
		personalNumber.setPassword("54321");
		personalNumber.setPersonalNumber(168811);

		// poÅ‚Ä…czenie student z index
		personalNumber.setStudent(student);
		student.getPersonalNumbers().add(personalNumber);

		// dodanie do bazy
		studentDaoInterface.add(student);
		personalNumberDaoInterface.add(personalNumber);

	}

	public void printAllStudents() {

		List students = studentDaoInterface.getAll();

		java.util.Iterator iterator = students.iterator();

		while (iterator.hasNext()) {
			Student student = (Student) iterator.next();
			//System.out.println("STUDENT");
			System.out.println(student);
		}

	}

	public void addStudent() {
		Student student = new Student();
		student.setFirstname("Jan");
		student.setLastname("Kowalski");
		student.setAddress("90-300 £ódŸ, Wólczañska 123");
		studentDaoInterface.add(student);
	}

	// do usuwania wystarczy ustawic id w Student i potem tylko
	// studentDaoInterface.remove(student);
	public void removeFirstStudent() {

		Student student = null;

		// get all students
		List students = studentDaoInterface.getAll();
		if (students.size() > 0) {
			student = (Student) students.get(0);
		}

		System.out.println("first student id=" + student.getId());

		// remove
		if (student != null) {
			studentDaoInterface.remove(student);
		}
	}

	// do edycji wystarczy ustawic id w Student i potem tylko
	// studentDaoInterface.update(student);
	public void updateFirstStudent() {
		Student student = null;

		// get all students
		List students = studentDaoInterface.getAll();
		if (students.size() > 0) {
			student = (Student) students.get(0);
		}

		System.out.println("first student id=" + student.getId());

		// zmien imie
		student.setFirstname("Pawel");

		// remove
		if (student != null) {
			studentDaoInterface.update(student);
		}
	}

	// odkomentuj wywolanie jezeli chcesz przetestowac
	public static void main(String[] args) {
		StudentSample studentSample = new StudentSample();

		// dodaj studenta
//		 studentSample.addStudent();

		// wyswietl all students
		studentSample.printAllStudents();

		// przyklad - usun
		// studentSample.removeFirstStudent();

		// przyklad - update
		// studentSample.updateFirstStudent();

		// dodaje index i studenta
		// studentSample.addStudentAndPersonalNumber();

		// dodanie do kursu kilku studentow
		// Student s1=new Student();
		// s1.setFirstname("firstnam1e");
		// s1.setLastname("lastname1");
		// s1.setAddress("address1");
		//
		// Student s2=new Student();
		// s2.setFirstname("firstname2");
		// s2.setLastname("lastname2");
		// s2.setAddress("address2");
		//
		// Course c1=new Course("name1", "des1", 1);
		//
		// Set<Student> students=new HashSet<Student>();
		// students.add(s1);
		// students.add(s2);
		//
		//
		// c1.setStudents(students);
		//
		// CourseDaoInterface cdao = new HibernateCourseDaoImpl();
		// cdao.add(c1);

	}
}
