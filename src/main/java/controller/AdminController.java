package controller;

import java.util.List;

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
    
    // 관리자 로그인 처리
    @PostMapping("/login")
    public String adminLoginProcess(@RequestParam String userId, @RequestParam String password, HttpSession session) {
        // 로그인한 계정이 "admin"이고 비밀번호가 일치할 때만 관리자 권한 부여
        if (userService.authenticateAdmin(userId, password)) {
            session.setAttribute("adminLogin", true); // 세션에 관리자 로그인 상태 저장
            session.setAttribute("userId", userId); // 세션에 관리자 userId 저장
            return "redirect:/admin/boards"; // 로그인 성공 후 게시글 목록으로 이동
        }
        return "admin/login"; // 로그인 실패 시 로그인 페이지로 다시 이동
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션을 무효화하여 로그아웃 처리
        return "redirect:/admin/login"; // 로그아웃 후 로그인 페이지로 이동
    }
        
    // 공지사항 등록 페이지로 이동 (관리자만 접근 가능)
    @GetMapping("/addNotice")
    public String addNoticeForm(Model model, HttpSession session) {
        // 관리자인지 세션 확인
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login"; // 관리자 권한 없으면 로그인 페이지로 리다이렉트
        }

        model.addAttribute("board", new BoardDTO());
        return "admin/addNotice"; // 공지사항 등록 페이지
    }

    // 공지사항 등록 처리
    @PostMapping("/addNotice")
    public String addNoticeProcess(@ModelAttribute BoardDTO boardDTO, HttpSession session) {
        // 관리자인지 세션 확인
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login"; // 관리자 권한 없으면 로그인 페이지로 리다이렉트
        }

        boardDTO.setIsNotice(1); // 공지사항 설정
        boardService.addNotice(boardDTO); // 공지사항 등록
        return "redirect:/admin/boards"; // 등록 후 게시글 목록으로 이동
    }
    
    // 게시글 목록 조회 (공지사항 포함 상단 고정)
    @GetMapping("/boards")
    public String getBoardList(Model model, HttpSession session) {
        // 관리자인지 세션 확인
        if (session.getAttribute("adminLogin") == null) {
            return "redirect:/admin/login"; // 관리자 권한 없으면 로그인 페이지로 리다이렉트
        }

        List<BoardDTO> boardList = boardService.getAllBoardList(); // 공지사항을 포함한 게시글 목록
        model.addAttribute("boardList", boardList);
        return "admin/boardList"; // 게시글 목록 페이지
    }
}