package com.parkjun.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProblemDTO {
	private int p_no;
	private String p_title;
	private String p_content;
	private String p_level;
	private int p_time;
	private Date p_date;
}
