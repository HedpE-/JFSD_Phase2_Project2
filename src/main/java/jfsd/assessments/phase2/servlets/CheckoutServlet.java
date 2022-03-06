package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import javax.persistence.PersistenceException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.Booking;
import jfsd.assessments.phase2.entity.Flight;
import jfsd.assessments.phase2.entity.User;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Flight flight = (Flight)session.getAttribute("currentFlight");
		
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String postcode = request.getParameter("postcode");
		String seats = request.getParameter("seats");
		
		boolean payment_cc = request.getParameter("paymentMethod").equalsIgnoreCase("on");
		String ccnumber = request.getParameter("cc-number");
		
		RequestDispatcher rd;
		try {
			CrudHelper crud = (CrudHelper)session.getAttribute("crud");
			Booking booking = new Booking();
			booking.setTravel_id(flight.getId());
			booking.setUsername(user.getUsername());
			booking.setAddress(address);
			booking.setAddress2(address2);
			booking.setCountry(country);
			booking.setCity(city);
			booking.setPostcode(postcode);
			booking.setPayment_method(payment_cc ? "credit_card" : null);
			booking.setCc_lastdigits(ccnumber.substring(ccnumber.length() - 4));
			booking.setSeats(Integer.parseInt(seats));
			booking.setTotal_ammount(flight.getPrice() * Integer.parseInt(seats));
			crud.insertBooking(booking);
			
			rd = request.getRequestDispatcher("congrats.jsp?booking="+booking.getId());
			rd.include(request, response);
		}
		catch(PersistenceException e) {
			e.printStackTrace();
			
			rd = request.getRequestDispatcher("checkout.jsp");
			rd.include(request, response);
			response.getWriter().print("<center> <span style='color:red'>"+e.getCause().getCause().getMessage()+"</span></center>");
		}
	}

}
