package jfsd.assessments.phase2.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Airline")
@Table(name="airlines")
public class Airline {

	@Id
	private int id;
	private String name;
	
	public Airline() {
	}
	
	public Airline(String name) {
		this.setName(name);
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
