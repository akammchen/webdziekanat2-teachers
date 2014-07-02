package model.products;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Pawe³
 * 
 */
@Entity
@Table(name = "course")
public class Course implements java.io.Serializable {

	private Long id;

	private String name;

	private String description;

	private Integer ects;

	public Course() {
	}

	public Course(String name, String description, Integer ects) {
		this.name = name;
		this.description = description;
		this.ects = ects;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "ects")
	public Integer getEcts() {
		return ects;
	}

	public void setEcts(Integer ects) {
		this.ects = ects;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", description="
				+ description + ", ects=" + ects + "]";
	}

	@Id
	@GeneratedValue
	@Column(name = "course_id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private Set<Rating> ratings = new HashSet<Rating>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.course")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

}
