package main.samples.itext;

import model.students.Student;

public class Vmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student st = new Student();
				st.setFirstname("Łukasz");
		st.setLastname("Rowiński");
		
			new Vacation().createVactionPdf(st,"D:/Semestr 1/PBL/webdziekanat2/1.jpeg");
			System.out.println("Rowiński");
	}

}
