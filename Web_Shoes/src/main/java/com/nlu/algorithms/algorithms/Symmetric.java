package com.nlu.algorithms.algorithms;

import java.io.File;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import com.nlu.algorithms.handleFile.HandleFile;

public class Symmetric {
	private SecretKey key;
	private String algorithm;
	private int keySize;
	private String mode;
	private String padding;

	public Symmetric(String algorithm, int keySize) {
		this.algorithm = algorithm;
		this.keySize = keySize;
	}

	public Symmetric() {
	}

	public String genKey() throws NoSuchAlgorithmException {
		KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm);
		keyGenerator.init(keySize);
		key = keyGenerator.generateKey();
		return Base64.getEncoder().encodeToString(key.getEncoded());
	}

	public String encrypt(String text, String key) throws Exception {
		byte[] encodedKey = Base64.getDecoder().decode(key);
		SecretKey originalKey = new SecretKeySpec(encodedKey, 0, encodedKey.length, algorithm);
		Cipher cipher = Cipher.getInstance(getMode());
		cipher.init(Cipher.ENCRYPT_MODE, originalKey);
		byte[] plaintext = text.getBytes("UTF-8");
		byte[] encryptText = cipher.doFinal(plaintext);
		return Base64.getEncoder().encodeToString(encryptText);
	}

	public String decrypt(String text, String key) throws Exception {
		byte[] decodedKey = Base64.getDecoder().decode(key);
		SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, algorithm);
		Cipher cipher = Cipher.getInstance(getMode());
		cipher.init(Cipher.DECRYPT_MODE, originalKey);
		byte[] encryptText = Base64.getDecoder().decode(text);
		byte[] decryptText = cipher.doFinal(encryptText);
		return new String(decryptText, "UTF-8");
	}

	public String getMode() {
		String modeStr = "";
		modeStr += algorithm;
		if (mode != null && !mode.equalsIgnoreCase("None")) {
			modeStr += "/" + mode;
			if (padding != null)
				modeStr += "/" + padding;
		}
		return modeStr;
	}

	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}

	public void setKeySize(int keySize) {
		this.keySize = keySize;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public void setPadding(String padding) {
		this.padding = padding;
	}

	
}
