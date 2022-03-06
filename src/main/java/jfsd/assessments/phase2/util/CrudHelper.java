package jfsd.assessments.phase2.util;

import java.util.List;

import javax.persistence.criteria.CompoundSelection;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import jfsd.assessments.phase2.entity.Airline;
import jfsd.assessments.phase2.entity.Booking;
import jfsd.assessments.phase2.entity.Flight;
import jfsd.assessments.phase2.entity.Place;
import jfsd.assessments.phase2.entity.User;

public class CrudHelper {
	private SessionFactory factory = HibernateUtility.getSessionFactory();

	public CrudHelper() {
	}
	
	//
	// Users
	//
	
	public User getUser(String username)
	{
		User user = null;
		Session session = null;
		try {
			session = factory.openSession();
			Query<User> query = session.createQuery("from User where username=:username", User.class);
			query.setParameter("username", username);
			user = query.getSingleResult();	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(session != null && session.isOpen())
					session.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}	
		return user;
	}
	
	public void registerUser(User user)
	{
		add(user);
	}
	
	public void updateUser(User user)
	{
		update(user);
	}
	
	//
	// Flights
	//
	
	public List<Flight> findFlights(String start_date, String end_date, int source_id, int destination_id)
	{
		Session session = null;
		try {
			String conditions = "";
			if(start_date != null && start_date != "") {
				if(conditions == "")
					conditions += " where ";
				conditions += "depart_date>=:start_date";	
			}
			if(end_date != null && end_date != "") {
				if(conditions == "")
					conditions += " where ";
				else
					conditions += " and ";
				conditions += "return_date<=:end_date";	
			}
			if(source_id > -1) {
				if(conditions == "")
					conditions += " where ";
				else
					conditions += " and ";
				conditions += "source_id=:source";	
			}
			if(destination_id > -1) {
				if(conditions == "")
					conditions += " where ";
				else
					conditions += " and ";
				conditions += "destination_id=:destination";	
			}

			session = factory.openSession();
			Query<Flight> query = session.createQuery("from Flight" + conditions, Flight.class);
			if(start_date != null && start_date != "")
				query.setParameter("start_date", start_date);
			if(end_date != null && end_date != "")
				query.setParameter("end_date", end_date);
			if(source_id > -1)
				query.setParameter("source", source_id);
			if(destination_id > -1)
				query.setParameter("destination", destination_id);			
			
			List<Flight> flights = query.list();
			return flights;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(session != null && session.isOpen())
					session.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}	
		return null;
	}
	
	public List<Flight> findFlights(int maxRows)
	{
		return getQueryList(Flight.class, maxRows);
	}

	public Flight getFlight(int id)
	{
		return getEntityById(Flight.class, id);
	}
	
	public void addFlight(Flight flight)
	{
		add(flight);
	}
	
	public boolean deleteFlight(Flight flight)
	{
		return delete(flight);
	}
	
	public boolean deleteFlight(int id)
	{
		Flight flight = getFlight(id);
		return delete(flight);
	}
	
	public void updateFlight(Flight flight)
	{
		update(flight);
	}
	
	//
	// Bookings
	//

	public Booking getBooking(int id) {
		return getEntityById(Booking.class, id);
	}

	public void insertBooking(Booking booking) {
		add(booking);
	}
	
	public void cancelBooking(Booking booking)
	{
		update(booking);
	}
	
	//
	// Airlines
	//

	public List<Airline> getAirlines()
	{
		return getQueryList(Airline.class, 0);
	}

	public Airline getAirline(int id)
	{
		return getEntityById(Airline.class, id);
	}

	public Airline getAirlineByName(String name)
	{
		return getEntityByName(Airline.class, name);
	}
	
	public void addAirline(Airline airline)
	{
		add(airline);
	}
	
	public boolean deleteAirline(Airline airline)
	{
		return delete(airline);
	}
	
	public boolean deleteAirline(int id)
	{
		Airline airline = getAirline(id); 
		return delete(airline);
	}
	
	public void updateAirline(Airline airline)
	{
		update(airline);
	}
	
	public List<String> getAllAirlineNames(){
		Session session = factory.openSession();

		CriteriaBuilder builder = session.getCriteriaBuilder();		
		CriteriaQuery<String> query = builder.createQuery(String.class);

		Root<Airline> root = query.from(Airline.class);
		
		CompoundSelection<String> projection = builder.construct(String.class, root.get("name"));
		
		query.distinct(true).select(projection);
		List<String> airlines = session.createQuery(query).getResultList();
		
		return airlines;
	}
	
	//
	// Places
	//

	public List<Place> getPlaces()
	{
		return getQueryList(Place.class, 0);
	}

	public Place getPlace(int id)
	{
		return getEntityById(Place.class, id);
	}
	
	public Place getPlaceByName(String name) {
		return getEntityByName(Place.class, name);
	}
	
	public void addPlace(Place place)
	{
		add(place);
	}
	
	public boolean deletePlace(int id)
	{
		Place place = getPlace(id);
		return delete(place);
	}
	
	public boolean deletePlace(Place place)
	{
		return delete(place);
	}
	
	public void updatePlace(Place place)
	{
		update(place);
	}
	
	public List<String> getAllLocationNames(){
		Session session = factory.openSession();

		CriteriaBuilder builder = session.getCriteriaBuilder();		
		CriteriaQuery<String> query = builder.createQuery(String.class);

		Root<Place> root = query.from(Place.class);
		
		CompoundSelection<String> projection = builder.construct(String.class, root.get("name"));
		
		query.distinct(true).select(projection);
		List<String> locations = session.createQuery(query).getResultList();
		
		return locations;
	}
	
	//
	// Generic operations
	//

	private <T> T getEntityById(Class<T> entityClass, int id)
	{
		Session session = factory.openSession();
		T entity = session.get(entityClass, id);
		session.close();
		return entity;
	}

	private <T> T getEntityByName(Class<T> entityClass, String name)
	{
		Session session = factory.openSession();
		Query<T> query = session.createQuery("from "+ entityClass.getSimpleName() +" WHERE name=:name", entityClass);
		query.setParameter("name", name);
		T airline = query.getSingleResult();
		session.close();
		return airline;
	}

	private <T> List<T> getQueryList(Class<T> entityClass, int maxRows)
	{
		Session session = factory.openSession();;
		Query<T> query = session.createQuery("from " + entityClass.getSimpleName(), entityClass);
		if(maxRows > 0)
			query.setMaxResults(maxRows);
		List<T> list = query.list();
		session.close();
		return list;
	}
	
	private void add(Object obj)
	{
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(obj);
		tx.commit();
		session.close();
	}
	
	private boolean delete(Object obj)
	{
		try {
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			session.delete(obj);
			tx.commit();
			session.close();
			
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	private void update(Object obj)
	{
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(obj);
		tx.commit();
		session.close();
	}
}
