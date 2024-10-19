package dao;

import dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {
    // 게시글 작성
    void insertBoard(BoardDTO boardDTO);

    // 게시글 목록 조회 (카테고리별)
    List<BoardDTO> getBoardListByCategory(Map<String, Object> map);
    
    // 전체 게시글 목록 조회
    List<BoardDTO> getAllBoardList();

    // 게시글 상세 조회
    BoardDTO getBoardDetail(int boardId);

    // 게시글 수정
    void updateBoard(BoardDTO boardDTO);

    // 게시글 삭제
    void deleteBoard(int boardId);
    
    // 자식 댓글 삭제 (게시글 삭제 전에 자식 댓글 먼저 삭제)
    void deleteChildCommentsByBoardId(int boardId);

    // 부모 댓글 삭제 (자식 댓글 삭제 후 부모 댓글 삭제)
    void deleteParentCommentsByBoardId(int boardId);

    // 조회수 증가
    void increaseViews(int boardId);
    
    // 검색 기능 (제목, 작성자, 카테고리 검색)
    List<BoardDTO> searchBoards(String searchKeyword);
}
