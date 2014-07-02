package model.products;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import model.students.Student;

@Entity
@Table(name = "rating")
@AssociationOverrides({
		@AssociationOverride(name = "pk.student", joinColumns = @JoinColumn(name = "student_id")),
		@AssociationOverride(name = "pk.course", joinColumns = @JoinColumn(name = "course_id")) })
public class Rating implements java.io.Serializable {

	private RatingId pk = new RatingId();

	public Rating() {
	}

	@EmbeddedId
	public RatingId getPk() {
		return pk;
	}

	@Transient
	Course getCourse() {
		return pk.getCourse();
	}

	public void setCourse(Course c) {
		pk.setCourse(c);
	}

	@Transient
	Student getStudent() {
		return pk.getStudent();
	}

	public void setStudent(Student s) {
		pk.setStudent(s);
	}

	public void setPk(RatingId ratingId) {
		this.pk = ratingId;
	}

	@Column(name = "rating")
	private Integer rating;

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

}
