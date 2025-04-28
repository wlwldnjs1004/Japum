package com.kh.jagpum.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CertDto {

	private String certEmail;
	private String certNumber;
	private Timestamp certTime, certConfirm;
}
