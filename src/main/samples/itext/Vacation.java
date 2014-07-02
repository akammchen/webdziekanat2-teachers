package main.samples.itext;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.text.AbstractDocument.Content;

import model.students.Student;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.VerticalPositionMark;

import configuration.Config;

public class Vacation {

	public Vacation() {

		 BaseFont bf = null;
		try {
			bf = BaseFont.createFont("c:/windows/fonts/arial.ttf",
					BaseFont.CP1250, BaseFont.EMBEDDED);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 font = new Font(bf, 12);
		  fontbold = new Font(bf, 12, Font.BOLD);
		  normalfont = new Font(bf, 12);
		  dziekanat = new Font(bf, 16, Font.BOLD);
	}
	Font font;
	 Font fontbold ;
	 Font normalfont;
	 Font dziekanat ;

	public  void createVactionPdf(Student st, String filePath) {

		Document document = new Document();

		try {
			PdfWriter.getInstance(document,
					new FileOutputStream(Config.pdfExportFileName));

			document.open();

			PdfPTable table = new PdfPTable(3); // 3 columns.

			PdfPCell cell1 = new PdfPCell();
			Paragraph p = new Paragraph();
			p.add(new Phrase("Imie:",
					fontbold));
			p.add(new Phrase(st.getFirstname(), normalfont));
			cell1.addElement(p);
			PdfPCell cell2 = new PdfPCell();
			Paragraph p2 = new Paragraph();
			p2.add(new Phrase("Nazwisko:", fontbold));
			p2.add(new Phrase(st.getLastname(), normalfont));
			cell2.addElement(p2);
			PdfPCell cell3 = new PdfPCell();
			Paragraph p3 = new Paragraph();
			p3.add(new Phrase("Nr indexu:", fontbold));
			p3.add(new Phrase("165508", normalfont));
			cell3.addElement(p3);

			// ///add img

			PdfPTable table2 = new PdfPTable(1); // 3 columns.
			Image image = Image.getInstance(filePath);
			PdfPCell cell4 = new PdfPCell(image, true);

			cell4.setBorder(3);
			table2.addCell(cell4);
			table2.setWidthPercentage(20);
			// table2.setHorizontalAlignment(Element.ALIGN_LEFT);

			// table2.set
			table.addCell(cell1);
			table.addCell(cell2);
			table.addCell(cell3);
			table2.setSpacingAfter(10);
			// table2.setHorizontalAlignment(10);
			document.add(table2);

			document.add(table);
			PdfPTable pdfPTable = addTable();
			pdfPTable.setSpacingBefore(10);
			document.add(pdfPTable);

			Chunk tab1 = new Chunk(new VerticalPositionMark(), 350, true);
			Paragraph paa = new Paragraph();
			// paa = new Paragraph("dziekanat pl ftims nijncjinicene  eijnec");
			paa.add(new Chunk(tab1));

			// add the origina title
			paa.add(new Chunk("Dziekan wydzialu", dziekanat));

			document.add(paa);
			paa.clear();
			paa.add(new Chunk(tab1));
			// add the origina title
			paa.add(new Chunk("FTIMS", dziekanat));

			document.add(paa);
			paa.clear();
			paa.add(new Chunk(tab1));
			// add the origina title
			paa.add(new Chunk("Politechniki Lodzkiej", dziekanat));

			document.add(paa);
			
			Paragraph contentPdf = new Paragraph();
			contentPdf.add(new Chunk("\nProsze o udzielenie urlopu dziekanskiego "
					+ "w semestrze zimowym roku akademickim 2014/2015\n\nUzasadnienie:\n............................"
					+ "........................................................"
					+ "........................................................"
					+ "......................................................."
					+ "..............................................................."
					+ "..............................................................."
					+ "................................................................"
					+ "................................................................."
					+ "........................................................................"
					+ "..................................................................\n\n"
					+ "Tabela przedmiotow niezaliczonych\n",normalfont));
			document.add(contentPdf);
			document.add(addTable2());
			Paragraph contentPdf2 = new Paragraph();
			contentPdf2.add(new Chunk("\nOplaty naliczone nieuregulowane za:.................................."
					+ "termin platnosci.................... kwota zalegla...............................\n",normalfont));
			document.add(contentPdf2);
			Paragraph contentPdf3= new Paragraph();
			contentPdf3.add(new Chunk("\nmiejscowosc......................., dnia.................",normalfont));
			document.add(contentPdf3);
			
			Chunk tab2 = new Chunk(new VerticalPositionMark(), 350, true);
			Paragraph paa2 = new Paragraph();
			// paa = new Paragraph("dziekanat pl ftims nijncjinicene  eijnec");
			paa2.add(new Chunk(tab2));

			// add the origina title
			paa2.add(new Chunk("....................", normalfont));

			document.add(paa2);
			paa2.clear();
			paa2.add(new Chunk(tab2));

			// add the origina title
			paa2.add(new Chunk("Podpis studenta", normalfont));
			document.add(paa2);
			
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	private  PdfPTable addTable2() {

		PdfPTable table = new PdfPTable(4); // 3 columns.
		table.setWidthPercentage(100);
		try {
			table.setWidths(new int[]{1, 3, 3, 3});
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PdfPCell cell1 = new PdfPCell();
		Paragraph p = new Paragraph();
		p.add(new Phrase("Lp.", fontbold));
		cell1.addElement(p);
		PdfPCell cell2 = new PdfPCell();
		Paragraph p2 = new Paragraph();
		p2.add(new Phrase("Przedmiot", fontbold));
		cell2.addElement(p2);
		PdfPCell cell3 = new PdfPCell();
		Paragraph p3 = new Paragraph();
		p3.add(new Phrase("Semestr", fontbold));
		cell3.addElement(p3);
		PdfPCell cell4 = new PdfPCell();
		Paragraph p4 = new Paragraph();
		p4.add(new Phrase("Liczba punktow", fontbold));
		cell4.addElement(p4);
		table.addCell(cell1);
		table.addCell(cell2);
		table.addCell(cell3);
		table.addCell(cell4);
		for(int j=0;j<3;j++){
		for(int i=0;i<4;i++){
			PdfPCell cell5 = new PdfPCell();
			if(i==0)
			{
				Paragraph p6 = new Paragraph();
				p6.add(new Phrase(new Integer(j+1).toString(), fontbold));
				cell5.addElement(p6);
			}
			else
				cell5.addElement(new Paragraph());
			table.addCell(cell5);
		}
		}
		PdfPCell cell6 = new PdfPCell();
		cell6.setColspan(3);
		Paragraph p6 = new Paragraph();
		p6.add(new Phrase("Laczna liczba punktow brakow z semestrow poprzednich", fontbold));
		cell6.addElement(p6);
		table.addCell(cell6);
		PdfPCell cell5 = new PdfPCell();
		cell5.addElement(new Paragraph());
		table.addCell(cell5);
		PdfPCell cell7 = new PdfPCell();
		cell7.setColspan(3);
		Paragraph p7 = new Paragraph();
		p7.add(new Phrase("Liczba punkow brakow do uzupelnienia w semestrze ..................", fontbold));
		cell7.addElement(p7);
		table.addCell(cell7);
		PdfPCell c = new PdfPCell();
		c.addElement(new Paragraph());
		table.addCell(c);
		PdfPCell cell8 = new PdfPCell();
		cell8.setColspan(3);
		Paragraph p8 = new Paragraph();
		p8.add(new Phrase("Nominalna liczba punktow nowych przedmiotow w semestrze.........................", fontbold));
		cell8.addElement(p8);
		table.addCell(cell8);
		table.addCell(c);
		PdfPCell cell9 = new PdfPCell();
		cell9.setColspan(3);
		Paragraph p9 = new Paragraph();
		p9.add(new Phrase("Laczna liczba punktow do zdobycia w semestrze ...................", fontbold));
		cell9.addElement(p9);
		table.addCell(cell9);
		table.addCell(c);
		
		
		return table;

	}


	private  PdfPTable addTable() {

		PdfPTable table = new PdfPTable(5); // 3 columns.

		PdfPCell cell1 = new PdfPCell();
		Paragraph p = new Paragraph();
		p.add(new Phrase("Kierunek:", fontbold));
		p.add(new Phrase("Informatyka", normalfont));
		cell1.addElement(p);
		cell1.setColspan(2);
		PdfPCell cell2 = new PdfPCell();
		Paragraph p2 = new Paragraph();
		p2.add(new Phrase("Program ksztalcenia:", fontbold));
		p2.add(new Phrase("jakis tam", normalfont));
		cell2.addElement(p2);
		cell2.setColspan(3);
		PdfPCell cell11 = new PdfPCell();
		Paragraph p3 = new Paragraph();
		p3.add(new Phrase("Rok:", fontbold));
		p3.add(new Phrase("1", normalfont));
		cell11.addElement(p3);

		PdfPCell cell12 = new PdfPCell();
		Paragraph p4 = new Paragraph();
		p4.add(new Phrase("Semestr:", fontbold));
		p4.add(new Phrase("1", normalfont));
		cell12.addElement(p4);

		PdfPCell cell13 = new PdfPCell();
		Paragraph p5 = new Paragraph();
		p5.add(new Phrase("Rodzaj studiow:", fontbold));
		p5.add(new Phrase("stacjonarne", normalfont));
		cell13.addElement(p5);

		PdfPCell cell14 = new PdfPCell();
		Paragraph p6 = new Paragraph();
		p6.add(new Phrase("Stopien studiow:", fontbold));
		p6.add(new Phrase("I st. licencjackie", normalfont));
		cell14.addElement(p6);

		PdfPCell cell15 = new PdfPCell();
		Paragraph p7 = new Paragraph();
		p7.add(new Phrase("Miejsce prowadzenia zajec:", fontbold));
		p7.add(new Phrase("1", normalfont));
		cell15.addElement(p7);

		table.addCell(cell1);
		table.addCell(cell2);
		table.addCell(cell11);
		table.addCell(cell12);
		table.addCell(cell13);
		table.addCell(cell14);
		table.addCell(cell15);

		return table;

	}

}
