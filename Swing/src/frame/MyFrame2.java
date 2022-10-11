package frame;

import javax.swing.JFrame;

public class MyFrame2 extends JFrame {
	
	public MyFrame2() {
		setTitle("First Frame");
		setSize(300, 300);
		setLocation(300, 300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public static void main(String[] args) {

		MyFrame2 mf = new MyFrame2();
		
	}
}
