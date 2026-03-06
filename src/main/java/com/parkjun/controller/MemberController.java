package com.parkjun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parkjun.dao.MemberDAO;
import com.parkjun.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;

	@RequestMapping("/Member/MemberLoginForm")
	public String MemberLoginForm() {
		return "Member/MemberLoginForm";
	}

	@RequestMapping("/Member/MemberWriteForm")
	public String MemberWriteForm() {
		return "Member/MemberWriteForm";
	}

	@PostMapping("/Member/MemberWrite")
	public String MemberWrite(MemberDTO dto) {

		if (dto.getM_pw() == null || !dto.getM_pw().equals(dto.getM_pwc())) {
			return "Member/MemberWriteForm";
		}


		dto.setM_role("USER");

		int result = dao.writeDao(dto);
		System.out.println("insert result = " + result);

		return "redirect:/Member/MemberLoginForm";
	}

	@PostMapping("/Member/MemberLogin")
	public String MemberLogin(MemberDTO dto, HttpSession session) {

		
		if (dto.getM_id() == null || dto.getM_id().trim().isEmpty()) {
			return "Member/MemberLoginForm";
		}

		MemberDTO member = dao.findByMid(dto.getM_id());

		if (member != null && member.getM_pw().equals(dto.getM_pw())) {
			
			session.setAttribute("loginUser", member);

			return "redirect:/";
		}

		return "Member/MemberLoginForm";
	}

	@RequestMapping("/Member/Logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/Member/MemberDetail")
	public String MemberDetail(HttpSession session, Model model) {

	    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/Member/MemberLoginForm";
	    }

	    MemberDTO member = dao.viewDao(loginUser.getM_no());
	    model.addAttribute("member", member);

	    return "Member/MemberDetail";
	}
	@RequestMapping("/Member/MemberDelete")
	public String MemberDelete(HttpSession session) {

	    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/Member/MemberLoginForm";
	    }

	    int result = dao.deleteDao(loginUser.getM_no());
	    System.out.println("delete result = " + result);

	    session.invalidate();

	    return "redirect:/";
	}
	@RequestMapping("/Member/MemberUpdateForm")
	public String MemberUpdateForm(HttpSession session, Model model) {

	    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/Member/MemberLoginForm";
	    }

	    MemberDTO member = dao.viewDao(loginUser.getM_no());

	    model.addAttribute("update", member);

	    return "Member/MemberUpdateForm";
	}
	@PostMapping("/Member/MemberUpdate")
	public String MemberUpdate(MemberDTO dto, HttpSession session) {

	    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/Member/MemberLoginForm";
	    }

	    dto.setM_no(loginUser.getM_no());

	    if (dto.getM_pw() == null || dto.getM_pw().trim().isEmpty()) {
	        MemberDTO origin = dao.viewDao(loginUser.getM_no());
	        dto.setM_pw(origin.getM_pw());
	    }

	    int result = dao.updateDao(dto);
	    System.out.println("update result = " + result);

	    MemberDTO refreshed = dao.viewDao(loginUser.getM_no());
	    refreshed.setM_pw(null);
	    session.setAttribute("loginUser", refreshed);

	    return "redirect:/Member/MemberDetail";
	}
}