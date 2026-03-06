package com.parkjun.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.parkjun.dao.TestcaseDAO;
import com.parkjun.dto.MemberDTO;
import com.parkjun.dto.TestcaseDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class TestcaseController {

    @Autowired
    private TestcaseDAO testcaseDAO;

    /**
     * 테스트케이스 목록(문제별)
     * URL: /Testcase/List?p_no=1
     */
    @RequestMapping("/Testcase/List")
    public String list(@RequestParam("p_no") int p_no, Model model, HttpSession session) {

        // (선택) 로그인 체크
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        List<TestcaseDTO> list = testcaseDAO.listByProblemDao(p_no);

        model.addAttribute("p_no", p_no);
        model.addAttribute("list", list);

        return "Testcase/TestcaseList";
    }

    /**
     * 테스트케이스 등록 폼
     * URL: /Testcase/WriteForm?p_no=1
     */
    @RequestMapping("/Testcase/WriteForm")
    public String writeForm(@RequestParam("p_no") int p_no, Model model, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        // 폼에서 사용할 기본 객체
        TestcaseDTO dto = new TestcaseDTO();
        dto.setP_no(p_no);

        model.addAttribute("p_no", p_no);
        model.addAttribute("tc", dto);

        return "Testcase/TestcaseWriteForm";
    }

    /**
     * 테스트케이스 등록 처리
     * POST: /Testcase/Write
     */
    @PostMapping("/Testcase/Write")
    public String write(TestcaseDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        // 최소 유효성(비어있으면 다시 폼)
        if (dto.getP_no() == 0 || dto.getTc_input() == null || dto.getTc_output() == null) {
            return "redirect:/Testcase/WriteForm?p_no=" + dto.getP_no();
        }

        // 등록
        testcaseDAO.insertDao(dto);

        // 등록 후 목록으로
        return "redirect:/Testcase/List?p_no=" + dto.getP_no();
    }

    /**
     * 테스트케이스 수정 폼
     * URL: /Testcase/UpdateForm?tc_no=10001
     */
    @RequestMapping("/Testcase/UpdateForm")
    public String updateForm(@RequestParam("tc_no") int tc_no, Model model, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        TestcaseDTO tc = testcaseDAO.viewDao(tc_no);
        if (tc == null) {
            // 없으면 그냥 메인 또는 목록으로
            return "redirect:/";
        }

        model.addAttribute("tc", tc);
        model.addAttribute("p_no", tc.getP_no());

        return "Testcase/TestcaseUpdateForm";
    }

    /**
     * 테스트케이스 수정 처리
     * POST: /Testcase/Update
     */
    @PostMapping("/Testcase/Update")
    public String update(TestcaseDTO dto, HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        // tc_no 없으면 처리 불가
        if (dto.getTc_no() == 0) {
            return "redirect:/";
        }

        // 수정
        testcaseDAO.updateDao(dto);

        // 수정 후 목록으로
        return "redirect:/Testcase/List?p_no=" + dto.getP_no();
    }

    /**
     * 테스트케이스 삭제
     * URL: /Testcase/Delete?tc_no=10001&p_no=1
     */
    @RequestMapping("/Testcase/Delete")
    public String delete(@RequestParam("tc_no") int tc_no,
                         @RequestParam("p_no") int p_no,
                         HttpSession session) {

        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/Member/MemberLoginForm";
        }

        testcaseDAO.deleteDao(tc_no);

        return "redirect:/Testcase/List?p_no=" + p_no;
    }
}