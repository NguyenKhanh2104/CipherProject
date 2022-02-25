package com.nlu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class test {
    public String splitEqually(String text, int size) {

        String result = null;
        StringBuilder sb = new StringBuilder();
        List<String> ret = new ArrayList<String>((text.length() + size - 1) / size);
        for (int start = 0; start < text.length(); start += size) {
            ret.add(text.substring(start, Math.min(text.length(), start + size)));
            for (String s : ret) {
                sb.append(s);
                sb.append("\n");
            }
            result = sb.toString();
            ret.remove(text.substring(start, Math.min(text.length(), start + size)));

        }
        return result;
//        String result = null;
//        char[] c = new char[text.length() + size - 1 / size];
//        c = text.toCharArray();
//        for (int i = 0; i < text.length(); i+=48) {
//
//           result = new Strin   g(c);
//
//        }
//        return result;
    }

//    public void test() {
//
//        ArrayList<String> list = new ArrayList<String>();
//        list.add("one");
//        list.add("two");
//        list.add("three");
//
//        StringBuilder sb = new StringBuilder();
//        for (
//                String s : list) {
//            sb.append(s);
//            sb.append("\t");
//        }
//
//        System.out.println(sb.toString());
//    }

    public static void main(String[] args) {
        String pri = "MIBUwIBADANBgkqhkiG9w0BAQEFAASCAT0wggE5AgEAAkEAwwZh91MNL0GUN7wC5Bzd6LN6rw5O1bRj8ISI+jYcKYwAWbwRBUTbYYA2zXP4N9shl0vizN5dSofv9IA569E74QIDAQABAkA+wnUQRDe91idPvGnOurmkatvXilceDqZEe2Kp5MUgxs1hs7fknNUWyHRMcwyb43u0iDWkqaVJ392l2byypmpAiEA6rkIWBObK96WZ1GAzNw5Oq33tiQR4reyNixqaIbto5MCIQDUtBUc4ECxXmZuyvvqH8C+JLvNLyvTi3FQ3MxSRjzOwIgQJizhym+JpCXa8+uVrK0vUVrSqEamv5a+TW4AxQ/CikCIBpjuqNNbU0tuPeEzF+wlQmGU5yP+3T4ix81Th5oRksvAiB+zvbNXVPg8PKmukJ9qR6LUB19Sui6mir/f1FqobHJiA==";
        test t = new test();
        System.out.println(t.splitEqually(pri, 48));
//        t.test();

    }

}
