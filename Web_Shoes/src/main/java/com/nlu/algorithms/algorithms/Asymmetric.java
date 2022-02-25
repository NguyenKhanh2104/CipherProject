package com.nlu.algorithms.algorithms;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

public class Asymmetric {

	private String algorithm;
	private int keySize;

	public Asymmetric(String algorithm, int keySize) {
		this.algorithm = algorithm;
		this.keySize = keySize;
	}
	public KeyPair genKey() throws NoSuchAlgorithmException {
		SecureRandom sr = new SecureRandom();
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(algorithm);
		keyPairGenerator.initialize(keySize, sr);
		return keyPairGenerator.generateKeyPair();
	}

	public PrivateKey genPrivateKey(String privateKey) throws Exception {
		byte[] priKeyBytes = Base64.getDecoder().decode(privateKey);
		EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(priKeyBytes);
		KeyFactory key = KeyFactory.getInstance(algorithm);
		return key.generatePrivate(keySpec);
	}

	public PublicKey genPublicKey(String publicKey) throws Exception {
		byte[] publKeyBytes = Base64.getDecoder().decode(publicKey);
		EncodedKeySpec keySpec = new X509EncodedKeySpec(publKeyBytes);
		KeyFactory key = KeyFactory.getInstance(algorithm);
		return key.generatePublic(keySpec);
	}

	public String encrypt(String plainText, String publKey) throws Exception {
		PublicKey publicKey = genPublicKey(publKey);
		Cipher cipher = Cipher.getInstance(algorithm);
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] encryptText = cipher.doFinal(plainText.getBytes());
		return Base64.getEncoder().encodeToString(encryptText);
	}

	public String decrypt(String encryptText, String privKey) throws Exception {
		PrivateKey privateKey = genPrivateKey(privKey);
		byte[] textBytes = Base64.getDecoder().decode(encryptText);
		Cipher cipher = Cipher.getInstance(algorithm);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptText = cipher.doFinal(textBytes);
		return new String(decryptText);
	}

	public String getPrivateKey(PrivateKey privateKey) {
		return Base64.getEncoder().encodeToString(privateKey.getEncoded());
	}

	public String getPublicKey(PublicKey publicKey) {
		return Base64.getEncoder().encodeToString(publicKey.getEncoded());
	}

	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}

	public void setKeySize(int keySize) {
		this.keySize = keySize;
	}
}
