package com.nlu.algorithms.swing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;

import com.nlu.algorithms.algorithms.Symmetric;
import com.nlu.algorithms.handleFile.HandleFile;

import javax.swing.JTextArea;

public class SymmectricPanel extends JPanel {
	private ButtonGroup goupBtn;
	private JTextField tfKeyFile, tfInputFile, tfOutputFile, tfKey;
	private File inputFile, outputFile, keyFile;
	private JButton keyBtn, inputBtn, outputBtn, clearbtn, clearbtn2, clearbtn3, startBtn;
	private List<Integer> listKeySize;
	private List<String> listSym, listMode, listPadding;
	private JComboBox<Object> jcbAlg, jcbKey, jcbPadding, jcbMode;
	private String algorithmText, modeText, paddingText, inputText, keyText, outputText, keyTxt, inputTxt, outputTxt;
	private int keySizeSelected;
	private JTextArea arInput, arOutput;
	private JScrollPane jscKey;
	private JCheckBox jcboxAutoKey;
	private JRadioButton radBtnEn, radBtnDe;
	private JPanel panel;
	private byte[] key;
	private Symmetric symmetric;

	public SymmectricPanel() {
		algorithmText = "DES";
		keySizeSelected = 56;
		modeText = null;
		paddingText = null;

		symmetric = new Symmetric(algorithmText, keySizeSelected);
		Gui();
	}

	void Gui() {
		setLayout(new BorderLayout(0, 0));
		panel = new JPanel();
		panel.setLayout(null);
		Border blackline = BorderFactory.createTitledBorder("");
		panel.setBorder(blackline);

		add(panel);

		TitledBorder titledBorder = BorderFactory.createTitledBorder("MODE");
		titledBorder.setTitleJustification(TitledBorder.CENTER);
		titledBorder.setTitleColor(Color.BLACK);
		JPanel panMode = new JPanel();
		panMode.setLayout(null);
		panMode.setBounds(5, 5, 250, 460);
		panMode.setBorder(titledBorder);
		panel.add(panMode);

		radBtnEn = new JRadioButton("Encrypt");
		radBtnEn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		radBtnEn.setBackground(null);
		radBtnEn.setBounds(20, 15, 80, 40);
		radBtnEn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				tfKey.setText("");
				tfKeyFile.setText("");
				tfKey.setEnabled(true);
				keyBtn.setEnabled(true);
				inputBtn.setEnabled(true);
				jcboxAutoKey.setEnabled(true);
				arInput.setText("");
				arInput.setEnabled(true);
				arOutput.setText("");
				tfInputFile.setText("");
				tfOutputFile.setText("");
				if (jcboxAutoKey.isSelected()) {
					keyBtn.setText("Save");
					keyBtn.setEnabled(false);
				} else {
					keyBtn.setText("Choose");
					keyBtn.setEnabled(true);
				}

			}
		});

		radBtnDe = new JRadioButton("Decrypt");
		radBtnDe.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		radBtnDe.setBounds(155, 15, 80, 40);
		radBtnDe.setBackground(null);
		radBtnDe.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				tfKey.setText("");
				tfKeyFile.setText("");
				keyBtn.setText("Open");
				keyBtn.setEnabled(true);
				keyBtn.setEnabled(true);
				arInput.setText("");
				arInput.setEnabled(true);
				arOutput.setText("");
				tfInputFile.setText("");
				tfOutputFile.setText("");
				jcboxAutoKey.setEnabled(false);
			}

		});

		goupBtn = new ButtonGroup();
		goupBtn.add(radBtnEn);
		goupBtn.add(radBtnDe);
		panMode.add(radBtnEn);
		panMode.add(radBtnDe);

		JPanel pa = new JPanel();
		TitledBorder titledBorder2 = BorderFactory.createTitledBorder("PROPERTY");
		titledBorder2.setTitleJustification(TitledBorder.CENTER);
		titledBorder2.setTitleColor(Color.BLACK);
		pa.setBorder(titledBorder2);
		pa.setLayout(null);
		pa.setBounds(5, 60, 240, 130);
		listSym = Arrays.asList("DES", "AES", "DESede", "RC2", "RC4");
		jcbAlg = new JComboBox<Object>();
		jcbAlg.setModel(new DefaultComboBoxModel<>(listSym.toArray()));
		jcbAlg.setSelectedItem(algorithmText);
		jcbAlg.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				algorithmText = jcbAlg.getSelectedItem().toString();

				switch (algorithmText) {
				case "DES":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(56);

					break;
				case "AES":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(128);
					listKeySize.add(192);
					listKeySize.add(256);
					break;
				case "DESede":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(112);
					listKeySize.add(168);
					break;
				case "RC2":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(56);
					listKeySize.add(112);
					listKeySize.add(128);
					listKeySize.add(256);
					break;
				case "RC4":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(56);
					listKeySize.add(112);
					listKeySize.add(128);
					listKeySize.add(256);
					break;
				}
				keySizeSelected = listKeySize.get(0);
				List<String> listKeySizeStr = listKeySize.stream().map(item -> item.toString())
						.collect(Collectors.toList());

				jcbKey.setModel(new DefaultComboBoxModel<Object>(listKeySizeStr.toArray()));

			}
		});
		jcbAlg.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbAlg.setBounds(100, 25, 120, 22);
		pa.add(jcbAlg);

		jcbKey = new JComboBox<Object>(new String[] { ("" + keySizeSelected) });
		jcbKey.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbKey.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				keySizeSelected = Integer.parseInt(jcbKey.getSelectedItem().toString());
			}
		});

		jcbKey.setBounds(100, 68, 120, 22);
		pa.add(jcbKey);

		JLabel keySize = new JLabel("Key Size : ");
		keySize.setForeground(Color.BLACK);
		keySize.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		keySize.setBounds(10, 60, 100, 30);
		pa.add(keySize);

		JLabel alg = new JLabel("Algorithms : ");
		alg.setForeground(Color.BLACK);
		alg.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		alg.setBounds(10, 20, 100, 30);
		pa.add(alg);

		panMode.add(pa);

		JPanel pa2 = new JPanel();
		TitledBorder titledBorder3 = BorderFactory.createTitledBorder("OPTIONS");
		titledBorder3.setTitleColor(Color.BLACK);
		titledBorder3.setTitleJustification(TitledBorder.CENTER);
		pa2.setBorder(titledBorder3);
		pa2.setLayout(null);
		pa2.setBounds(5, 200, 240, 130);

		JLabel alg2 = new JLabel("Mode : ");
		alg2.setSize(100, 30);
		alg2.setLocation(10, 20);
		alg2.setForeground(Color.BLACK);
		alg2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		pa2.add(alg2);

		JLabel keySize2 = new JLabel("Padding : ");
		keySize2.setForeground(Color.BLACK);
		keySize2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		keySize2.setBounds(10, 60, 100, 30);
		pa2.add(keySize2);
		panMode.add(pa2);

		listMode = new ArrayList<String>();
		listMode.add("None");
		listMode.add("CBC");
		listMode.add("ECB");

		jcbMode = new JComboBox<Object>(listMode.toArray());
		jcbMode.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbMode.setSelectedIndex(0);
		jcbMode.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				modeText = jcbMode.getSelectedItem().toString();
				if (modeText.equalsIgnoreCase("None")) {
					jcbPadding.setEnabled(false);
				} else {
					jcbPadding.setEnabled(true);
				}
			}

		});
		jcbMode.setBounds(100, 25, 120, 22);
		pa2.add(jcbMode);

		listPadding = new ArrayList<String>();
		listPadding.add("NoPadding");
		listPadding.add("PKCS5Padding");

		jcbPadding = new JComboBox<Object>(listPadding.toArray());
		jcbPadding.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbPadding.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				paddingText = jcbPadding.getSelectedItem().toString();
			}

		});

		jcbPadding.setBounds(100, 68, 120, 22);
		pa2.add(jcbPadding);

		TitledBorder titledBorder5 = BorderFactory.createTitledBorder("Excute");
		titledBorder5.setTitleJustification(TitledBorder.CENTER);
		titledBorder5.setTitleColor(Color.BLACK);
		JPanel panClick = new JPanel();
		panClick.setLayout(null);
		panClick.setBounds(530, 465, 180, 60);
		panClick.setBorder(titledBorder5);

		startBtn = new JButton("Start");
		startBtn.setForeground(Color.RED);
		startBtn.setFont(new Font("Segoe UI", Font.BOLD, 18));
		startBtn.setBounds(40, 20, 110, 23);
		startBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (arInput.getText().trim().isEmpty()) {
					JOptionPane.showMessageDialog(panel, "Input is empty");
					return;
				}

				symmetric.setAlgorithm(algorithmText);
				symmetric.setKeySize(keySizeSelected);
				symmetric.setMode(modeText);
				symmetric.setPadding(paddingText);

				try {
					inputText = arInput.getText();
					if (radBtnEn.isSelected()) {
						if (jcboxAutoKey.isSelected()) {
							keyText = symmetric.genKey();
							tfKey.setText(keyText);
							tfKey.setEnabled(true);
						} else {
							keyText = tfKey.getText();
						}
						outputText = symmetric.encrypt(inputText, keyText);
						arOutput.setText(outputText);
						arOutput.setEnabled(true);

						keyBtn.setEnabled(true);
						outputBtn.setEnabled(true);
					} else if (radBtnDe.isSelected()) {
						outputText = symmetric.decrypt(inputText, tfKey.getText());
						System.out.println(outputText);
						arOutput.setText(outputText);
						outputBtn.setEnabled(true);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
					JOptionPane.showMessageDialog(panel, ex.getMessage());
				}

			}

		});
		panClick.add(startBtn);
		panel.add(panClick);

		JPanel panGenKey = new JPanel();
		TitledBorder titledBorder6 = BorderFactory.createTitledBorder("Key");
		titledBorder6.setTitleJustification(TitledBorder.CENTER);
		titledBorder6.setTitleColor(Color.BLACK);

		panGenKey.setBorder(titledBorder6);
		panGenKey.setLayout(new FlowLayout());
		panGenKey.setBounds(254, 5, 456, 120);
		panel.add(panGenKey);

		JPanel panJSC = new JPanel();
		panJSC.setPreferredSize(new Dimension(346, 50));
		panJSC.setLayout(new BorderLayout(0, 0));
		panGenKey.add(panJSC);

		tfKey = new JTextField();
		tfKey.setEnabled(false);
		tfKey.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		jscKey = new JScrollPane(tfKey);
		panJSC.add(jscKey);
		panGenKey.add(panJSC);

		jcboxAutoKey = new JCheckBox("AutoGen");
		jcboxAutoKey.setEnabled(false);
		jcboxAutoKey.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		jcboxAutoKey.setSize(75, 30);
		jcboxAutoKey.setPreferredSize(new Dimension(75, 40));
		jcboxAutoKey.setLocation(350, 20);
		jcboxAutoKey.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (jcboxAutoKey.isSelected()) {
					keyBtn.setText("Save");
					keyBtn.setEnabled(false);
					tfKey.setEnabled(false);
				} else {
					tfKeyFile.setEnabled(true);
					keyBtn.setText("Choose");
					keyBtn.setEnabled(true);
					jscKey.setEnabled(true);
					tfKey.setEnabled(true);
				}
			}

		});

		panGenKey.add(jcboxAutoKey);

		tfKeyFile = new JTextField();
		tfKeyFile.setEnabled(false);
		tfKeyFile.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		tfKeyFile.setPreferredSize(new Dimension(255, 30));
		panGenKey.add(tfKeyFile);

		keyBtn = new JButton("Choose");
		keyBtn.setEnabled(false);
		keyBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		keyBtn.setPreferredSize(new Dimension(80, 23));
		keyBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				if (radBtnDe.isSelected()) {
					int returnVal = fileChooser.showOpenDialog(panel);
					if (returnVal == JFileChooser.APPROVE_OPTION) {
						keyFile = fileChooser.getSelectedFile();
						tfKeyFile.setText(keyFile.getPath());

						keyTxt = HandleFile.handleReadFile(keyFile);
						tfKey.setText(keyTxt);
					}
				} else if (radBtnEn.isSelected()) {
					if (!jcboxAutoKey.isSelected()) {
						int returnVal = fileChooser.showOpenDialog(panel);
						if (returnVal == JFileChooser.APPROVE_OPTION) {
							File file = fileChooser.getSelectedFile();
							tfKeyFile.setText(file.getPath());

							keyTxt = HandleFile.handleReadFile(file);
							tfKey.setText(keyTxt);
						}
					} else {
						int returnVal = fileChooser.showSaveDialog(panel);
						if (returnVal == JFileChooser.APPROVE_OPTION) {
							keyFile = fileChooser.getSelectedFile();

							keyTxt = tfKey.getText();
							HandleFile.handleWriteFile(keyTxt, keyFile);

							JOptionPane.showMessageDialog(panel, "Saved");
						}
					}

				}

			}

		});
		panGenKey.add(keyBtn);

		clearbtn = new JButton("Clear");
		clearbtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearbtn.setPreferredSize(new Dimension(80, 23));
		clearbtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				tfKey.setText(null);
				tfKeyFile.setText(null);
			}
		});
		panGenKey.add(clearbtn);

		JPanel panInput = new JPanel();
		TitledBorder titledBorder7 = BorderFactory.createTitledBorder("Input");
		titledBorder7.setTitleJustification(TitledBorder.CENTER);
		titledBorder7.setTitleColor(Color.BLACK);
		panInput.setLayout(new FlowLayout());

		panInput.setBorder(titledBorder7);
		panInput.setBounds(254, 131, 456, 165);

		panel.add(panInput);

		JPanel panJSC2 = new JPanel();
		panJSC2.setPreferredSize(new Dimension(420, 94));
		panJSC2.setLayout(new BorderLayout(0, 0));
		panInput.add(panJSC2);

		arInput = new JTextArea();
		arInput.setEnabled(false);
		arInput.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		JScrollPane jscinput = new JScrollPane(arInput);
		panJSC2.add(jscinput);

		tfInputFile = new JTextField();
		tfInputFile.setEnabled(false);
		tfInputFile.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		panInput.add(tfInputFile);
		tfInputFile.setPreferredSize(new Dimension(245, 30));

		inputBtn = new JButton("Choose");
		inputBtn.setEnabled(false);
		inputBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		inputBtn.setPreferredSize(new Dimension(80, 23));
		inputBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser.showOpenDialog(panel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					inputFile = new File(fileChooser.getSelectedFile().getAbsolutePath());
					tfInputFile.setText(inputFile.getPath());

					inputTxt = HandleFile.handleReadFile(inputFile);
					arInput.setText(inputTxt);
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfInputFile.setText("no such file");
				}
			}
		});
		panInput.add(inputBtn);

		clearbtn2 = new JButton("Clear");
		clearbtn2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearbtn2.setPreferredSize(new Dimension(80, 23));
		clearbtn2.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arInput.setText(null);
				tfInputFile.setText(null);
			}
		});
		panInput.add(clearbtn2);

		TitledBorder titledBorder8 = BorderFactory.createTitledBorder("Output");
		titledBorder8.setTitleJustification(TitledBorder.CENTER);
		titledBorder8.setTitleColor(Color.BLACK);
		JPanel panOutput = new JPanel();
		panOutput.setLayout(new FlowLayout());
		panOutput.setBounds(254, 299, 456, 165);
		panOutput.setBorder(titledBorder8);
		panel.add(panOutput);

		JPanel panJSC3 = new JPanel();
		panJSC3.setPreferredSize(new Dimension(420, 94));
		panJSC3.setLayout(new BorderLayout(0, 0));
		panOutput.add(panJSC3);

		arOutput = new JTextArea();
		arOutput.setEnabled(false);
		arOutput.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		JScrollPane jscoutput = new JScrollPane(arOutput);
		panJSC3.add(jscoutput);

		tfOutputFile = new JTextField();
		tfOutputFile.setEnabled(false);
		tfOutputFile.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		tfOutputFile.setPreferredSize(new Dimension(245, 30));
		panOutput.add(tfOutputFile);

		outputBtn = new JButton("Save");
		outputBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		outputBtn.setPreferredSize(new Dimension(80, 23));
		outputBtn.setEnabled(false);
		outputBtn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response3 = fileChooser.showSaveDialog(panel);
				if (response3 == JFileChooser.APPROVE_OPTION) {
					outputFile = new File(fileChooser.getSelectedFile().getAbsolutePath());

					outputTxt = arOutput.getText();
					HandleFile.handleWriteFile(outputTxt, outputFile);
					JOptionPane.showMessageDialog(panel, "Saved");
				}
				if (response3 == JFileChooser.CANCEL_OPTION) {
					tfOutputFile.setText("no such file");

				}
			}
		});
		panOutput.add(outputBtn);

		clearbtn3 = new JButton("Clear");
		clearbtn3.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		clearbtn3.setPreferredSize(new Dimension(80, 23));
		clearbtn3.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				arOutput.setText(null);
				tfOutputFile.setText(null);
			}
		});
		panOutput.add(clearbtn3);
	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JPanel sysmetricPane = new SymmectricPanel();
		frame.getContentPane().add(sysmetricPane);
		frame.setSize(734, 590);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
