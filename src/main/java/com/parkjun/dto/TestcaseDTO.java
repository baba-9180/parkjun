package com.parkjun.dto;

import lombok.Data;

@Data
public class TestcaseDTO {
    private int tc_no;        // 채점번호
    private int p_no;         // 문제번호
    private String tc_input;  // 입력(CLOB)
    private String tc_output; // 출력(CLOB)
    private String tc_sample; // 정답샘플(설명용)
}