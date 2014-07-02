package dao.impl.students;

import utils.DatabaseName;
import model.students.Student;
import dao.impl.GenericHibernateDaoImpl;
import dao.interf.students.StudentDaoInterface;

/**
 * @author Paweł
 *
 */
public class HibernateStudentDaoImpl extends GenericHibernateDaoImpl<Student>
		implements StudentDaoInterface {



	@Override
	protected DatabaseName getDatabaseName() {
		return DatabaseName.WSPOLNA;
	}

	@Override
	protected String getModelName() {
		return Student.class.getSimpleName();
	}

}
