import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.awt.*;

public class PlacementPreview {
	public static class Macro {
		public int x,y,w,h;
		public Color c;
		public String name;
		public Macro(int x, int y, int w, int h, Color c, String name) {
			this.x = x;
			this.y = y;
			this.w = w;
			this.h = h;
			this.c = c;
			this.name = name;
		}
	}
	
	public static void main(String[] args) {
		BufferedImage img = new BufferedImage(2920, 3520, BufferedImage.TYPE_INT_RGB);
		
		Macro[] macros = new Macro[] {
			new Macro(2250, 1610, 300, 320, Color.BLACK, "Multiplexer"), //Multiplexer
			new Macro(2250, 2500, 60, 90, Color.GREEN, "4x4 mul"), //multiplier
			new Macro(2600, 2125, 180, 180, Color.RED, "AS5401"), //as5401
			new Macro(2350, 2160, 110, 110, Color.GRAY, "Diceroll"), //Diceroll
			new Macro(2100, 2100, 125, 125, new Color(32, 64, 240), "Badge"), //namebadge
			new Macro(2400, 2500, 60, 90, new Color(32, 240, 64), "MC14500"), //MC14500
			new Macro(2750, 1800, 90, 90, new Color(240, 32, 64), "Timer"), //Multiplexed counter
			new Macro(2000, 1525, 150, 150, new Color(240, 240, 64), "TBB1143"), //TBB1143
			new Macro(2300, 3000, 350, 350, new Color(88, 88, 64), "AS2650"), //AS2650
			
			new Macro(2050, 600, 200, 200, new Color(255, 88, 255), "6502"), //6502
			new Macro(2700, 150, 110, 110, new Color(128, 128, 77), "Tune"), //tune player
			new Macro(2400, 400, 300, 300, new Color(33, 77, 33), "AS1802"), //AS1802
			new Macro(2300, 1000, 350, 350, new Color(28, 77, 111), "Posit unit"), //Posit unit
			
			new Macro(100, 200, 1700, 3200, new Color(111, 255, 111), "AS512512512"), //AS512512512
			
			new Macro(1930, 150, 375, 375, new Color(111, 111, 111), "VGA Test") //AS512512512
		};

		/*Macro[] macros = new Macro[] {
			new Macro(1322, 250, 275, 275, Color.BLACK),
			new Macro(1850, 500, 90, 90, Color.BLACK),
			new Macro(2000, 500, 90, 90, Color.BLACK),
			
			new Macro(167, 2620, 750, 750, Color.GREEN),
			new Macro(1085, 2620, 750, 750, Color.GREEN),
			new Macro(2002, 2620, 750, 750, Color.GREEN),
			
			new Macro(167, 1720, 750, 750, Color.GREEN),
			new Macro(1085, 1720, 750, 750, Color.RED),
			new Macro(2002, 1720, 750, 750, Color.RED),
			
			new Macro(167, 820, 750, 750, Color.RED),
			new Macro(1085, 820, 750, 750, Color.RED),
		};*/

		Graphics2D g = (Graphics2D)img.getGraphics();
		g.setFont(new Font("Dialog", Font.PLAIN, 48));
		for(int i = 0; i < img.getWidth(); i++) for(int j = 0; j < img.getHeight(); j++) img.setRGB(i, j, 0xFFFFFF);
		for(int i = 0; i < macros.length; i++) {
			int x = macros[i].x;
			int y = img.getHeight() - 1 - macros[i].y;
			int w = macros[i].w;
			int h = macros[i].h;
			int rgb = macros[i].c.getRGB();
			
			for(int k = 0; k < 8; k++) {
			
				for(int j = 0; j < w; j++) {
					img.setRGB(x + j, y - k, rgb);
					img.setRGB(x + j, y - h + k, rgb);
				}
				for(int j = 0; j < h; j++) {
					img.setRGB(x + k, y - j, rgb);
					img.setRGB(x + w - 1 - k, y - j, rgb);
				}
				
				g.setColor(macros[i].c);
				g.drawString(macros[i].name, x - 12, y - h - 12);
			}
		}
		
		for(int i = 0; i < img.getWidth(); i++) {
			img.setRGB(i, 0, 0);
			img.setRGB(i, img.getHeight() - 1, 0);
		}
		
		for(int j = 0; j < img.getHeight(); j++) {
			img.setRGB(0, j, 0);
			img.setRGB(img.getWidth() - 1, j, 0);
		}
		
		try {
			ImageIO.write(img, "png", new File("placements.png"));
		}catch(Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
