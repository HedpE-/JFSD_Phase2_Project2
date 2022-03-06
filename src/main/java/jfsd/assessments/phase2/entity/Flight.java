package jfsd.assessments.phase2.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name="Flight")
@Table(name="flights")
public class Flight {
	@Id
	private int id;
	private String depart_date;
	private String return_date;
	private int source_id;
	@ManyToOne
	@JoinColumn(name = "source_id", referencedColumnName = "id", insertable=false, updatable=false)
	private Place source_place;
	private int destination_id;
	@ManyToOne
	@JoinColumn(name = "destination_id", referencedColumnName = "id", insertable=false, updatable=false)
	private Place destination_place;
	private int airline_id;
	@ManyToOne
	@JoinColumn(name = "airline_id", referencedColumnName = "id", insertable=false, updatable=false)
	private Airline airline;
	private float price;
	@Transient
	private final String db_date_format = "yyyy-MM-dd HH:mm:ss";

	public int getId() {
		return id;
	}
	
	public String getDepart_date() {
		return depart_date;
	}
	
	public String getDepart_date(String format) {
		try {

			String newFormat = new SimpleDateFormat(format).format(new SimpleDateFormat(db_date_format).parse(depart_date));
			return newFormat;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return depart_date;
	}
	
	public void setDepart_date(String depart_date) {
		this.depart_date = depart_date;
	}
	
	public String getReturn_date() {
		return return_date;
	}
	
	public String getReturn_date(String format) {
		try {

			String newFormat = new SimpleDateFormat(format).format(new SimpleDateFormat(db_date_format).parse(return_date));
			return newFormat;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return return_date;
	}
	
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	
	public int getSource_id() {
		return source_id;
	}
	
	public void setSource_id(int source_id) {
		this.source_id = source_id;
	}
	
	public int getDestination_id() {
		return destination_id;
	}
	
	public void setDestination_id(int destination_id) {
		this.destination_id = destination_id;
	}
	
	public Place getSource_place() {
		return source_place;
	}
	
	public Place getDestination_place() {
		return destination_place;
	}
	
	public int getAirline_id() {
		return airline_id;
	}
	
	public void setAirline_id(int airline_id) {
		this.airline_id = airline_id;
	}
	
	public float getPrice() {
		return price;
	}
	
	public void setPrice(float price) {
		this.price = price;
	}
	
	public Airline getAirline() {
		return airline;
	}
}
