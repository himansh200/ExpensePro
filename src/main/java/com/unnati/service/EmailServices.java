package com.unnati.service;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;

import org.springframework.stereotype.Service;

import com.mysql.cj.Session;

@Service
public class EmailServices {

	public void sendEmailForgetPassword(String email,String otp) {
		
		final String from ="";
		final String password ="";
		
		Properties prop =System.getProperties();
	 
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.starttls.enable","true");
		prop.put("mail.smtp.host","smtp.gamil.com");
	 	prop.put("mail.smtp.port","587");
		prop.put("mail.smtp.ssl.enable","false");
		
		Session session = Session.getInstance(prop,new Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			// TODO Auto-generated method stub
			return new PasswordAuthentication(from, appPassword);
		
		}
		})
	}
}
