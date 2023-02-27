import java.io.*;

public class SamplesFixer {
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream("samples.bin");
			FileOutputStream fos = new FileOutputStream("samples_8.bin");
			while(fis.available() > 0) {
				fos.write(fis.read());
				fis.read();
				fis.read();
				fis.read();
			}
			fos.close();
			fis.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
