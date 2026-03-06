package com.parkjun.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.parkjun.dto.ProblemDTO;

@Mapper
public interface ProblemDAO {

    // 문제 목록
    public List<ProblemDTO> listDao();

    // 문제 상세 보기
    public ProblemDTO viewDao(int p_no);

    // 문제 등록
    public int writeDao(ProblemDTO dto);

    // 문제 수정
    public int updateDao(ProblemDTO dto);

    // 문제 삭제
    public int deleteDao(int p_no);

}