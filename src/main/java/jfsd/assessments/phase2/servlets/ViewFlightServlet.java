package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.Flight;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class ViewFlightServlet
 */
@WebServlet("/viewFlight")
public class ViewFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFlightServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var id = request.getParameter("id");

		CrudHelper crud = (CrudHelper)request.getSession().getAttribute("crud");
		Flight flight = crud.getFlight(Integer.parseInt(id));
		HttpSession session = request.getSession();
		session.setAttribute("currentFlight", flight);
		
		response.sendRedirect("flightDetails.jsp");
//        RequestDispatcher rd = request.g*
	}

}
