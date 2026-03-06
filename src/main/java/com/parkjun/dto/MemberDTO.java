package com.parkjun.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_pwc;
	private String m_name;
	private String m_sex;
	private String m_email;
	private String m_tel;
	private Date m_date;
	private String m_role;
}	
