package dao.interf;

import java.util.List;

/**
 * @author Paweł
 *
 */
public interface GenericDaoInterface<T> {
	
	void add(T item);
	void remove(T item);
	List getAll();
	List getPage(int iPageNo, int iShowRows);
	void update(T item);
}
