package jfsd.assessments.phase2.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.PersistenceException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jfsd.assessments.phase2.entity.User;
import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 /**
	  * @see HttpServlet#HttpServlet()
	  */
	 public RegisterServlet() {
	     super();
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirect = request.getParameter("redirect");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		boolean admin_request=request.getParameter("admin_request") != null;

		String password=request.getParameter("password");
		String rpassword=request.getParameter("rpassword");
		
		RequestDispatcher rd;
		
		final String regex = "^(.+)@(.+)\\.(.+)$";

		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		if(matcher.matches()) {
			if(password.equals(rpassword))	{
				CrudHelper crud = (CrudHelper)request.getSession().getAttribute("crud");
				try {
					crud.registerUser(new User(uname, fname, lname, email, password, admin_request ? "admin" : "customer"));
					String dispatch = "login?username="+uname+"&password="+password;
					if(redirect != null && redirect != "")
						dispatch += "&redirect=" + redirect;
					rd = request.getRequestDispatcher(dispatch);
					rd.forward(request, response);
				}
				catch(PersistenceException e) {
					String dispatch = "register.jsp";
					if(redirect != null && redirect != "")
						dispatch += "?redirect=" + redirect;
					rd=request.getRequestDispatcher(dispatch);
					PrintWriter out = response.getWriter();
					rd.include(request,  response);
					out.println("<center> <span style='color:red'>"+e.getCause().getCause().getMessage()+"</span></center>");
				}
			}
			else {
				String dispatch = "register.jsp";
				if(redirect != null && redirect != "")
					dispatch += "?" + redirect;
				rd=request.getRequestDispatcher(dispatch);
				PrintWriter out = response.getWriter();
				rd.include(request,  response);
				out.println("<center> <span style='color:red'>Password and confirmation must match</span></center>");
			}
		}
		else {
			String dispatch = "register.jsp";
			if(redirect != null && redirect != "")
				dispatch += "?redirect=" + redirect;
			rd=request.getRequestDispatcher(dispatch);
			PrintWriter out = response.getWriter();
			rd.include(request,  response);
			out.println("<center> <span style='color:red'>Invalid Email</span></center>");
		}
	}

}
