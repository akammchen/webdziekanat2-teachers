package dao.impl.students;

import utils.DatabaseName;
import model.students.PersonalNumber;
import dao.impl.GenericHibernateDaoImpl;
import dao.interf.students.PersonalNumberDaoInterface;

/**
 * @author Paweł
 * 
 */
public class HibernatePersonalNumberDaoImpl extends
		GenericHibernateDaoImpl<PersonalNumber> implements
		PersonalNumberDaoInterface {

	@Override
	protected DatabaseName getDatabaseName() {
		return DatabaseName.WSPOLNA;
	}

	@Override
	protected String getModelName() {
		return PersonalNumber.class.getSimpleName();
	}

}
