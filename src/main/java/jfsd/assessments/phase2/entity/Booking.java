package jfsd.assessments.phase2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name="Booking")
@Table(name="bookings")
public class Booking {
	@Id
	private int id;
	private int travel_id;
	private String username;
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", insertable=false, updatable=false)
	private User user;
	@Column(insertable=false)
	private String create_date;
	@OneToOne
	@JoinColumn(name = "travel_id", referencedColumnName = "id", insertable=false, updatable=false)
	private Flight flight;
	private int seats;
	private String address;
	private String address2;
	private String country;
	private String city;
	private String postcode;
	private String payment_method;
	private String cc_lastdigits;
	private float total_ammount;

	public Booking() {
		
	}

	public Booking(int travel_id) {
		this.travel_id = travel_id;
	}
	
	public int getTravel_id() {
		return travel_id;
	}
	public void setTravel_id(int travel_id) {
		this.travel_id = travel_id;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User getUser() {
		return user;
	}

	public String getCreate_date() {
		return create_date;
	}
	public int getId() {
		return id;
	}	
	public Flight getFlight() {
		return flight;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getCc_lastdigits() {
		return cc_lastdigits;
	}

	public void setCc_lastdigits(String cc_lastdigits) {
		this.cc_lastdigits = cc_lastdigits;
	}

	public float getTotal_ammount() {
		return total_ammount;
	}

	public void setTotal_ammount(float total_ammount) {
		this.total_ammount = total_ammount;
	}
}
