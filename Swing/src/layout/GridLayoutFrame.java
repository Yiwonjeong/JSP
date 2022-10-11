package layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class GridLayoutFrame extends JFrame{
	
	public GridLayoutFrame(String title, int width, int height){
		setTitle(title);
		setSize(width, height);
		setLocation(2500, 300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 레이아웃
		setLayout(new GridLayout(2, 3));
		
		// 컴포넌트
		JButton b1 = new JButton("1");
		add(b1);
		JButton b2 = new JButton("2");
		add(b2);
		JButton b3 = new JButton("3");
		add(b3);
		JButton b4 = new JButton("4");
		add(b4);
		JButton b5 = new JButton("5");
		add(b5);
		JButton b6 = new JButton("6");
		add(b6);
		
		
		setVisible(true);
	}
	
	
	public static void main(String[] args) {
		new GridLayoutFrame("ContentPaneFrame", 300, 200);
	}
	
}
