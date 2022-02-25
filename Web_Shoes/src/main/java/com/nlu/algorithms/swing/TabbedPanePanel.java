package com.nlu.algorithms.swing;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListCellRenderer;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.UIManager;

import java.awt.AlphaComposite;
import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.awt.image.ComponentColorModel;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.border.Border;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.ColorUIResource;

import javax.swing.JEditorPane;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JList;
import javax.swing.JComboBox;
import javax.swing.JTextField;

public class TabbedPanePanel extends JPanel {
	private JTabbedPane tabs;
	private JPanel sysPanTab, asysPanTab, hashTab;

	public TabbedPanePanel() {
		Gui();

	}

	public void Gui() {
		setLayout(new BorderLayout(0, 0));

		Color bgc = new Color(0, 100, 220, 50);
		Color fgc = new Color(220, 220, 250, 10);
		UIManager.put("TabbedPane.contentAreaColor", fgc);
		UIManager.put("ComboBox.background", new ColorUIResource(Color.lightGray));
		UIManager.put("ComboBox.selectionBackground", new ColorUIResource(Color.white));
		UIManager.put("ComboBox.selectionForeground", new ColorUIResource(Color.black));
		UIManager.put("TabbedPane.shadow", fgc);
		UIManager.put("TabbedPane.darkShadow", fgc);
		UIManager.put("TabbedPane.light", fgc);
		UIManager.put("TabbedPane.highlight", fgc);
		UIManager.put("TabbedPane.tabAreaBackground", fgc);
		UIManager.put("TabbedPane.unselectedBackground", fgc);
		UIManager.put("TabbedPane.background", fgc);
		UIManager.put("TabbedPane.foreground", Color.WHITE);
		UIManager.put("TabbedPane.focus", fgc);
		UIManager.put("TabbedPane.selected", fgc);
		UIManager.put("TabbedPane.selectHighlight", fgc);
		UIManager.put("TabbedPane.borderHightlightColor", fgc);

		tabs = new JTabbedPane();
		tabs.setBackground(fgc);

		sysPanTab = new SymmectricPanel();
		asysPanTab = new AsymmetricPanel();
		hashTab = new HashPanel();

		tabs.addTab("Symmetric", sysPanTab);
		tabs.addTab("Asymmetric", asysPanTab);
		tabs.add("HashText", hashTab);

		JPanel panelFileText = new JPanel(new BorderLayout()) {
			private Image myBG = new ImageIcon(getClass().getResource("")).getImage();

			@Override
			public void paintComponent(Graphics g) {
				super.paintComponent(g);
				g.drawImage(myBG, 0, 0, getWidth(), getHeight(), this);
			}
		};
		panelFileText.setLayout(new BorderLayout(0, 0));
		panelFileText.add(tabs);
		panelFileText.setBorder(BorderFactory.createEmptyBorder(2, 2, 2, 2));
		add(panelFileText);
		setVisible(true);
	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JPanel sysmetricPane = new TabbedPanePanel();
		frame.getContentPane().add(sysmetricPane);
		frame.setSize(734, 590);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}

}