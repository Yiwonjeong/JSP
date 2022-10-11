package frame;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class ContentPaneFrame extends JFrame{
	
	public ContentPaneFrame(String title, int width, int height) {
		setTitle(title);
		setSize(width, height);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(new BorderLayout());
		
		// 레이아웃 
	   setLayout(new FlowLayout());
	   
	   // 배경
	   Container c = getContentPane();
	   c.setBackground(Color.ORANGE);
		
		// 컴포넌트 추가 
		JButton b1 = new JButton("OK");
		add(b1);
		
		JButton b2 = new JButton("Cancel");
		add(b2);
		
		JButton b3 = new JButton("Ignore");
		add(b3);
		
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new ContentPaneFrame("ContentPaneFrame", 300, 200);
	}
	
}
