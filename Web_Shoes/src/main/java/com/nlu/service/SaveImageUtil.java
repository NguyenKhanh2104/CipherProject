package com.nlu.service;

import java.io.*;

public class SaveImageUtil {

    public static  final String path ="E:\\web-servlet\\WebProject\\src\\main\\webapp\\images\\";
    public static byte[] read(InputStream is) throws IOException {
        byte[] temp = new byte[1024];
        int c = is.read(temp);
        if (c == -1) return null;
        byte[] data = new byte[c];
        System.arraycopy(temp, 0, data, 0, c);
        return data;
    }

    public static void write( InputStream is,String fileName) {
        try {
            OutputStream os = new BufferedOutputStream(new FileOutputStream(path+fileName));
            byte[] data;
            while ((data = read(is)) != null) {
                os.write(data);
                os.flush();
            }
            os.close();
            is.close();
            System.out.println("Da ghi file thanhcong");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) throws FileNotFoundException {

    }

}
