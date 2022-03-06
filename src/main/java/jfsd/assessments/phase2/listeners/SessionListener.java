package jfsd.assessments.phase2.listeners;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import jfsd.assessments.phase2.util.CrudHelper;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
@WebListener
public class SessionListener implements HttpSessionListener {

	/**
	 * Default constructor. 
	 */
	public SessionListener() {
		super();
		System.out.println("Listener deployed");
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent se) { 
		CrudHelper crud = new CrudHelper();
		se.getSession().setAttribute("crud", crud);
		System.out.println("Session created");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		se.getSession().removeAttribute("crud");
		System.out.println("Session destroyed");
	}
}
