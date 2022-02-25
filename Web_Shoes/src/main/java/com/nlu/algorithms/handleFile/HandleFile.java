package com.nlu.algorithms.handleFile;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class HandleFile {
	public static String handleReadFile(File file) {
		try {
			InputStream ips = new FileInputStream(file);
			int bytesToRead = (int) file.length();
			int bytes = 0;
			byte[] data = new byte[bytesToRead];
			while (bytes < bytesToRead) {
				bytes += ips.read(data, bytes, bytesToRead - bytes);
			}
			if (file.getName().endsWith("txt")) {
				return new String(data);
			} else {
				return Base64.getEncoder().encodeToString(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}

	public static void handleWriteFile(String src, File file) {
		byte[] data = null;
		try {
			OutputStream ops = new FileOutputStream(file);
			if (file.getName().endsWith("txt")) {
				data = src.getBytes("UTF-8");
			} else {
				data = Base64.getDecoder().decode(src.getBytes("UTF-8"));
			}
			ops.write(data);
			ops.flush();
			ops.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
