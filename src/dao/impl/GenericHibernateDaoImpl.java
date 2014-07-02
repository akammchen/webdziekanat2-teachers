package dao.impl;

import java.util.List;

import model.students.PersonalNumber;

import org.hibernate.Query;
import org.hibernate.Session;

import dao.interf.GenericDaoInterface;
import utils.DatabaseName;
import utils.HibernateUtil;

/**
 * @author Paweł
 * 
 */
public abstract class GenericHibernateDaoImpl<T> implements GenericDaoInterface<T> {

	
	protected abstract String getModelName();

	
	protected abstract DatabaseName getDatabaseName();

	public void add(T item) {
		Session session = HibernateUtil.getSessionFactory(getDatabaseName()).openSession();
		session.beginTransaction();
		session.save(item);
		session.getTransaction().commit();
		session.close();
	}

	public void remove(T item) {
		Session session = HibernateUtil.getSessionFactory(getDatabaseName()).openSession();
		session.beginTransaction();
		session.delete(item);

		// or
		// Query q = session.createQuery("delete Student where id=7");
		// q.executeUpdate();

		session.getTransaction().commit();
		session.close();
	}

	public List getAll() {
		Session session = HibernateUtil.getSessionFactory(getDatabaseName()).openSession();
		session.beginTransaction();
		List list = session.createQuery("from " + getModelName()).list();
		session.close();
		return list;
	}
	
	public List getPage(int iPageNo, int iShowRows) {
		Session session = HibernateUtil.getSessionFactory(getDatabaseName()).openSession();
		session.beginTransaction();
		List list = session.createQuery("from " + getModelName()).setFirstResult(iPageNo).setMaxResults(iShowRows).list();
		session.close();
		return list;
	}

	public void update(T item) {
		Session session = HibernateUtil.getSessionFactory(getDatabaseName()).openSession();
		session.beginTransaction();
		session.update(item);

		session.getTransaction().commit();
		session.close();
	}
}
