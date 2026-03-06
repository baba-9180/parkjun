package com.parkjun.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.parkjun.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	public List<MemberDTO> listDao();
	public MemberDTO viewDao(int m_no);//회원 목록 
	public int writeDao(MemberDTO dto);//회원 가입 폼
	public int deleteDao(int m_no);//회원삭제
	public int updateDao(MemberDTO dto);//회원 수정
	public MemberDTO findByMid(String m_id);//회원 찾기
}
