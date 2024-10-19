package service.impl;

import dao.BoardDAO;
import dto.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.BoardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    private static final int PAGE_SIZE = 10; // 페이지당 게시글 수

    // 게시글 작성 (공지사항 포함)
    @Override
    public void writeBoard(BoardDTO boardDTO) {
        boardDAO.insertBoard(boardDTO); // 게시글만 저장
    }

    // 게시글 목록 조회 (카테고리별)
    @Override
    public Map<String, Object> getBoardList(String category, int page) {
        int startNum = (page - 1) * PAGE_SIZE;
        Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("startNum", startNum);
        map.put("pageSize", PAGE_SIZE);

        // 일반 게시글 목록 가져오기
        List<BoardDTO> boardList = boardDAO.getBoardListByCategory(map);

        // 공지사항 목록 가져오기 (상단 고정)
        List<BoardDTO> noticeList = boardDAO.getFixedNotices();

        // 결과 저장
        Map<String, Object> result = new HashMap<>();
        result.put("boardList", boardList);  // 일반 게시글 목록
        result.put("noticeList", noticeList); // 공지사항 목록

        return result;
    }

    // 전체 게시글 목록 조회
    @Override
    public List<BoardDTO> getAllBoardList() {
        return boardDAO.getAllBoardList();
    }

    // 게시글 상세 조회
    @Override
    public BoardDTO getBoardDetail(int boardId) {
        boardDAO.increaseViews(boardId); // 조회수 증가
        return boardDAO.getBoardDetail(boardId);
    }

    // 게시글 수정
    @Override
    public void updateBoard(BoardDTO boardDTO) {
        boardDAO.updateBoard(boardDTO); // 게시글 수정
    }

    // 게시글 삭제
    @Override
    public void deleteBoard(int boardId) {
        boardDAO.deleteBoard(boardId); // 게시글 삭제
    }

    // 공지사항 등록
    @Override
    public void addNotice(BoardDTO boardDTO) {
        boardDTO.setIsNotice(1); // 공지사항으로 설정
        boardDAO.insertBoard(boardDTO); // 게시글을 등록

        // 공지사항을 post_notice 테이블에 등록
        boardDAO.insertNotice(boardDTO.getBoardId());
    }

    // 공지사항 상단 고정 목록 조회
    @Override
    public List<BoardDTO> getFixedNotices() {
        return boardDAO.getFixedNotices(); // 공지사항 목록 조회
    }
}
