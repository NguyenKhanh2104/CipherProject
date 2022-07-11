package com.nlu.algorithms.swing;

import com.nlu.algorithms.algorithms.Hash;
import com.nlu.algorithms.handleFile.HandleFile;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

public class EqualTextPanel extends JPanel {
	private JComboBox<Object> jcbHash;
	private JButton saveBtn;
	private JPanel pannel;
	private JTextArea arInput1, arInput2;
	private JTextField tfInput1, tfIntput2;
	private JButton inputBtn1, intput2Btn, clearBtn2, clearBtn3, startBtn;
	private File inputFile;
	private String inputText;


	public EqualTextPanel() {
		Gui();
	}

	public void Gui() {
		setLayout(new BorderLayout(0, 0));
		pannel = new JPanel();
		Border blackline = BorderFactory.createTitledBorder("");
		pannel.setBorder(blackline);

		add(pannel);
		pannel.setLayout(null);

		TitledBorder titledBorder = BorderFactory.createTitledBorder("MODE");
		titledBorder.setTitleJustification(TitledBorder.CENTER);
		titledBorder.setTitleColor(Color.BLACK);

		JPanel panInput = new JPanel();
		TitledBorder titledBorder7 = BorderFactory.createTitledBorder("First Input");
		titledBorder7.setTitleJustification(TitledBorder.CENTER);
		titledBorder7.setTitleColor(Color.BLACK);
		panInput.setLayout(new FlowLayout());

		panInput.setBorder(titledBorder7);
		panInput.setBounds(10, 20, 695, 215);

		pannel.add(panInput);

		TitledBorder titledBorder8 = BorderFactory.createTitledBorder("Second Input");
		titledBorder8.setTitleJustification(TitledBorder.CENTER);
		titledBorder8.setTitleColor(Color.BLACK);
		JPanel panOutput = new JPanel();
		panOutput.setLayout(new FlowLayout());
		panOutput.setBounds(10, 250, 695, 215);
		panOutput.setBorder(titledBorder8);
		pannel.add(panOutput);

		TitledBorder titledBorder5 = BorderFactory.createTitledBorder("Excute");
		titledBorder5.setTitleJustification(TitledBorder.CENTER);
		titledBorder5.setTitleColor(Color.BLACK);
		JPanel panClick = new JPanel();
		panClick.setLayout(null);
		panClick.setBounds(530, 465, 180, 60);
		panClick.setBorder(titledBorder5);
		pannel.add(panClick);

		JPanel panJSC2 = new JPanel();
		panJSC2.setPreferredSize(new Dimension(670, 150));
		panJSC2.setLayout(new BorderLayout(0, 0));
		panInput.add(panJSC2);

		arInput1 = new JTextArea();
		JScrollPane jscinput = new JScrollPane(arInput1);
		panJSC2.add(jscinput);

		tfInput1 = new JTextField();
		tfInput1.setEnabled(false);
		panInput.add(tfInput1);
		tfInput1.setPreferredSize(new Dimension(400, 22));

		inputBtn1 = new JButton("Choose");
		inputBtn1.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		inputBtn1.setPreferredSize(new Dimension(80, 23));
		inputBtn1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser2 = new JFileChooser();
				fileChooser2.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser2.showOpenDialog(pannel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					inputFile = new File(fileChooser2.getSelectedFile().getAbsolutePath());
					tfInput1.setText(inputFile.getPath());

					inputText = HandleFile.handleReadFile(inputFile);
					arInput1.setText(inputText);
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfInput1.setText("no such file");
				}
			}
		});
		panInput.add(inputBtn1);

		clearBtn2 = new JButton("Clear");
		clearBtn2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearBtn2.setPreferredSize(new Dimension(80, 23));
		clearBtn2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arInput1.setText(null);
				tfInput1.setText(null);
			}
		});
		panInput.add(clearBtn2);
		JPanel panJSC3 = new JPanel();
		panJSC3.setPreferredSize(new Dimension(670, 150));
		panJSC3.setLayout(new BorderLayout(0, 0));
		panOutput.add(panJSC3);

		arInput2 = new JTextArea();
		arInput2.setEnabled(true);
		JScrollPane jscouput = new JScrollPane(arInput2);
		panJSC3.add(jscouput);

		tfIntput2 = new JTextField();
		tfIntput2.setEnabled(false);
		panOutput.add(tfIntput2);
		tfIntput2.setPreferredSize(new Dimension(400, 22));

		intput2Btn = new JButton("Save");
		intput2Btn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		intput2Btn.setPreferredSize(new Dimension(80, 23));
		intput2Btn.setEnabled(false);
		intput2Btn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser2 = new JFileChooser();
				fileChooser2.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser2.showOpenDialog(pannel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					inputFile = new File(fileChooser2.getSelectedFile().getAbsolutePath());
					tfInput1.setText(inputFile.getPath());

					inputText = HandleFile.handleReadFile(inputFile);
					arInput1.setText(inputText);
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfInput1.setText("no such file");
				}
			}
		});
		panOutput.add(intput2Btn);

		clearBtn3 = new JButton("Clear");
		clearBtn3.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearBtn3.setPreferredSize(new Dimension(80, 23));
		clearBtn3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arInput2.setText(null);
				tfIntput2.setText(null);
			}
		});
		panOutput.add(clearBtn3);

		startBtn = new JButton("Start");
		startBtn.setForeground(Color.RED);
		startBtn.setFont(new Font("Segoe UI", Font.BOLD, 18));
		startBtn.setBounds(40, 20, 110, 23);
		startBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				String text1 = arInput1.getText();
				String text2 = arInput2.getText();
				if (text1.trim().isEmpty() || text2.trim().isEmpty()) {
					JOptionPane.showMessageDialog(pannel, "Input is empty");
					return;
				}
				if(text1.equals(text2)){
					JOptionPane.showMessageDialog(pannel, "Input equal!");
					return;
				}else{
					JOptionPane.showMessageDialog(pannel, "Input not equal!");
					return;
				}

			}
		});
		panClick.add(startBtn);

	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JPanel sysmetricPane = new EqualTextPanel();
		frame.getContentPane().add(sysmetricPane);
		frame.setSize(734, 590);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
