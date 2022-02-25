package com.nlu.algorithms.swing;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.File;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;

import com.nlu.algorithms.algorithms.Asymmetric;
import com.nlu.algorithms.handleFile.HandleFile;

public class AsymmetricPanel extends JPanel {
	private List<Integer> listKeySize;
	private String algorithmText;
	private int keySize;
	private JPanel panel;
	private JComboBox jcbKey;
	private JComboBox<Object> jcbAlg;
	private JTextArea  arInput, arOutput,arPri, arPub;
	private JLabel publKeylbl, privKeylbl;
	private String inputText, keyText, outputText, keyPriText, keyPubText, inputTextEn, keyTextEn;
	private File keyPri, keyPub, keyFile, inputFile, outputFile;
	private JRadioButton radBtnEn, radBtnDe;
	private JButton keyBtn, inputBtn, outputBtn, startBtn, clearbtn, clearbtn2, clearbtn3, priBtn, pubBtn, createKey;
	private JTextField tfKeyFile, tfInputFile, tfOutputFile,tfKey;
	private ButtonGroup goupBtn;
	private Asymmetric asymmetric;
	private List<String> asym;

	public AsymmetricPanel() {
		algorithmText = "RSA";
		keySize = 512;
		asymmetric = new Asymmetric(algorithmText, keySize);

		Gui();
	}

	public void Gui() {
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

		tfKeyFile = new JTextField();
		tfKeyFile.setEnabled(false);
		tfKeyFile.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		tfKeyFile.setPreferredSize(new Dimension(255, 30));
		publKeylbl = new JLabel("Please enter publicKey");
		privKeylbl = new JLabel("Please enter privateKey");
		privKeylbl.setVisible(false);

		JPanel panGetKey = new JPanel();
		TitledBorder titledBorder6 = BorderFactory.createTitledBorder("Key");
		titledBorder6.setTitleJustification(TitledBorder.CENTER);
		titledBorder6.setTitleColor(Color.BLACK);
		panGetKey.setBorder(titledBorder6);
		panGetKey.setLayout(new FlowLayout());
		panGetKey.setBounds(254, 5, 456, 120);
		panel.add(panGetKey);

		JPanel panJSC = new JPanel();
		panJSC.setPreferredSize(new Dimension(440, 50));
		panJSC.setLayout(new BorderLayout(0, 0));
		panGetKey.add(panJSC);

		tfKey = new JTextField();
		tfKey.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		tfKey.setLayout(new FlowLayout());
		tfKey.setEnabled(false);
		JScrollPane jscKey = new JScrollPane(tfKey);
		panJSC.add(jscKey);

		panGetKey.add(tfKeyFile);


		radBtnEn = new JRadioButton("Encrypt");
		radBtnEn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		radBtnEn.setBounds(20, 15, 80, 40);
		radBtnEn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				keyBtn.setEnabled(true);
				inputBtn.setEnabled(true);
				tfKey.setText("");
				tfKey.setEnabled(true);
				tfKeyFile.setText("");
				arInput.setText("");
				arInput.setEnabled(true);
				arOutput.setText("");
				tfInputFile.setText("");
				tfOutputFile.setText("");
				if (!tfKey.getText().equals(null)) {
					keyBtn.setSelected(true);
					tfKey.add(publKeylbl);
					privKeylbl.setVisible(false);
					privKeylbl.setEnabled(false);
					publKeylbl.setVisible(true);
					publKeylbl.setEnabled(true);
					tfKey.addKeyListener(new KeyAdapter() {

						@Override
						public void keyTyped(KeyEvent e) {
							if (e.getKeyChar() != KeyEvent.VK_BACK_SPACE) {
								publKeylbl.setVisible(false);
								publKeylbl.setEnabled(false);
							}
							if (tfKey.getText().equals("")) {
								privKeylbl.setEnabled(false);
								privKeylbl.setVisible(false);
								publKeylbl.setEnabled(true);
								publKeylbl.setVisible(true);
								if (tfKey.getText() != "") {
									publKeylbl.setEnabled(false);
								}
							}
						}
					});

				}else {
					tfKey.setText("");
				}
			}
		});

		if (radBtnEn.isSelected()) {
			privKeylbl.setVisible(false);
			privKeylbl.setEnabled(false);
			tfKey.add(publKeylbl);

		} else {
			publKeylbl.setVisible(false);
			publKeylbl.setEnabled(false);
			tfKey.add(privKeylbl);
		}

		radBtnDe = new JRadioButton("Decrypt");
		radBtnDe.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		radBtnDe.setBounds(155, 15, 80, 40);
		radBtnDe.setBackground(null);
		radBtnDe.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				keyBtn.setEnabled(true);
				inputBtn.setEnabled(true);
				tfKey.setText("");
				tfKey.setEnabled(true);
				tfKeyFile.setText("");
				arInput.setText("");
				arOutput.setText("");
				tfInputFile.setText("");
				tfOutputFile.setText("");
				if(!tfKey.getText().equals(null)) {
				keyBtn.setSelected(true);
				tfKey.add(privKeylbl);
				publKeylbl.setEnabled(false);
				publKeylbl.setVisible(false);
				privKeylbl.setVisible(true);
				privKeylbl.setEnabled(true);
				tfKey.addKeyListener(new KeyAdapter() {

					@Override
					public void keyTyped(KeyEvent e) {
						if (e.getKeyChar() != KeyEvent.VK_BACK_SPACE) {
							privKeylbl.setVisible(false);
							privKeylbl.setEnabled(false);
						}
						if (tfKey.getText().equals("")) {
							publKeylbl.setEnabled(false);
							publKeylbl.setVisible(false);
							privKeylbl.setEnabled(true);
							privKeylbl.setVisible(true);
							if (tfKey.getText() != "") {
								privKeylbl.setEnabled(false);
							}
						}
					}
				});
				}
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

		asym = Arrays.asList("RSA");
		jcbAlg = new JComboBox<Object>();
		jcbAlg.setModel(new DefaultComboBoxModel<>(asym.toArray()));
		jcbAlg.setSelectedIndex(0);
		jcbAlg.setSelectedItem(algorithmText);
		jcbAlg.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				algorithmText = jcbAlg.getSelectedItem().toString();
				switch (algorithmText) {
				case "RSA":
					listKeySize = new ArrayList<Integer>();
					listKeySize.add(512);
					listKeySize.add(1024);
					break;
				}
				keySize = listKeySize.get(0);
				List<String> listKeySizeStr = listKeySize.stream().map(item -> item.toString())
						.collect(Collectors.toList());

				jcbKey.setModel(new DefaultComboBoxModel(listKeySizeStr.toArray()));
			}
		});
		jcbAlg.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbAlg.setBounds(100, 25, 120, 22);
		pa.add(jcbAlg);
		jcbKey = new JComboBox<Object>(new String[] { ("" + keySize) });
		jcbKey.setFont(new Font("Segoe UI", Font.PLAIN, 12));
		jcbKey.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				keySize = Integer.parseInt(jcbKey.getSelectedItem().toString());
			}
		});
		jcbKey.setBounds(100, 68, 120, 22);
		pa.add(jcbKey);

		JLabel keySizelbl = new JLabel("Key Size : ");
		keySizelbl.setForeground(Color.BLACK);
		keySizelbl.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		keySizelbl.setBounds(10, 60, 100, 30);
		pa.add(keySizelbl);

		JLabel alg = new JLabel("Algorithms : ");
		alg.setForeground(Color.BLACK);
		alg.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		alg.setBounds(10, 20, 100, 30);
		pa.add(alg);

		panMode.add(pa);

		TitledBorder titledBorder5 = BorderFactory.createTitledBorder("Excute");
		titledBorder5.setTitleJustification(TitledBorder.CENTER);
		titledBorder5.setTitleColor(Color.BLACK);
		JPanel panClick = new JPanel();
		panClick.setLayout(null);
		panClick.setBounds(530, 465, 180, 60);
		panClick.setBorder(titledBorder5);



		JPanel panGenKey = new JPanel();
		TitledBorder titledBorder9 = BorderFactory.createTitledBorder("GenKey");
		titledBorder9.setTitleJustification(TitledBorder.CENTER);
		titledBorder9.setTitleColor(Color.BLACK);
		panGenKey.setBorder(titledBorder9);
		panGenKey.setBounds(5, 190, 240, 210);
		panMode.add(panGenKey);
		panGenKey.setLayout(new FlowLayout());

		createKey = new JButton("CreateKey");
		createKey.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		createKey.setBounds(20, 21, 200, 30);
		createKey.setPreferredSize(new Dimension(200, 30));
		createKey.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					KeyPair keypair = asymmetric.genKey();
					arPri.setText(Base64.getEncoder().encodeToString(keypair.getPrivate().getEncoded()));
					arPub.setText(Base64.getEncoder().encodeToString(keypair.getPublic().getEncoded()));
					arPri.setEnabled(true);
					arPub.setEnabled(true);
					priBtn.setEnabled(true);
					pubBtn.setEnabled(true);
				} catch (NoSuchAlgorithmException e1) {
					e1.printStackTrace();
				}

			}

		});

		panGenKey.add(createKey);

		JLabel lblNewLabel = new JLabel("PrivateKey :                  ");
		lblNewLabel.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		lblNewLabel.setBounds(85, 56, 80, 23);
		panGenKey.add(lblNewLabel);

		JPanel panJSCPri = new JPanel();
		panJSCPri.setPreferredSize(new Dimension(150, 45));
		panJSCPri.setLayout(new BorderLayout(0, 0));
		panGenKey.add(panJSCPri);

		arPri = new JTextArea();
		arPri.setEnabled(false);
		JScrollPane jscPri = new JScrollPane(arPri);
		panJSCPri.add(jscPri);

		priBtn = new JButton("Save");
		priBtn.setEnabled(false);
		priBtn.setBounds(168, 92, 62, 30);
		priBtn.setPreferredSize(new Dimension(68, 30));
		priBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int returnVal = fileChooser.showSaveDialog(panel);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					keyPri = fileChooser.getSelectedFile();
					keyPriText = arPri.getText();
					HandleFile.handleWriteFile(keyPriText, keyPri);
					JOptionPane.showMessageDialog(panel, "Saved privateKey");
				}
			}
		});
		panGenKey.add(priBtn);

		JLabel lblNewLabel_1 = new JLabel("PublicKey :                    ");
		lblNewLabel_1.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		lblNewLabel_1.setBounds(85, 134, 80, 23);
		panGenKey.add(lblNewLabel_1);

		JPanel panJSCPub = new JPanel();
		panJSCPub.setPreferredSize(new Dimension(150, 45));
		panJSCPub.setLayout(new BorderLayout(0, 0));
		panGenKey.add(panJSCPub);

		arPub = new JTextArea();
		arPub.setEnabled(false);
		JScrollPane jscPub = new JScrollPane(arPub);
		panJSCPub.add(jscPub);

		pubBtn = new JButton("Save");
		pubBtn.setEnabled(false);
		pubBtn.setBounds(168, 176, 62, 30);
		pubBtn.setPreferredSize(new Dimension(68, 30));
		pubBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int returnVal = fileChooser.showSaveDialog(panel);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					keyPub = fileChooser.getSelectedFile();
					keyPubText = arPub.getText();
					HandleFile.handleWriteFile(keyPubText, keyPub);
					JOptionPane.showMessageDialog(panel, "Saved publicKey");
				}
			}
		});
		panGenKey.add(pubBtn);




		keyBtn = new JButton("Choose");
		keyBtn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
		keyBtn.setPreferredSize(new Dimension(80, 23));
		keyBtn.setEnabled(false);
		keyBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser.showOpenDialog(panel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					keyFile = new File(fileChooser.getSelectedFile().getAbsolutePath());
					publKeylbl.setVisible(false);
					tfKeyFile.setText(keyFile.getPath());
					privKeylbl.setVisible(false);
					publKeylbl.setVisible(false);
					keyText = HandleFile.handleReadFile(keyFile);
					tfKey.setText(keyText);
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					publKeylbl.setVisible(false);
					tfInputFile.setText("no such file");
				}
			}
		});
		panGetKey.add(keyBtn);

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
		panGetKey.add(clearbtn);

		JPanel panInput = new JPanel();
		TitledBorder titledBorder7 = BorderFactory.createTitledBorder("Input");
		titledBorder7.setTitleJustification(TitledBorder.CENTER);
		titledBorder7.setTitleColor(Color.BLACK);
		panInput.setLayout(new FlowLayout());

		panInput.setBorder(titledBorder7);
		panInput.setBounds(254, 129, 456, 165);

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
				JFileChooser fileChooser2 = new JFileChooser();
				fileChooser2.setCurrentDirectory(new File("C:\\Users\\Admin\\Desktop"));
				int response2 = fileChooser2.showOpenDialog(panel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					inputFile = new File(fileChooser2.getSelectedFile().getAbsolutePath());
					tfInputFile.setText(inputFile.getPath());

					inputText = HandleFile.handleReadFile(inputFile);
					arInput.setText(inputText);
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
				int response2 = fileChooser.showSaveDialog(panel);
				if (response2 == JFileChooser.APPROVE_OPTION) {
					outputFile = new File(fileChooser.getSelectedFile().getAbsolutePath());
					tfOutputFile.setText(outputFile.getPath());
					outputText = arOutput.getText();
					HandleFile.handleWriteFile(outputText, outputFile);
					JOptionPane.showMessageDialog(panel, "Saved");
				}
				if (response2 == JFileChooser.CANCEL_OPTION) {
					tfInputFile.setText("no such file");
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
				asymmetric.setAlgorithm(algorithmText);
				asymmetric.setKeySize(keySize);
				try {
					keyTextEn = tfKey.getText();
					inputTextEn = arInput.getText();
					if (radBtnEn.isSelected()) {
						outputText = asymmetric.encrypt(inputTextEn, keyTextEn);
					} else if (radBtnDe.isSelected()) {
						outputText = asymmetric.decrypt(inputTextEn, keyTextEn);
					}

					arOutput.setText(outputText);
					arOutput.setEnabled(true);
					outputBtn.setEnabled(true);

				} catch (Exception ex) {
					JOptionPane.showMessageDialog(panel, ex.getMessage());
					System.out.println(ex.getMessage());
				}
			}
		});
		panClick.add(startBtn);
		panel.add(panClick);
	}

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JPanel sysmetricPane = new AsymmetricPanel();
		frame.getContentPane().add(sysmetricPane);
		frame.setSize(734, 590);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
