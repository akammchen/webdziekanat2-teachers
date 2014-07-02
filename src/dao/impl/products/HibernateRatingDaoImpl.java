package dao.impl.products;

import utils.DatabaseName;
import model.products.Course;
import model.products.Rating;
import dao.impl.GenericHibernateDaoImpl;
import dao.interf.GenericDaoInterface;
import dao.interf.products.RatingDaoInterface;

public class HibernateRatingDaoImpl extends GenericHibernateDaoImpl<Rating>
		implements RatingDaoInterface {

	@Override
	protected String getModelName() {
		return Rating.class.getSimpleName();
	}

	@Override
	protected DatabaseName getDatabaseName() {
		return DatabaseName.WSPOLNA;
	}

}
