package layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class NoLayoutFrame extends JFrame{
	
	public NoLayoutFrame(String title, int width, int height){
		setTitle(title);
		setSize(width, height);
		setLocation(2500, 300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 레이아웃
		setLayout(null);
		
		// 컴포넌트
		JButton b1 = new JButton("1");
		b1.setSize(100, 50);
		b1.setLocation(10, 10);
		add(b1);
		
		JButton b2 = new JButton("2");
		b2.setSize(100, 50);
		b2.setLocation(120, 10);
		add(b2);
		
		JButton b3 = new JButton("3");
		b3.setBounds(230, 10, 100, 50);
		add(b3);
		
		
		JButton b4 = new JButton("4");
		b4.setBounds(280, 35, 100, 50);
		add(b4);
		
		JButton b5 = new JButton("5");
		b5.setBounds(230, 60, 100, 50);
		add(b5);
		
		JButton b6 = new JButton("6");
		b6.setBounds(300, 200, 100, 50);
		add(b6);
		
		
		setVisible(true);
	}
	
	
	public static void main(String[] args) {
		new NoLayoutFrame("NoLayout Frame", 300, 200);
	}
	
}
