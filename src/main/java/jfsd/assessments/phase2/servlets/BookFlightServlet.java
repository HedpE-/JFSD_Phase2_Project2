package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.Booking;
import jfsd.assessments.phase2.entity.User;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class BookFlightServlet
 */
@WebServlet("/bookFlight")
public class BookFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookFlightServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null) {
			response.sendRedirect("register.jsp?redirect=bookFlight");
		}
		else {
			response.sendRedirect("checkout.jsp");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		if(id != null && id != "") {
			CrudHelper crud = (CrudHelper)session.getAttribute("crud");
			Booking booking = crud.getBooking(Integer.parseInt(id));
			session.setAttribute("currentBooking", booking);
			response.sendRedirect("viewBooking.jsp");
		}
		else {
			session.removeAttribute("currentBooking");
			response.sendRedirect("myFlights.jsp");
		}
	}
}
