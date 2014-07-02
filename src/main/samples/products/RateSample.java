package main.samples.products;

import java.util.Iterator;
import java.util.List;

import model.products.Course;
import model.products.Rating;
import model.students.Student;
import dao.impl.products.HibernateRatingDaoImpl;
import dao.interf.products.RatingDaoInterface;

public class RateSample {

	public static void printRatings() {

		RatingDaoInterface ratingDaoInterface = new HibernateRatingDaoImpl();

		List ratings = ratingDaoInterface.getAll();

		Iterator iterator = ratings.iterator();

		while (iterator.hasNext()) {
			Rating rating = (Rating) iterator.next();
			// ocena
			System.out.println("rate=" + rating.getRating());

			// jak sie dobrac do info jakiego kursu dotyczny ta ocena
			Course course = rating.getPk().getCourse();

			System.out.println("id_course=" + course.getId());
			System.out.println("name_ourse=" + course.getName());
			System.out.println("ects_course=" + course.getEcts());
			System.out.println("decription_course=" + course.getDescription());

			// teraz info na temat studenta ktorego dotyczny da ocena
			Student student = rating.getPk().getStudent();
			System.out.println("student_firstname=" + student.getFirstname());
			System.out.println("student_lastname=" + student.getLastname());
			System.out.println("student_address=" + student.getAddress());
			System.out.println("student_id=" + student.getId());

			System.out.println();
		}

	}

	public static void addRateToStudentAndCurse() {

		RatingDaoInterface ratingDaoInterface = new HibernateRatingDaoImpl();

		// dla studena o id=5
		Student student = new Student();
		student.setId(5L);

		// dla kursu o id=2
		Course course = new Course();
		course.setId(2L);

		// ocena
		int ocena = 1;

		// ustawiamy Rating
		Rating rating = new Rating();
		rating.setCourse(course);
		rating.setStudent(student);
		rating.setRating(ocena);

		// dodajmy do bazy
		ratingDaoInterface.add(rating);

	}

	public static void addRatingToStudentA() {

		RatingDaoInterface ratingDaoInterface = new HibernateRatingDaoImpl();

		// dla studena o id=5
		Student student = new Student();
		student.setId(5L);

		// dla kursu o id=2
		Course course = new Course();
		course.setId(2L);

		// ocena
		int ocena = 1;

		// ustawiamy Rating
		Rating rating = new Rating();
		rating.setCourse(course);
		rating.setStudent(student);
		rating.setRating(ocena);

		// dodajmy do bazy
		ratingDaoInterface.add(rating);

	}

	public static void removeRatingFromStudentAndCourse() {

		RatingDaoInterface ratingDaoInterface = new HibernateRatingDaoImpl();

		// dla studena o id=5
		Student student = new Student();
		student.setId(5L);

		// dla kursu o id=2
		Course course = new Course();
		course.setId(2L);

		// ustawiamy Rating
		Rating rating = new Rating();
		rating.setCourse(course);
		rating.setStudent(student);

		// dodajmy do bazy
		ratingDaoInterface.remove(rating);

	}

	public static void updateRatingFromStudentAndCourse() {

		RatingDaoInterface ratingDaoInterface = new HibernateRatingDaoImpl();

		// dla studena o id=5
		Student student = new Student();
		student.setId(5L);

		// dla kursu o id=2
		Course course = new Course();
		course.setId(2L);

		int nowaOcena = 5;

		// ustawiamy Rating
		Rating rating = new Rating();
		rating.setCourse(course);
		rating.setStudent(student);
		// UPDATE - nowa ocena
		rating.setRating(nowaOcena);

		// dodajmy do bazy
		ratingDaoInterface.update(rating);

	}

	public static void main(String[] args) {
		// wyswietl
		// printRatings();

		// dodaj ocene
		// addRateToStudentAndCurse();

		// zmiana oceny
		// updateRatingFromStudentAndCourse();

		// usun wpis oceny
		// removeRatingFromStudentAndCourse();

	}
}
