package model.students;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//PersonalNumber oznacza index
/**
 * @author Paweł
 *
 */
@Entity
@Table(name = "personal_number")
public class PersonalNumber implements java.io.Serializable{

	@Id
	@GeneratedValue
	@Column(name = "personal_number_id")
	private Long id;
	@Column(name = "personal_number")
	private Integer personalNumber;
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	@Column(name = "password")
	private String password;
	@Column(name = "is_administrator")
	private String  is_administrator;
	@Column(name = "is_student")
	private String  is_student;


	
	
	@Override
	public String toString() {
		return "PersonalNumber [id=" + id + ", personalNumber="
				+ personalNumber + ", student=" + student + ", password="
				+ password + ", is_administrator=" + is_administrator
				+ ", is_student=" + is_student + "]";
	}

	public Long getId() {
		return id;
	}

	public Integer getPersonalNumber() {
		return personalNumber;
	}

	public void setPersonalNumber(Integer personalNumber) {
		this.personalNumber = personalNumber;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIs_administrator() {
		return is_administrator;
	}

	public void setIs_administrator(String is_administrator) {
		this.is_administrator = is_administrator;
	}

	public String getIs_student() {
		return is_student;
	}

	public void setIs_student(String is_student) {
		this.is_student = is_student;
	}

	
	
	

}
