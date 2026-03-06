package com.parkjun.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.parkjun.dao.ProblemDAO;
import com.parkjun.dto.MemberDTO;
import com.parkjun.dto.ProblemDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProblemController {

    @Autowired
    ProblemDAO dao;

    // ✅ 문제 목록
    @RequestMapping("/Problem/ProblemList")
    public String list(Model model) {

        List<ProblemDTO> list = dao.listDao();
        model.addAttribute("list", list);

        return "Problem/ProblemList";
    }

    // ✅ 문제 등록 폼
    @RequestMapping("/Problem/ProblemWriteForm")
    public String writeForm(HttpSession session) {

        // (선택) 로그인 체크 - 원하면 제거 가능
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        return "Problem/ProblemWriteForm";
    }

    // ✅ 문제 등록 처리
    @PostMapping("/Problem/ProblemWrite")
    public String write(ProblemDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        // 최소 유효성 검사
        if (dto.getP_title() == null || dto.getP_title().trim().isEmpty()) {
            return "Problem/ProblemWriteForm";
        }
        if (dto.getP_level() == null || dto.getP_level().trim().isEmpty()) {
            return "Problem/ProblemWriteForm";
        }

        int result = dao.writeDao(dto);
        System.out.println("problem insert result = " + result);

        return "redirect:/Problem/ProblemList";
    }

    // ✅ 문제 상세
    @RequestMapping("/Problem/ProblemView")
    public String view(@RequestParam("p_no") int p_no, Model model) {

        ProblemDTO problem = dao.viewDao(p_no);
        model.addAttribute("problem", problem);

        return "Problem/ProblemView";
    }

    // ✅ 문제 수정 폼
    @RequestMapping("/Problem/ProblemUpdateForm")
    public String updateForm(@RequestParam("p_no") int p_no, Model model, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        ProblemDTO problem = dao.viewDao(p_no);
        model.addAttribute("problem", problem);

        return "Problem/ProblemUpdateForm";
    }

    // ✅ 문제 수정 처리
    @PostMapping("/Problem/ProblemUpdate")
    public String update(ProblemDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        if (dto.getP_no() == 0) {
            return "redirect:/Problem/ProblemList";
        }

        int result = dao.updateDao(dto);
        System.out.println("problem update result = " + result);

        return "redirect:/Problem/ProblemView?p_no=" + dto.getP_no();
    }

    // ✅ 문제 삭제
    @RequestMapping("/Problem/ProblemDelete")
    public String delete(@RequestParam("p_no") int p_no, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        int result = dao.deleteDao(p_no);
        System.out.println("problem delete result = " + result);

        return "redirect:/Problem/ProblemList";
    }
}