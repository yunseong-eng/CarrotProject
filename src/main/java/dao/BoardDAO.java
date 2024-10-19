package dao;

import dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {
    // 게시글 작성 (공지사항 포함)
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

    // 조회수 증가
    void increaseViews(int boardId);
    
    // 공지사항 상단 고정 목록 조회
    List<BoardDTO> getFixedNotices();
    
    // 공지사항 등록
    void insertNotice(int boardId);
}
