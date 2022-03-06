package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jfsd.assessments.phase2.entity.User;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirect = request.getParameter("redirect");
		String username = request.getParameter("username");
		String password = request.getParameter("password");	

		HttpSession session = request.getSession();
		
		CrudHelper crud = (CrudHelper)session.getAttribute("crud");
		User user = crud.getUser(username);
		
		if(user.validatePassword(password)) {
			session.setAttribute("user", user);
			if(redirect == null || redirect == "")
				redirect = "index.jsp";
		}
		else {
			if(redirect != null && redirect != "")
				redirect = "login.jsp?redirect=" + redirect;
			else
				redirect = "login.jsp";
		}
		
		response.sendRedirect(redirect);
	}

}
