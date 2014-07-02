package main.samples.products;

import java.util.Iterator;
import java.util.List;

import model.products.Course;
import dao.impl.products.HibernateCourseDaoImpl;
import dao.interf.products.CourseDaoInterface;

/**
 * @author Pawe³
 * 
 */
public class CourseSample {
	public static CourseDaoInterface courseDaoInterface;

	public CourseSample() {
		courseDaoInterface = new HibernateCourseDaoImpl();
	}

	public static void main(String[] args) {
		// pobranie wszystkich
		CourseSample courseSample = new CourseSample();
		courseSample.printAllCourses();

		// dodawanie nowego kursu do bazy
		// Course course=new Course("tpi", "cuda na kiju", 5);
		// courseDaoInterface = new HibernateCourseDaoImpl();
		// courseDaoInterface.add(course);

		// usuniecie kursu o id=3
		// courseDaoInterface = new HibernateCourseDaoImpl();
		// Course c=new Course();
		// c.setId(3L);
		// courseDaoInterface.remove(c);

		// update kursu o id=2, zmiana nazwy na DB2, opisu na
		// "system bazy danych", ects na 0,
		// uwaga: wszystkie wartosci musza byc ustawione tzn id name descrpit
		// ects
		// courseDaoInterface = new HibernateCourseDaoImpl();
		// Course c = new Course();
		// c.setId(2L);
		// c.setName("DB2");
		// c.setDescription("system bazy danych");
		// c.setEcts(0);
		// courseDaoInterface.update(c);
	}

	public String printAllCourses() {
		String ret = "";
		List courses = courseDaoInterface.getAll();

		Iterator iterator = courses.iterator();

		while (iterator.hasNext()) {
			Course course = (Course) iterator.next();
			ret += course;
			System.out.println("COURSE");
			System.out.println(course);

		}
		return ret;
	}
}
