package event;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.border.Border;

public class ActionEvent_ex extends JFrame{
	
	public ActionEvent_ex(String title, int width, int height) {
		setTitle(title);
		setSize(width, height);
		setLocation(2500,300);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// 레이아웃 
		setLayout(new FlowLayout());
		
		// 컴포넌트 추가
		JButton btn = new JButton("Action");
		MyActionListener listener = new MyActionListener();
		btn.addActionListener(listener);
		add(btn);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new ActionEvent_ex("Action Event example", 300, 200);
	}
	
}

class MyActionListener implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton b = (JButton) e.getSource();
		String n =b.getText();
		if(n.equals("Action")) {
			b.setText("액션!");
		}else {
			b.setText("Action");
		}
	}
	
}
