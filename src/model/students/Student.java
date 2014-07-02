package model.students;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.products.Rating;

/**
 * @author Paweł
 * 
 */
@Entity
@Table(name = "student")
public class Student implements java.io.Serializable {

	private Long id;

	private String lastname;

	private String firstname;

	private List<PersonalNumber> personalNumbers;

	private Set<Rating> ratings = new HashSet<Rating>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.student", cascade = CascadeType.ALL)
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	private String address;

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Student() {
		// personalNumbers = new ArrayList<PersonalNumber>();
	}

	@Id
	@GeneratedValue
	@Column(name = "student_id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLastname() {
		return lastname;
	}

	@Column(name = "lastname")
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@Column(name = "firstname")
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	@OneToMany(mappedBy = "student")
	public List<PersonalNumber> getPersonalNumbers() {
		return personalNumbers;
	}

	public void setPersonalNumbers(List<PersonalNumber> personalNumbers) {
		this.personalNumbers = personalNumbers;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", lastname=" + lastname + ", firstname="
				+ firstname + ", address=" + address + "]";
	}

}
