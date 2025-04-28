package com.kh.jagpum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.kh.jagpum.configuration.FileuploadProperties;


@EnableScheduling//스캐줄러 활성화
@SpringBootApplication
public class JagpumApplication {

	public static void main(String[] args) {
		SpringApplication.run(JagpumApplication.class, args);
	}

}
