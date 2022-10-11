package layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.border.Border;

public class BorderLayoutFrame extends JFrame{
	
	public BorderLayoutFrame(String title, int width, int height) {
		setTitle(title);
		setSize(width, height);
		setLocation(2500,300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(new BorderLayout());
		
		// 레이아웃 
		setLayout(new BorderLayout(20, 20));
		
		// 컴포넌트 추가 
		JButton b1 = new JButton("CENTER");
		add(b1, BorderLayout.CENTER);
		
		JButton b2 = new JButton("WEST");
		add(b2, BorderLayout.WEST);
		
		JButton b3 = new JButton("EAST");
		add(b3, BorderLayout.EAST);
		
		JButton b4 = new JButton("NORTH");
		add(b4, BorderLayout.NORTH);
		
		JButton b5 = new JButton("SOUTH");
		add(b5, BorderLayout.SOUTH);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new BorderLayoutFrame("ContentPaneFrame", 300, 200);
	}
	
}
