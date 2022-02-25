package com.nlu.algorithms.algorithms;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Hash {
	private static final byte[] HEX_ARRAY = "0123456789abcdef".getBytes(StandardCharsets.US_ASCII);
	public static byte[] hash(String data, String algorithm)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest digest = MessageDigest.getInstance(algorithm);
		byte[] hash = digest.digest(data.getBytes("UTF-8"));
		return hash;

	}

	public static String bytesToHex(byte[] hash) {
		   char[] hexChars = new char[hash.length * 2];
		    for (int j = 0; j < hash.length; j++) {
		        int v = hash[j] & 0xFF;
		        hexChars[j * 2] = (char) HEX_ARRAY[v >>> 4];
		        hexChars[j * 2 + 1] = (char) HEX_ARRAY[v & 0x0F];
		    }
		    return new String(hexChars);

	}

}
