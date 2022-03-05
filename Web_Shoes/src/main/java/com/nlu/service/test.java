package com.nlu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class test {

    public String splitEqually(String text, int size) {
        int count = 0;
        String total = null;
        String result = null;
        StringBuilder sb = new StringBuilder();
        List<String> ret = new ArrayList<String>((text.length() + size - 1) / size);
        for (int start = 0; start < text.length(); start += size) {
            ret.add(text.substring(start, Math.min(text.length(), start + size)));
            for (String s : ret) {
                sb.append(s);
                sb.append("\n");
            }
            total = sb.toString();
            ret.remove(text.substring(start, Math.min(text.length(), start + size)));
//            result = total.split("\n");
        }
        return total;
    }

    public void checkString(String text) {
        System.out.println(text);
        text = text.replaceAll(" ", "");
        System.out.println(text);
    }

    public int countChar(String te) {
        int count = 0;
        for (int i = 0; i < te.length(); i++) {
            count++;
        }
        return count;
    }

    public static void main(String[] args) {
        String pri = "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAx+IvVvf5f5gUElrYeDO1sk8MEmKKWYrxp3mHegssDPDB8mzm2Z33tl9sNGE556g3Oew3REv5XsQ8ceMFRLbmIwIDAQABAkANQOSlrhyXhsRx8R8gXUFjeNVSlMEardlXIvpGL950XxZKc3BWvvZ4cf+5a+lNYoKAwS2w8tGf/KanhHm68RBpAiEA9gE9b7zFYNukOHSZDXuDiFxVJkt+L07mA2Wjy5gPB1sCIQDQATmrWzcwPGiKDyg+ufn6lK0pS3xPcvhuHgBLDuce2QIgd8HixqJ+88f5CgK4/3dBcQCB80KNCzq9fqncMyCzMEECIQClMVPrkvWxiUg83OzJZEnziEA9m4WOU3CZg5oYAi3rgQIgGc5IYfXVu3l2gZmXpdJ5nJ0V3LFcs5dwQIAQR8ces2I=";
        String pub = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAMCnsWbzrG0vZ9+whuL6Pfm8Rh2VVfbhryuuKcuih135QHwjhHGI8g8tmPrDzDigH43raCdyEHCc72uqBpuNePcCAwEAAQ==";
        test t = new test();
        System.out.print(t.splitEqually(pri, 45));
        System.out.println(t.countChar(t.splitEqually(pri, 45)));
//        t.checkString("anh khanh dep trai");
//        StringBuilder sb = new StringBuilder("");
//        sb.append(" aaa \n"); sb.append(" bbbbb \n");
//        sb.append("ccccc \n"); sb.append("\n");
//        sb.append("ddd\r\n"); sb.append("\r\n");
//        sb.append("eee\r\n"); String text = sb.toString();
//        System.out.println("----Du lieu cu----");
//        System.out.println(text);
//        System.out.println("----- Sau khi split ----");
//        int count = 1;
//        String lines = String.valueOf(text.split("\\r?\\n"));
//        for (String line : lines) {
//            System.out.println("Line" + count++ + " : "+ line);
//        }



}

}
