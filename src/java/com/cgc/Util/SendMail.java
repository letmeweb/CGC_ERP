/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.Util;

import com.cgc.bean.DataBeanSendMail;
import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author beckpalmx
 */
public class SendMail {

    private String from;
    private String to;
    private String subject;
    private String text;
    private DataBeanSendMail objreturn;

    public SendMail(String from, String to, String subject, String text) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    public void send(String email_server, String email_port) throws Exception {
        /*
         * กำหนดค่าในการส่ง Mail
         */
        try {
            ThaiUtil objthai = new ThaiUtil();
            Properties props = new Properties();
            // กำหนด charset ของอีเมล
            props.setProperty("mail.mime.charset", "UTF-8");
            // ปกติ java mail จะไม่ encode ชื่อไฟล์ ต้องสั่งให้ encode ก่อน
            props.setProperty("mail.mime.encodefilename", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", email_server);
            props.put("mail.smtp.port", email_port);

            System.out.println("email_server = " + email_server);
            System.out.println("email_port = " + email_port);

            Session mailSession = Session.getDefaultInstance(props);

            MimeMessage Message = new MimeMessage(mailSession);

            InternetAddress fromAddress = new InternetAddress(from);
            InternetAddress toAddress = new InternetAddress(to);

            Message.setHeader("Content-Type", "text/plain; charset=\"utf-8\"");
            Message.setHeader("Content-Transfer-Encoding", "quoted-printable");

            Message.setFrom(fromAddress);
            Message.setRecipient(RecipientType.TO, toAddress);
            Message.setSubject(subject, "UTF-8");
            Message.setContent(text, "text/html; charset=UTF-8");

            //System.out.println("-----");
            System.out.println(text);

            Transport.send(Message);

        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }
    }

    public SendMail(Connection con, String Screen_id) throws Exception {
        ResultSet rs = null;
        objreturn = new DataBeanSendMail();
        try {
            rs = con.createStatement().executeQuery("select email_from,email_to,email_server,email_port from mscreen where screen_id = '" + Screen_id + "' and delete_flag = 'N'");
            while (rs.next()) {
                objreturn.setEmail_from(rs.getString("email_from") == null ? null : rs.getString("email_from"));
                objreturn.setEmail_to(rs.getString("email_to") == null ? null : rs.getString("email_to"));
                objreturn.setEmail_server(rs.getString("email_server") == null ? null : rs.getString("email_server"));
                objreturn.setEmail_port(rs.getString("email_port") == null ? null : rs.getString("email_port"));
                System.out.println("Screen_id : " + Screen_id);
                System.out.println("Email : " + rs.getString("email_from") + " : " + rs.getString("email_server"));
                System.out.println("Email : " + rs.getString("email_to") + " : " + rs.getString("email_port"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }

        }
    }

    public DataBeanSendMail Return_DataBeanSendMail() {
        return objreturn;
    }
}
