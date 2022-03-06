package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.Airline;
import jfsd.assessments.phase2.entity.Flight;
import jfsd.assessments.phase2.entity.Place;
import jfsd.assessments.phase2.entity.User;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({ "/adminMasterlist", "/add", "/delete" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getRequestURI();
		if(action.contains("adminMasterlist")) {
			User user = (User)request.getSession().getAttribute("user");
			if(user.getRole().equals("admin")) {
				String view = request.getParameter("view");

				if(view != null && view != "") {
					HttpSession session = request.getSession();

					CrudHelper crud = (CrudHelper)session.getAttribute("crud");
					switch(view) {
					case "places":
						var places = crud.getPlaces();
						session.setAttribute("viewContext", places);
						break;
					case "airlines":
						var airlines = crud.getAirlines();
						session.setAttribute("viewContext", airlines);
						break;
					case "flights":
						var flights = crud.findFlights(0);
						session.setAttribute("viewContext", flights);
						break;
					default:
						response.sendRedirect("index.jsp");
						return;
					}
					response.sendRedirect("adminMasterlist.jsp?view=" + view);
				}
				else {
					response.sendRedirect("index.jsp");
				}
			}
			else {
				response.sendRedirect("index.jsp");
			}
		}
		else {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user.getRole().equals("admin")) {
			String view = request.getParameter("view");
			if(view != null && view != "") {
				CrudHelper crud = (CrudHelper)session.getAttribute("crud");
				
				if(view.equals("change-password")) {
					String password = request.getParameter("password");
					String rpassword = request.getParameter("rpassword");
					if(password.equals(rpassword)) {
						user.setPassword(password);
						crud.updateUser(user);
						response.sendRedirect(request.getRequestURI());
					}
					else {
						
					}
				}
				else {
					String uriParts[] = request.getRequestURI().split("\\/");
					String action = uriParts[uriParts.length - 1];

					if(action.equals("delete")) {
						String id = request.getParameter("id");
						switch(view) {
						case "places":
							crud.deletePlace(Integer.parseInt(id));
							break;
						case "airlines":
							crud.deleteAirline(Integer.parseInt(id));
							break;
						case "flights":
							crud.deleteFlight(Integer.parseInt(id));
							break;
						}
					}
					else if(action.equals("add")) {
						String name = request.getParameter("name");
						String country = request.getParameter("country");
						String description = request.getParameter("description");
						String source = request.getParameter("source");
						String destination = request.getParameter("destination");
						String depart_date = request.getParameter("depart_date");
						String return_date = request.getParameter("return_date");
						String airline_name = request.getParameter("airline");
						String price = request.getParameter("price");
						switch(view) {
						case "places":
							Place place = new Place();
							place.setName(name);
							place.setCountry(country);
							place.setDescription(description);
							crud.addPlace(place);
							break;
						case "airlines":
							Airline airline = new Airline();
							airline.setName(name);
							crud.addAirline(airline);
							break;
						case "flights":
							Flight flight = new Flight();
							flight.setSource_id(Integer.parseInt(source));
							flight.setDestination_id(Integer.parseInt(destination));
							flight.setDepart_date(depart_date);
							flight.setReturn_date(return_date);
							flight.setAirline_id(Integer.parseInt(airline_name));
							flight.setPrice(Float.parseFloat(price));
							crud.addFlight(flight);
							break;
						}				
					}
					response.sendRedirect("adminMasterlist?view=" + view);
				}
			}
			else
				response.sendRedirect("index.jsp");
		}
		else
			response.sendRedirect("index.jsp");
	}
}
