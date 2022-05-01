import java.io.*;

import static org.junit.Assert.assertEquals;

public class KWICTest {

	private PrintStream console = null;
	private ByteArrayOutputStream bytes = null;
	private KWIC kwic;
	private String lineBreak;

	private FileInputStream fileInputStream;

	@org.junit.Before
	public void setUp() {

		bytes = new ByteArrayOutputStream();
		console = System.out;

		kwic = new KWIC();
		lineBreak = System.getProperty("line.separator");
		System.setOut(new PrintStream(bytes));
	}

	@org.junit.After
	public void tearDown() {
		System.setOut(console);
	}

	@org.junit.Test
	public void testPlus1() {
		int len;
		byte[] data={};
		kwic.input("Test_Case.txt");
		kwic.circularShift();
		kwic.alphabetizing();
		kwic.output();

		try {
			fileInputStream = new FileInputStream("Test_Result.txt");
			len = fileInputStream.available();
			data = new byte[len];
			fileInputStream.read(data);

		} catch (IOException e) {
			e.printStackTrace();
		}
		assertEquals(bytes.toString(), new String(data));

	}
	@org.junit.Test
	public void testPlus2() {
		int len;
		byte[] data={};
		kwic.input("Test_Case2.txt");
		kwic.circularShift();
		kwic.alphabetizing();
		kwic.output();

		try {
			fileInputStream = new FileInputStream("Test_Result2.txt");
			len = fileInputStream.available();
			data = new byte[len];
			fileInputStream.read(data);

		} catch (IOException e) {
			e.printStackTrace();
		}
		assertEquals(bytes.toString(), new String(data));
	}


}
