package jfsd.assessments.phase2.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import jfsd.assessments.phase2.entity.*;

public class HibernateUtility {

	private static StandardServiceRegistry registry;
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			Configuration configuration = new Configuration();
			InputStream propertiesInputStream = null;
			try {
				Properties props = new Properties();

				propertiesInputStream = HibernateUtility.class.getClassLoader().getResourceAsStream("/db.properties");
				props.load(propertiesInputStream);

				String driver = props.getProperty("javax.persistence.jdbc.driver");
				String url = props.getProperty("javax.persistence.jdbc.url");
				String uname = props.getProperty("javax.persistence.jdbc.user");
				String pwd = props.getProperty("javax.persistence.jdbc.password");
				String dialect = props.getProperty("hibernate.dialect");
				String show_sql = props.getProperty("hibernate.show_sql");
				String timezone = props.getProperty("hibernate.timezone");
				String hbm2ddl = props.getProperty("hibernate.hbm2ddl.auto");
				Class.forName(driver);

				Properties settings = new Properties();
				settings.put(Environment.DRIVER, driver);
				settings.put(Environment.URL, url);
				settings.put(Environment.USER, uname);
				settings.put(Environment.PASS, pwd);
				settings.put(Environment.DIALECT, dialect);
				settings.put(Environment.SHOW_SQL, show_sql);
				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
				settings.put(Environment.ENABLE_LAZY_LOAD_NO_TRANS, "true");
				settings.put(Environment.HBM2DDL_AUTO, hbm2ddl);
				settings.put(Environment.JDBC_TIME_ZONE, timezone);

				configuration.setProperties(settings);

				configuration.addAnnotatedClass(User.class);
				configuration.addAnnotatedClass(Flight.class);
				configuration.addAnnotatedClass(Airline.class);
				configuration.addAnnotatedClass(Booking.class);
				configuration.addAnnotatedClass(Place.class);

				registry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();

				sessionFactory = configuration.buildSessionFactory(registry);

			} catch (Exception e) {
				e.printStackTrace();
				if (registry != null) {
					StandardServiceRegistryBuilder.destroy(registry);
				}
			}

			finally {
				try {
					propertiesInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return sessionFactory;
	}

	public static void shutdown() {
		if (registry != null) {
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}
}