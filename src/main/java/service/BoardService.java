package service;

import dto.BoardDTO;

import java.util.List;
import java.util.Map;

public interface BoardService {
    // 게시글 작성
    void writeBoard(BoardDTO boardDTO);

    // 게시글 목록 조회 (카테고리별)
    Map<String, Object> getBoardList(String category, int page);
    
    // 전체 게시글 목록 조회
    List<BoardDTO> getAllBoardList();

    // 게시글 상세 조회
    BoardDTO getBoardDetail(int boardId);

    // 게시글 수정
    void updateBoard(BoardDTO boardDTO);

    // 게시글 삭제
    void deleteBoard(int boardId);
    
    // 검색 기능
    List<BoardDTO> searchBoards(String searchKeyword);

}
