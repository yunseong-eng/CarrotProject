package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.BoardDTO;
import service.BoardService;
import service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BoardService boardService;
    
    @Autowired
    private UserService userService;

    // 관리자 로그인 페이지 이동
    @GetMapping("/login")
    public String adminLoginForm() {
        return "admin/login"; // 로그인 폼 페이지
    }
        
    // 공지사항 등록 페이지로 이동
    @GetMapping("/addNotice")
    public String addNoticeForm(Model model) {
        model.addAttribute("board", new BoardDTO());
        return "admin/addNotice"; // 공지사항 등록 페이지
    }

    @PostMapping("/addNotice")
    public String addNoticeProcess(@ModelAttribute BoardDTO boardDTO) {
        boardDTO.setIsNotice(1); // 공지사항 설정
        boardService.addNotice(boardDTO); // 공지사항 등록
        return "redirect:/admin/boards"; // 등록 후 게시글 목록으로 이동
    }
    
    // 관리자 로그인 처리
    @PostMapping("/login")
    public String adminLoginProcess(@RequestParam String userId, @RequestParam String password, HttpSession session) {
        if (userService.authenticateAdmin(userId, password)) {
            session.setAttribute("adminLogin", true); // 세션에 관리자 로그인 상태 저장
            return "redirect:/admin/boards"; // 로그인 성공 후 게시글 목록으로 이동
        }
        return "admin/login"; // 로그인 실패 시 로그인 페이지로 다시 이동
    }
}