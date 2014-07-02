package utils;

import javax.naming.Name;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author Paweł
 * 
 */
public class HibernateUtil {

	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory(DatabaseName databaseName) {

		try {
			// Create the SessionFactory from hibernate.cfg.xml
			if (databaseName.equals(DatabaseName.STUDENTS)) {
				sessionFactory = new Configuration().configure(
						"hibernate_students.cfg.xml").buildSessionFactory();
			} else if (databaseName.equals(DatabaseName.PRODUCTS)) {
				sessionFactory = new Configuration().configure(
						"hibernate_products.cfg.xml").buildSessionFactory();
			} else if (databaseName.equals(DatabaseName.WSPOLNA)) {
				sessionFactory = new Configuration().configure(
						"hibernate_wspolna.cfg.xml").buildSessionFactory();
			}
		} catch (Throwable ex) {
			// Make sure you log the exception, as it might be swallowed
			System.err.println("aaaaaaaaaInitial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}

		return sessionFactory;
	}

}