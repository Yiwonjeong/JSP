package layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.JButton;
import javax.swing.JFrame;

public class FlowLayoutFrame extends JFrame{
	
	public FlowLayoutFrame(String title, int width, int height) {
		setTitle(title);
		setSize(width, height);
		setLocation(2500,300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(new BorderLayout());
		
		// 레이아웃 
		setLayout(new FlowLayout(FlowLayout.CENTER, 20, 30));
		
		// 컴포넌트 추가 
		JButton b1 = new JButton("Button1");
		add(b1);
		
		JButton b2 = new JButton("Button2");
		add(b2);
		
		JButton b3 = new JButton("Button3");
		add(b3);
		
		JButton b4 = new JButton("Button4");
		add(b4);
		
		JButton b5 = new JButton("Button5");
		add(b5);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new FlowLayoutFrame("ContentPaneFrame", 300, 200);
	}
	
}
