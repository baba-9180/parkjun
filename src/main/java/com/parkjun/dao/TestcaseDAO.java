package com.parkjun.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.parkjun.dto.TestcaseDTO;

@Mapper
public interface TestcaseDAO {

    // 문제별 테스트케이스 목록
    List<TestcaseDTO> listByProblemDao(@Param("p_no") int p_no);

    // 단건 조회
    TestcaseDTO viewDao(@Param("tc_no") int tc_no);

    // 등록
    int insertDao(TestcaseDTO dto);

    // 수정
    int updateDao(TestcaseDTO dto);

    // 삭제
    int deleteDao(@Param("tc_no") int tc_no);
}