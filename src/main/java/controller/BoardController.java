package controller;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import service.BoardService;
import service.CommentService;
import service.ObjectStorageService;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ObjectStorageService objectStorageService; // 네이버 클라우드 파일 업로드 서비스 주입

    private String bucketName = "bitcamp-9th-bucket-143"; // 네이버 클라우드 버킷 이름

    // 전체 게시글 목록 보기
    @GetMapping("/listAll")
    public String boardListAll(Model model) {
        List<BoardDTO> boardList = boardService.getAllBoardList();
        model.addAttribute("boardList", boardList);
        return "/board/listForm"; // 전체 게시글 목록을 보여주는 페이지
    }

    // 게시글 목록 보기
    @GetMapping("/listForm")
    public String boardList(@RequestParam String category,
                            @RequestParam(defaultValue = "1") int page,
                            Model model) {
        // 전체 목록 보기
        Map<String, Object> result;
        if ("전체".equals(category)) {
            result = boardService.getBoardList("전체", page);
        } else {
            result = boardService.getBoardList(category, page);
        }
        model.addAttribute("boardList", result.get("boardList"));
        model.addAttribute("category", category);

        return "/board/listForm";
    }

    // 게시글 작성 폼 이동
    @GetMapping("/writeForm")
    public String writeForm(HttpSession session, Model model) {
        UserDTO currentUser = (UserDTO) session.getAttribute("user");

        if (currentUser != null) {
            model.addAttribute("currentUserId", currentUser.getUserId());
        }

        return "/board/writeForm";
    }

    // 게시글 작성 처리 (이미지 업로드 추가)
    @PostMapping(value = "/write", produces = "text/html; charset=UTF-8")
    public String writeBoard(@ModelAttribute BoardDTO boardDTO,
                             @RequestParam("file") MultipartFile file,
                             HttpSession session) {
        // 로그인된 사용자 정보 가져오기
        UserDTO loggedInUser = (UserDTO) session.getAttribute("user");

        // 세션에 로그인된 사용자가 없을 경우 로그인 페이지로 리다이렉트
        if (loggedInUser == null) {
            return "redirect:/user/login";
        }

        // 로그인된 사용자의 userId 설정
        boardDTO.setUserId(loggedInUser.getUserId());

        // 배송비가 없는 경우 0으로 설정
        if (boardDTO.getShippingFee() == null || boardDTO.getShippingFee().isEmpty()) {
            boardDTO.setShippingFee("0");
        }

        // 이미지 파일 처리 (네이버 클라우드에 업로드)
        if (!file.isEmpty()) {
            try {
                // 네이버 클라우드로 파일 업로드
                String storedFileName = objectStorageService.uploadFile(bucketName, "board/", file);

                // 저장되는 파일 이름에서 경로 제거하고 파일 이름만 저장
                String fileNameOnly = storedFileName.substring(storedFileName.lastIndexOf("/") + 1);
                boardDTO.setImageFileName(fileNameOnly); // 파일 이름만 저장

            } catch (Exception e) {
                e.printStackTrace();
                return "error";  // 오류 발생 시 에러 페이지로 리다이렉트
            }
        }

        // 게시글 저장
        boardService.writeBoard(boardDTO);

        // 카테고리 값을 URL 인코딩 처리
        String encodedCategory = URLEncoder.encode(boardDTO.getCategory(), StandardCharsets.UTF_8);

        return "redirect:/board/listForm?category=" + encodedCategory;
    }

    // 게시글 상세 보기
    @GetMapping("/detailForm/{boardId}")
    public String boardDetail(@PathVariable int boardId, Model model, HttpSession session) {
        BoardDTO boardDTO = boardService.getBoardDetail(boardId);
        System.out.println("이미지 경로: " + boardDTO.getImageFileName());
        model.addAttribute("board", boardDTO);

        // 댓글 목록을 조회하여 model에 추가
        List<CommentDTO> commentList = commentService.getCommentList(boardId);
        model.addAttribute("commentList", commentList);  // 댓글 목록을 모델에 추가

        // 현재 로그인된 사용자 ID 추가
        UserDTO currentUser = (UserDTO) session.getAttribute("user");
        if (currentUser != null) {
            model.addAttribute("currentUserId", currentUser.getUserId());
        }

        return "/board/detailForm";  // 상세페이지로 이동
    }

    // 게시글 수정 폼 이동
    @GetMapping("/updateForm/{boardId}")
    public String updateForm(@PathVariable int boardId, Model model) {
        BoardDTO boardDTO = boardService.getBoardDetail(boardId);
        model.addAttribute("board", boardDTO);
        return "/board/updateForm";
    }

    // 게시글 삭제 처리
    @PostMapping("/delete")
    public String deleteBoard(@RequestParam int boardId, @RequestParam String category) {
        boardService.deleteBoard(boardId);

        // 카테고리 값을 URL 인코딩 처리
        String encodedCategory = URLEncoder.encode(category, StandardCharsets.UTF_8);

        return "redirect:/board/listForm?category=" + encodedCategory;
    }
    
    @GetMapping("/boards")
    public String getBoardList(Model model) {
        List<BoardDTO> fixedNotices = boardService.getFixedNotices(); // 공지사항 목록
        List<BoardDTO> boardList = boardService.getAllBoardList(); // 일반 게시글 목록
        model.addAttribute("fixedNotices", fixedNotices);
        model.addAttribute("boardList", boardList);
        return "board/boardList"; // 게시글 목록 페이지
    }
}
