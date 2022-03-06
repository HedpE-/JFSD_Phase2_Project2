package jfsd.assessments.phase2.entity;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="User")
@Table(name="users")
public class User {

	@Column(insertable=false)
	private String create_time;
	@Id
	private String username;
	@Column(name = "first_name")
	private String fname;
	@Column(name = "last_name")
	private String lname;
	private String email;
	private String password;
	private String role;
	@OneToMany
	@JoinColumn(name = "username", referencedColumnName = "username", insertable=false, updatable=false)
	private List<Booking> bookings;

	public User() { }
	
	public User(String username, String fname, String lname, String email, String password, String role) {
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	public User(String username, String fname, String lname, String email, String password) {
		this(username, fname, lname, email, password, "customer");
	}

	public Timestamp getCreate_time() {
		final SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
	        return new Timestamp(DATE_TIME_FORMAT.parse(create_time).getTime());
	    } catch (ParseException e) {
	        throw new IllegalArgumentException(e);
	    }
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean validatePassword(String password) {
		return this.password.equals(password);
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public List<Booking> getBookings() {
		return bookings;
	}

	@Override
	public String toString() {
		return "LoginUser [email=" + email + ", password=" + password + "]";
	}
}
