package com.shopbetho.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    public void sendOtpEmail(String toEmail, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("hbao27122@gmail.com");
        message.setTo(toEmail);
        message.setSubject("Your OTP Code");
        message.setText("Your OTP code is: " + otp);
        mailSender.send(message);
    }

    public void sendOrder(String toEmail, String order) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("hbao27122@gmail.com");
        message.setTo(toEmail);
        message.setSubject("Customer Order");
        message.setText(order);
        mailSender.send(message);
    }
}
