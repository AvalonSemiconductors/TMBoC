import java.io.*;
import javax.swing.JOptionPane;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;

public class FrameDisplay {
	private FrameDisplay() {}

	public static void main(String[] args) {
		try {
			BufferedImage img = new BufferedImage(720, 400, BufferedImage.TYPE_INT_RGB);
			FileInputStream fis = new FileInputStream(new File(args[0]));
			fis.skip(4);
			for(int i = 0; i < img.getHeight(); i++) {
				for(int j = 0; j < img.getWidth(); j++) {
					//fis.skip(1);
					int r = fis.read() & 0xFF;
					img.setRGB(j, i, r | (r << 8) | (r << 16));
					fis.skip(3);
				}
			}
			fis.close();
			JOptionPane.showMessageDialog(null, new ImageIcon(img));
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
