package com.nlu.algorithms.swing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;
import com.nlu.algorithms.algorithms.Hash;
import com.nlu.algorithms.handleFile.HandleFile;

public class HashPanel extends JPanel {
	private JComboBox<Object> jcbHash;
	private JButton saveBtn;
	private JPanel pannel;
	private JTextArea arInput, arOutput;
	private JTextField tfInput, tfOutput;
	private JButton inputBtn, outputBtn, clearBtn2, clearBtn3, startBtn;
	private File inputFile, outputFile;
	private String inputText, outputText;
	private List<String> hash;

	public HashPanel() {
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
		TitledBorder titledBorder7 = BorderFactory.createTitledBorder("Input");
		titledBorder7.setTitleJustification(TitledBorder.CENTER);
		titledBorder7.setTitleColor(Color.BLACK);
		panInput.setLayout(new FlowLayout());

		panInput.setBorder(titledBorder7);
		panInput.setBounds(10, 120, 695, 165);

		pannel.add(panInput);

		TitledBorder titledBorder8 = BorderFactory.createTitledBorder("Output");
		titledBorder8.setTitleJustification(TitledBorder.CENTER);
		titledBorder8.setTitleColor(Color.BLACK);
		JPanel panOutput = new JPanel();
		panOutput.setLayout(new FlowLayout());
		panOutput.setBounds(10, 295, 695, 165);
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

		JPanel pa = new JPanel();
		TitledBorder titledBorder2 = BorderFactory.createTitledBorder("PROPERTY");
		titledBorder2.setTitleJustification(TitledBorder.CENTER);
		titledBorder2.setTitleColor(Color.BLACK);
		pa.setBorder(titledBorder2);
		pa.setLayout(null);
		pa.setBounds(255, 11, 240, 101);
		pannel.add(pa);

		JLabel alg = new JLabel("Algorithms : ");
		alg.setForeground(Color.BLACK);
		alg.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		alg.setBounds(10, 35, 100, 30);
		pa.add(alg);

		hash = Arrays.asList("MD5", "SHA-1", "SHA-256");
		jcbHash = new JComboBox<Object>();
		jcbHash.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbHash.setModel(new DefaultComboBoxModel<>(hash.toArray()));
		jcbHash.setSelectedIndex(0);
		jcbHash.setBounds(120, 35, 110, 30);
		pa.add(jcbHash);

		JPanel panJSC2 = new JPanel();
		panJSC2.setPreferredSize(new Dimension(670, 102));
		panJSC2.setLayout(new BorderLayout(0, 0));
		panInput.add(panJSC2);

		arInput = new JTextArea();
		JScrollPane jscinput = new JScrollPane(arInput);
		panJSC2.add(jscinput);

		tfInput = new JTextField();
		tfInput.setEnabled(false);
		panInput.add(tfInput);
		tfInput.setPreferredSize(new Dimension(400, 22));

		inputBtn = new JButton("Choose");
		inputBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		inputBtn.setPreferredSize(new Dimension(80, 23));
		inputBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser2 = new JFileChooser();
				fileChooser2.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser2.showOpenDialog(pannel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					inputFile = new File(fileChooser2.getSelectedFile().getAbsolutePath());
					tfInput.setText(inputFile.getPath());

					inputText = HandleFile.handleReadFile(inputFile);
					arInput.setText(inputText);
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfInput.setText("no such file");
				}
			}
		});
		panInput.add(inputBtn);

		clearBtn2 = new JButton("Clear");
		clearBtn2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearBtn2.setPreferredSize(new Dimension(80, 23));
		clearBtn2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arInput.setText(null);
				tfInput.setText(null);
			}
		});
		panInput.add(clearBtn2);
		JPanel panJSC3 = new JPanel();
		panJSC3.setPreferredSize(new Dimension(670, 102));
		panJSC3.setLayout(new BorderLayout(0, 0));
		panOutput.add(panJSC3);

		arOutput = new JTextArea();
		arOutput.setEnabled(false);
		JScrollPane jscouput = new JScrollPane(arOutput);
		panJSC3.add(jscouput);

		tfOutput = new JTextField();
		tfOutput.setEnabled(false);
		panOutput.add(tfOutput);
		tfOutput.setPreferredSize(new Dimension(400, 22));

		outputBtn = new JButton("Save");
		outputBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		outputBtn.setPreferredSize(new Dimension(80, 23));
		outputBtn.setEnabled(false);
		outputBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser2 = new JFileChooser();
				fileChooser2.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser2.showSaveDialog(pannel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					outputFile = new File(fileChooser2.getSelectedFile().getAbsolutePath());
					tfOutput.setText(outputFile.getPath());

					outputText = arOutput.getText();
					HandleFile.handleWriteFile(outputText, outputFile);
					JOptionPane.showMessageDialog(pannel, "Saved");

				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfOutput.setText("no such file");
				}
			}
		});
		panOutput.add(outputBtn);

		clearBtn3 = new JButton("Clear");
		clearBtn3.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearBtn3.setPreferredSize(new Dimension(80, 23));
		clearBtn3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arOutput.setText(null);
				tfOutput.setText(null);
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
				String text = arInput.getText();
				String algorithm = jcbHash.getSelectedItem().toString();
				if (text.trim().isEmpty()) {
					JOptionPane.showMessageDialog(pannel, "Input is empty");
					return;
				}
				try {
					byte[] hashBytes = Hash.hash(text, algorithm);
					String hash = Hash.bytesToHex(hashBytes);
					arOutput.setText(hash);
					arOutput.setEnabled(true);
					outputBtn.setEnabled(true);
					tfInput.setText(null);
					tfOutput.setText(null);
				} catch (Exception ex) {
					JOptionPane.showMessageDialog(pannel, ex.getMessage());
				}

			}
		});
		panClick.add(startBtn);

	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JPanel sysmetricPane = new HashPanel();
		frame.getContentPane().add(sysmetricPane);
		frame.setSize(734, 590);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
