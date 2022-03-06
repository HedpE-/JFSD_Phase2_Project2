package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.Flight;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class FindTravelServlet
 */
@WebServlet("/findTravel")
public class FindTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindTravelServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		int source = tryParseInt(request.getParameter("source"), -1);
		int destination = tryParseInt(request.getParameter("destination"), -1);
		
		HttpSession session = request.getSession();
		try {
			CrudHelper crud = (CrudHelper)session.getAttribute("crud");
			List<Flight> flights = crud.findFlights(startDate, endDate, source, destination);
			session.setAttribute("flightsResult", flights);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
        RequestDispatcher rd = request.getRequestDispatcher("/findFlightsView.jsp");
        rd.forward(request, response);
	}

	private int tryParseInt(String value, int fallbackValue) {
		int source;
		try{
			source = Integer.parseInt(value);
		}
		catch(Exception e) {
			source = fallbackValue;
		}
		return source;
	}
}
