package model.products;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

import model.students.Student;

@Embeddable
public class RatingId implements java.io.Serializable{

	
	private Student student;
	private Course course;
	
	@ManyToOne
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	@ManyToOne
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

}
