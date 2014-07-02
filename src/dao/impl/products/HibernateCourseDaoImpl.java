package dao.impl.products;

import model.products.Course;
import utils.DatabaseName;
import dao.impl.GenericHibernateDaoImpl;
import dao.interf.products.CourseDaoInterface;

/**
 * @author Pawe³
 *
 */
public class HibernateCourseDaoImpl extends GenericHibernateDaoImpl<Course> implements CourseDaoInterface{

	@Override
	protected String getModelName() {
		return Course.class.getSimpleName();
	}

	@Override
	protected DatabaseName getDatabaseName() {
		return DatabaseName.WSPOLNA;
	}

}
