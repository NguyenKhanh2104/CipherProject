package com.nlu.algorithms.swing;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Image;
import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.WindowConstants;
public class MainFrame extends JFrame {
	private JPanel controlPanel;
	private JPanel panelFile;

	public MainFrame() throws IOException {
		prepareGUI();
	}

	private void prepareGUI() throws IOException {
		setTitle("Software Cipher");
		setSize(750, 598);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		controlPanel = new JPanel();
		controlPanel.setLayout(new BorderLayout(0, 0));
		controlPanel.setBounds(0, 0, 734, 560);
		getContentPane().add(controlPanel);
		panelFile = new TabbedPanePanel();
		controlPanel.add(panelFile);
	}

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainFrame frame = new MainFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

}
