package com.nlu.mail;

import com.nlu.config.MailConfig;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailService {
    static String mess = "<!DOCTYPE html>\n" +
            "<html>\n" +
            "\n" +
            "<head>\n" +
            "    <title></title>\n" +
            "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
            "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
            "    <style type=\"text/css\">\n" +
            "        body,\n" +
            "        table,\n" +
            "        td,\n" +
            "        a {\n" +
            "            -webkit-text-size-adjust: 100%;\n" +
            "            -ms-text-size-adjust: 100%;\n" +
            "        }\n" +
            "\n" +
            "        table,\n" +
            "        td {\n" +
            "            mso-table-lspace: 0pt;\n" +
            "            mso-table-rspace: 0pt;\n" +
            "        }\n" +
            "\n" +
            "        img {\n" +
            "            -ms-interpolation-mode: bicubic;\n" +
            "        }\n" +
            "\n" +
            "        img {\n" +
            "            border: 0;\n" +
            "            height: auto;\n" +
            "            line-height: 100%;\n" +
            "            outline: none;\n" +
            "            text-decoration: none;\n" +
            "        }\n" +
            "\n" +
            "        table {\n" +
            "            border-collapse: collapse !important;\n" +
            "        }\n" +
            "\n" +
            "        body {\n" +
            "            height: 100% !important;\n" +
            "            margin: 0 !important;\n" +
            "            padding: 0 !important;\n" +
            "            width: 100% !important;\n" +
            "        }\n" +
            "\n" +
            "        a[x-apple-data-detectors] {\n" +
            "            color: inherit !important;\n" +
            "            text-decoration: none !important;\n" +
            "            font-size: inherit !important;\n" +
            "            font-family: inherit !important;\n" +
            "            font-weight: inherit !important;\n" +
            "            line-height: inherit !important;\n" +
            "        }\n" +
            "\n" +
            "        @media screen and (max-width: 480px) {\n" +
            "            .mobile-hide {\n" +
            "                display: none !important;\n" +
            "            }\n" +
            "\n" +
            "            .mobile-center {\n" +
            "                text-align: center !important;\n" +
            "            }\n" +
            "        }\n" +
            "\n" +
            "        div[style*=\"margin: 16px 0;\"] {\n" +
            "            margin: 0 !important;\n" +
            "        }\n" +
            "    </style>\n" +
            "\n" +
            "<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\n" +
            "    <div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">\n" +
            "        For what reason would it be advisable for me to think about business content? That might be little bit risky to have crew member like them.\n" +
            "    </div>\n" +
            "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
            "        <tr>\n" +
            "            <td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">\n" +
            "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"green\">\n" +
            "                            <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">\n" +
            "                                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
            "                                    <tr>\n" +
            "                                        <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">\n" +
            "                                            <h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">SKED</h1>\n" +
            "                                        </td>\n" +
            "                                    </tr>\n" +
            "                                </table>\n" +
            "                            </div>\n" +
            "                            <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">\n" +
            "                                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
            "                                    <tr>\n" +
            "                                        <td align=\"right\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">\n" +
            "                                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\">\n" +
            "                                                <tr>\n" +
            "                                                    <td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400;\">\n" +
            "                                                        <p style=\"font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;\"><a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\">Shop &nbsp;</a></p>\n" +
            "                                                    </td>\n" +
            "                                                    <td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\"> <a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\"><img src=\"https://img.icons8.com/color/48/000000/small-business.png\" width=\"27\" height=\"23\" style=\"display: block; border: 0px;\" /></a> </td>\n" +
            "                                                </tr>\n" +
            "                                            </table>\n" +
            "                                        </td>\n" +
            "                                    </tr>\n" +
            "                                </table>\n" +
            "                            </div>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
            "                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
            "                                <tr>\n" +
            "                                    <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\n" +
            "                                        <h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">Cảm ơn bạn đã đặt hàng</h2>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                                <tr>\n" +
            "                                    <td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;\">\n" +
            "                                        <p style=\"font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;\">Thông tin chi tiết đơn hàng                                </tr>\n" +
            "                                <tr>\n" +
            "                                    <td align=\"left\" style=\"padding-top: 20px;\">\n" +
            "                                        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> Customername</td>\n" +
            "                                                <td width=\"25%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> 2345678 </td>\n" +
            "                                            </tr>\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> Jordan1 Mid Chicago</td>\n" +
            "                                                <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> 5.000.000 đ</td>\n" +
            "                                            </tr>\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> Jordan1 Mid Chicago</td>\n" +
            "                                                <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> 5.000.000 đ</td>\n" +
            "                                            </tr>\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> Jordan1 Mid Chicago</td>\n" +
            "                                                <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\"> 5.000.000 đ</td>\n" +
            "                                            </tr>\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\"> Phí vận chuyển</td>\n" +
            "                                                <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 5px 10px;\"> 100.000 đ </td>\n" +
            "                                            </tr>\n" +
            "                                \n" +
            "                                           \n" +
            "                                        </table>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                                <tr>\n" +
            "                                    <td align=\"left\" style=\"padding-top: 20px;\">\n" +
            "                                        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\n" +
            "                                            <tr>\n" +
            "                                                <td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\"> Tổng cộng </td>\n" +
            "                                                <td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\"> 1.000.000 đ </td>\n" +
            "                                            </tr>\n" +
            "                                        </table>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                            </table>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" height=\"100%\" valign=\"top\" width=\"100%\" style=\"padding: 0 35px 35px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
            "                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:660px;\">\n" +
            "                                <tr>\n" +
            "                                    <td align=\"center\" valign=\"top\" style=\"font-size:0;\">\n" +
            "                                        <div style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n" +
            "                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
            "                                                <tr>\n" +
            "                                                    <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n" +
            "                                                        <p style=\"font-weight: 800;\">Địa chỉ giao hàng</p>\n" +
            "                                                        <p>675 Massachusetts Avenue<br>11th Floor<br>Cambridge, MA 02139</p>\n" +
            "                                                    </td>\n" +
            "                                                </tr>\n" +
            "                                            </table>\n" +
            "                                        </div>\n" +
            "                                        <div style=\"display:inline-block; max-width:50%; min-width:240px; vertical-align:top; width:100%;\">\n" +
            "                                            <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">\n" +
            "                                                <tr>\n" +
            "                                                    <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;\">\n" +
            "                                                        <p style=\"font-weight: 800;\">Thời gian giao hàng dự kiến</p>\n" +
            "                                                        <p>11/11/2020</p>\n" +
            "                                                    </td>\n" +
            "                                                </tr>\n" +
            "                                            </table>\n" +
            "                                        </div>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                            </table>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" style=\" padding: 35px; background-color: green;\" bgcolor=\"#1b9ba3\">\n" +
            "                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
            "                                <tr>\n" +
            "                                    <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">\n" +
            "                                        <h2 style=\"font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;\">Tiếp tục mua sắm</h2>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                                <tr>\n" +
            "                                    <td align=\"center\" style=\"padding: 25px 0 15px 0;\">\n" +
            "                                        <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
            "                                            <tr>\n" +
            "                                                <td align=\"center\" style=\"border-radius: 5px;\" bgcolor=\"#66b3b7\"> <a href=\"#\" target=\"_blank\" style=\"font-size: 18px; font-family: Open Sans, Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 5px; background-color: #F44336; padding: 15px 30px; border: 1px solid #F44336; display: block;\">Cửa Hàng</a> </td>\n" +
            "                                            </tr>\n" +
            "                                        </table>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                            </table>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" style=\"padding: 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">\n" +
            "                            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">\n" +
            "                            \n" +
            "                                <tr>\n" +
            "                                    <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px; padding: 5px 0 10px 0;\">\n" +
            "                                        <p style=\"font-size: 14px; font-weight: 800; line-height: 18px; color: #333333;\"> Địa chỉ : Tầng 80 lanmask 81 </p>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                                <tr>\n" +
            "                                    <td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">\n" +
            "                                        <p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\"> If you didn't create an account using this email address, please ignore this email or <a href=\"#\" target=\"_blank\" style=\"color: #777777;\">unsusbscribe</a>. </p>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                            </table>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "    </table>\n" +
            "</body>\n" +
            "\n" +
            "</html>";

    public void sendMail(String to, String message) {

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", MailConfig.TSL_PORT);
        properties.put("mail.smtp.host", MailConfig.HOST_NAME);

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailConfig.SMTP_USERNAME, MailConfig.SMTP_PASSWORD);
            }
        });

        try {
            Message msg = prepareMessage(to, session, message);
            Transport.send(msg);
            System.out.println("Gui mail thanh cong");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public Message prepareMessage(String to, Session session, String message) {
        Message msg = new MimeMessage(session);
        try {
            msg.setFrom(new InternetAddress(MailConfig.SMTP_USERNAME));
            msg.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(to));
            msg.setSentDate(new Date());
            msg.setSubject("Xác nhận đơn hàng");
            msg.setContent(message, "text/html; charset=UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return msg;
    }

    public static void main(String[] args) {
        MailService mailService = new MailService();
        mailService.sendMail("nguyenduykhanh.it.bt@gmail.com", mess);
//        mailService.sendMail("ngduykhanh.it.bt@gmail.com", mess);
    }
}
