package com.kh.jagpum.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfiguration {

	@Autowired
	private EmailProperties emailProperties;
	
	
	@Bean
	public JavaMailSenderImpl sender() {
	
		//[1]
		JavaMailSenderImpl sender=new JavaMailSenderImpl();
		
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername(emailProperties.getUsername());
		sender.setPassword(emailProperties.getPassword());

		
			
		Properties props=new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.debmg", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
		sender.setJavaMailProperties(props);
		
		return sender;
		
	}
	
	
}
